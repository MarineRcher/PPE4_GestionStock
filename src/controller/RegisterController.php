<?php

include '../Core/controller.php';
class RegisterController extends Controller {

    public function addUser()
    {
        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email']) && isset($_POST['password'])) {
            if ($_POST['passwordConfirm'] == $_POST['password']) {
                $nom = $_POST['name'];
                $prenom = $_POST['lastName'];
                $email = $_POST['email'];
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hashage du mot de passe


                if ($user) {
                    $message = 'Cet email est déjà utilisé.';
                } else {
                   AddUser();
                }
            } else {
                $message = 'Les deux mot de passes doivent être les mêmes';
            }
        }
    }

}


?>