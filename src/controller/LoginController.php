<?php

use model\Users;

include '../Core/Controller.php';
class LoginController extends Controller {
    public function login()
    {
        $this->model('Users');

        session_start();

        if (isset($_SESSION['id_utilisateur'])) {
            header("Location: ../../public/index.php");
            exit;
        }

        $errorMessage = '';
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'], $_POST['password'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];

            $user_data = new Users();
            $user_data = $user_data->verify_user($email);

            if (!empty($user_data)) {
                if (password_verify($password, $user_data['mot_de_passe'])) {
                    $_SESSION['id_utilisateur'] = $user_data['id_utilisateur'];
                    $_SESSION['email_utilisateur'] = $user_data['email'];
                    header("Location: ../../public/index.php");
                    exit;
                } else {
                    $errorMessage = 'Email ou mot de passe incorrect.';
                }

            }else {
                $errorMessage = "Vous ne possédez pas de compte, merci de vous inscrire";
            }
        }
        $this->view('SignIn', ['errorMessage' => $errorMessage]);

    }
}
?>