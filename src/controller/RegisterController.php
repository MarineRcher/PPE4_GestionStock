<?php
include_once __DIR__ . '/../Core/controller.php';
use src\Core\Controller;

$controller = new Controller();
class RegisterController extends Controller {

    public function addUser()
    {
        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['name'], $_POST['lastName'], $_POST['email'], $_POST['password']) && $_POST['email'] !== "") {

            if ($_POST['passwordConfirm'] == $_POST['password']) {
                $prenom = $_POST['name'];
                $nom = $_POST['lastName'];
                $email = $_POST['email'];
                if (preg_match("/^(?=.*[A-Z])(?=.*\d)(?=.*\W).{12,}$/", $_POST['password'])) {
                $motDePasse = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hashage du mot de passe

                $user_data = $this->model('Users');

                $user = $user_data-> verify_user($email);

                if (!empty($user)) {
                    $message = 'Cet email est déjà utilisé.';
                } else {

                    $user_data = $this->model('Users');

                    $user_data->registreUtilisateur($nom, $prenom, $email, $motDePasse);

                    $user_data->AddUser();


                   header("Location: index.php?page=login");
                }
                }else{
                    $message = 'Le mot de passe doit contenir au moins 12 caractères, 1 majuscule, 1 chiffre et 1 caractère spécial.';

                }
            } else {
                $message = 'Les deux mot de passes doivent être les mêmes';

            }

        } else {
            $message="Merci de remplir vos coordonnées";

        }
        return $message;
    }

}


?>