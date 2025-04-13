# visualize.R
# Ce script crée une visualisation non triviale avec des graphiques multiples en utilisant les fonctions de base de R.
# On utilise le jeu de données intégré mtcars et on génère quatre graphiques dans une même image.
# Le graphique résultant est sauvegardé en PNG dans le fichier "visualization_baseR.png".

# Charger les données (mtcars est déjà présent dans R)
data(mtcars)

# Ouvre un dispositif graphique pour sauvegarder le résultat dans un fichier PNG
png(filename = "visualization_baseR.png", width = 800, height = 600)

# Configure la mise en page pour afficher 4 graphiques (2 lignes, 2 colonnes)
par(mfrow = c(2, 2), mar = c(4, 4, 3, 2))  # ajustement des marges

### Graphique 1 : Nuage de points avec ligne de régression
plot(mtcars$wt, mtcars$mpg,
     pch = 19, col = "blue",
     main = "Mpg vs Poids",
     xlab = "Poids (en 1000 lbs)",
     ylab = "Miles par Gallon (mpg)")
# Calcul et ajout de la ligne de régression
modele <- lm(mpg ~ wt, data = mtcars)
abline(modele, col = "red", lwd = 2)
legend("topright", legend = c("Données", "Régression"),
       pch = c(19, NA), lty = c(NA, 1), col = c("blue", "red"))

### Graphique 2 : Histogramme de mpg
hist(mtcars$mpg,
     col = "lightgreen", border = "white",
     main = "Distribution de MPG",
     xlab = "Miles par Gallon (mpg)")

### Graphique 3 : Boxplot de mpg selon le nombre de cylindres
boxplot(mtcars$mpg ~ mtcars$cyl,
        col = "orange",
        main = "MPG par Cylindre",
        xlab = "Nombre de cylindres",
        ylab = "MPG")

### Graphique 4 : Courbe de puissance cumulée (hp) ordonnée par poids
# Ordonner les puissances (hp) selon le poids (wt)
indices <- order(mtcars$wt)
hp_ordonnee <- mtcars$hp[indices]
plot(hp_ordonnee,
     type = "l", col = "purple", lwd = 2,
     main = "Puissance ordonnée par Poids",
     xlab = "Index (après tri par poids)",
     ylab = "Puissance (hp)")
points(hp_ordonnee, col = "purple", pch = 16)

# Ferme le dispositif graphique pour sauvegarder le fichier
dev.off()

# Afficher un message de confirmation
cat("La visualisation a été sauvegardée dans 'visualization_baseR.png'\n")
