<?php

namespace model;

class Medications
{
    public $name;
    public $description;

    public $quantity;

    public $price;
    public function __construct ($name, $description, $quantity, $price)
    {
        $this-> name = $name;
         $this-> description = $description;
         $this-> quantity = $quantity;
         $this-> price = $price;

    }

}