## Présentation

Ce projet universitaire, réalisé individuellement, avait pour objectif de modéliser et de concevoir une base de données SQL en troisième forme normale (3FN). Pour ce faire, j’ai identifié les attributs et appliqué les règles de normalisation à partir d’un énoncé fictif décrivant les besoins d’un client, en l’occurrence le directeur d’une bibliothèque. Dans le cadre de ce projet, j’ai également créé des requêtes SQL en fonction de l’énoncé fourni. 

## Résumer des documents

Vous pouvez retrouver dans ce répertoire GitHub le fichier “reponse” qui regroupe l’application des règles de normalisation et la table en 3FN, le schéma entité-association, ainsi que le code SQL permettant de concevoir la base de données.

## Les besoins du client:

Voici les besoins du client fictif et l’énoncé à suivre:

Le directeur d'une bibliothèque municipale a demandé notre aide pour moderniser la gestion de son établissement. Il souhaite utiliser un système informatique pour rendre le service aux usagers plus efficace. Actuellement, toutes les tâches administratives de la bibliothèque sont réalisées à la main, avec des fichiers écrits à la main. Cela demande beaucoup de travail aux employés. En ce moment, la bibliothèque compte 42 758 livres répartis dans 28 780 titres différents et 4 650 abonnés. Chaque année, environ 4 000 nouveaux livres sont acquis tandis que 400 anciens sont retirés. Le nombre d'abonnés augmente d'environ 200 par an, en tenant compte des inscriptions non renouvelées. Avec l'installation du nouveau système et l'amélioration du service, le directeur estime qu'il pourrait y avoir 300 abonnés supplémentaires par an.

Le système informatique devrait permettre à un abonné de retrouver un livre dans les rayons en connaissant son titre. Chaque livre est identifié par un code catalogue à l'achat et par un code rayon pour son emplacement dans la bibliothèque. De plus, l'abonné devrait pouvoir consulter la liste des livres d'un même auteur, par éditeur ou par genre (science-fiction, policier, bande dessinée, etc.). Les livres sont achetés en un ou plusieurs exemplaires et la date d'acquisition est enregistrée. Les exemplaires d'un même livre ont des codes rayons différents mais le même code catalogue, et peuvent être de différents éditeurs. Pour suivre l'état du stock, un code d'usure est attribué à chaque livre et mis à jour par un bibliothécaire à chaque retour.

Le directeur souhaite également mettre en place une recherche par mots-clés. Ainsi, il sera possible de retrouver tous les ouvrages correspondants à un mot-clé. Un ouvrage peut avoir plusieurs mots-clés. Le fichier des abonnés contient les coordonnées, la date d'adhésion, la date de naissance et la catégorie professionnelle (étudiant, enfant, etc.).

Pour la gestion des prêts, il est important de pouvoir connaître à tout moment la liste des livres empruntés par un abonné, ainsi que les abonnés détenant un livre non présent dans les rayons. Les prêts sont de 15 jours, renouvelables si aucun autre abonné n'a demandé le livre. Il faut enregistrer la date du prêt et de retour, ainsi que les livres demandés par un abonné. Ce dernier bénéficiera d'une priorité lors du retour du livre, maintenue pendant une semaine après la date de retour.

Les fonctions que le système devra effectuer sont la gestion des prêts, la mise à jour des fichiers des livres et des abonnés, la gestion des demandes non satisfaites, un système de relance automatique, une aide au choix d'un livre, ainsi que la possibilité d'établir des statistiques sur les emprunteurs en fonction de leur âge et profession.

## Travail demandé :
- Créer un schéma E/A qui représente la gestion de la bibliothèque. Justifiez vos choix en fonction des hypothèses.
- Identifiez dans ce schéma les éléments (entités et associations) ainsi que les règles concernant le nombre minimal et maximal de liens pour chaque association, selon la notation UML.
- Recherchez toutes les dépendances fonctionnelles dans cette base de données.
- Appliquez les règles de normalisation des tables pour obtenir un schéma relationnel en troisième forme normale, composé de tables.
- Identifiez dans chaque table les clés primaires et les clés étrangères.
- Créer une base de données pour la gestion du système informatique de la bibliothèque municipale.
- Intégrer dans cette base de données toutes les tables conceptualisées en troisième forme normale.
- Insérer au moins 20 lignes fictives dans chaque table.
- Effectuer cinq jointures impliquant deux tables.
- Effectuer cinq jointures impliquant trois tables.
- Réaliser trois requêtes avec une négation.
- Exécuter quatre requêtes SQL incluant chacune : MAX, AVG, SUM et BETWEEN.
