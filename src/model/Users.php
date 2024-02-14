<?php

namespace model;

class Users
{
    public $name;
    public $lastName;
    public $email;

    public function __construct($name, $lastName, $email)
    {
        $this->name = $name;
        $this->lastName=$lastName;
        $this->email=$email;
    }

}