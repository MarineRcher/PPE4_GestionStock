<?php

include_once  __DIR__ . '/../Core/controller.php';
use src\Core\Controller;
include_once 'JWT.php';

$controller = new Controller();

class LoginController extends Controller {
    public function login()
    {

        if (isset($_SESSION['id_utilisateur'])) {
            header("Location: index.php?page=homepage");
            exit;
        }

        $errorMessage = '';
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'], $_POST['password'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];

            $user_model = $this->model('Users');
           $user_data = $user_model->verify_user($email);


            if (!empty($user_data)) {
                if($user_data['tentative'] < 5) {
                    if (password_verify($password, $user_data['mot_de_passe'])) {

                        $user_model->miseAJourTentative($user_data['id_utilisateur']);
                        $jwt = new \controller\JWT();
                        $payload = $jwt->generer_payload($user_data['id_utilisateur'], $user_data['email'], $user_data['role']);
                        setcookie("JWT", $jwt->generer_jwt($payload), time() + 14400);
                        header("Location: index.php?page=homepage");

                        exit;
                    } else {
                        $user_model->ajoutTentative($user_data['id_utilisateur']);
                        $errorMessage = 'Email ou mot de passe incorrect.';
                    }
                }else{
                    $errorMessage = "Nombre de tentatives de connexion trop importantes";
                }

            }else {
                $errorMessage = "Vous ne possédez pas de compte, merci de vous inscrire";

            }
            return $errorMessage;



        }

    }
}
?>
