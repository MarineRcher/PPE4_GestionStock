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
Si Apache ne fonctionne pas, dans docker, aller dans web-1, puis files>etc/apache2/apache2.conf

Changer AllowOverride None par AllowOveride All dans le partie surlignée.

```
<Directory /var/www/>
	Options Indexes FollowSymLinks
	AllowOverride All
	Require all granted
</Directory>
```