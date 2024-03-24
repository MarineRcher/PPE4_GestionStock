<?php

require_once __DIR__ . '/../controller/stockOutController.php';
require_once __DIR__ . '/../model/stock.php';

$stock=new controller\stockOutController();

$data=$stock->finStock();

?>
    <head>
        <meta charset="utf-8">
        <title>Laboratoire GSB</title>
        <link rel="stylesheet" href="../styles/GestionUtilisateurs.css">
    </head>

<?php


require __DIR__ . '/../Vue/Header.php';
if(empty($data)){

}else{
?>
<h3>Produits prochainement en rupture de stock</h3>

<?php

foreach ($data as $item) {

    echo "<li>".$item['nom']." : ".$item['quantite_disponible']."</li>";
}
}
?>

<?php


require __DIR__ . '/../Vue/Footer.php';
?>