<?php

namespace controller;
require_once __DIR__ . '/../Config/Config.php';
class JWT
{
    /**
     * Génère le tableau de données nécessaire à la création du JWT
     *
     * @param string $id
     * @param string $email
     * @param string $role
     * @return array
     */
    public function generer_payload(
        string $id,
        string $email,
        string $role
    ): array {
        return [
            "user_id" => $id,
            "user_email" => $email,
            "user_role" => $role,
        ];
    }

    /**
     * Génère le JWT sous forme de chaine de caractère
     *
     * @param array $payload
     * @param int $validite
     * @return string
     */
    public function generer_jwt(array $payload, int $validite = 14400): string
    {
        if ($validite > 0) {
            $now = new \DateTime();
            $expiration = $now->getTimestamp() + $validite;
            $payload["iat"] = $now->getTimestamp();
            $payload["exp"] = $expiration;
        }

        $base_64_header = base64_encode(json_encode(JWT_HEADER));
        $base_64_payload = base64_encode(json_encode($payload));

        // suppression et remplacement des caracteres interdit pour JWT
        $base_64_header = str_replace(
            ["+", "/", "="],
            ["-", "_", ""],
            $base_64_header,
        );
        $base_64_payload = str_replace(
            ["+", "/", "="],
            ["-", "_", ""],
            $base_64_payload,
        );

        //generation de la signature
        $secret = base64_encode(JWT_SECRET);
        $signature = hash_hmac(
            "sha256",
            $base_64_header . "." . $base_64_payload,
            $secret,
            true,
        );

        $base_64_signature = base64_encode($signature);
        $base_64_signature = str_replace(
            ["+", "/", "="],
            ["-", "_", ""],
            $base_64_signature,
        );

        //generation du token
        $jwt =
            $base_64_header . "." . $base_64_payload . "." . $base_64_signature;

        return $jwt;
    }





    /**
     * Récupère le payload contenue dans le token JWT
     *
     * @param string $token
     * @return array
     */
    public function get_payload(string $token): array
    {
        $array = explode(".", $token);
        $payload = $array[1];

        return json_decode(base64_decode($payload), true);
    }







}