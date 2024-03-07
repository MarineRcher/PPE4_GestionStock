<?php

include_once '../Core/controller.php';
use src\Core\Controller;

$controller = new Controller();

class LoginController extends Controller {
    public function login()
    {
        session_start();
        if (isset($_SESSION['id_utilisateur'])) {
            header("Location: ../Vue/HomePage.php");
            exit;
        }

        $errorMessage = '';
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'], $_POST['password'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];

            $user_data = $this->model('Users');
           $user_data = $user_data->verify_user($email);

            if (!empty($user_data)) {
                if (password_verify($password, $user_data['mot_de_passe'])) {
                    $_SESSION['id_utilisateur'] = $user_data['id_utilisateur'];
                    $_SESSION['email_utilisateur'] = $user_data['email'];
                    header("Location: ../Vue/HomePage.php");

                    exit;
                } else {
                    $errorMessage = 'Email ou mot de passe incorrect.';
                }

            }else {
                $errorMessage = "Vous ne possédez pas de compte, merci de vous inscrire";

            }
            return $errorMessage;
        }


    }
}
?>