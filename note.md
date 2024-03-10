

- filtre par nom
- Form commande : input quantité peu voyant
- Format date formulaire commande en format usa


- Ajout table "trace_utilisateur"

select C.id_commande, C.date_commande, C.statut, C.date_disponibilite, categorie from gsb.commandes as C join gsb.details_commande as D on D.id_commande = C.id_commande join gsb.stock as S on S.id_stock = D.id_stock where id_utilisateur = 1