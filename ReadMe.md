<h1>AP 4 - Gestion de stock pour un laboratoire</h1>

Afin d'installer le projet, il faut avoir docker et un editeur de code.
Il suffit de lancer les fichiers docker depuis la racine du projet:
``` docker build .```
```docker compose up ```

Aller dans /PPE4_GestionStock/src/SQL, et lancer :
``docker cp GSB.sql mysql_db_stock:/``

Dans Desktop Docker, on retrouve dans le container ce fichier,
ensuite il faut se connecter sur mysql avec :
mysql -u root -p
mot de passe : root

Puis pour finir entrer 
```source GSB.sql```