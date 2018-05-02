# Projet Data Mining
# Loïc Mahier && Demetre Phalavandishvili
# Modéle pour prédire PrevionnelAnnuel à l'aide d'une regression linéaire multiple
# -----------------------------------------------------------------------------------

# on charge le fichier de données
data <- read.csv("C:\\Users\\Loïc\\Downloads\\Data_Mining\\projet\\Alphaprise_previsionAnnuel.csv", header = TRUE, sep = ",")

# nécéssaire pour utiliser splt
require(caTools)

# on divise nos données en 2 ( 75% apprentissage - 25% test)
sample <- sample.split(data, SplitRatio = 0.75)
apprentissage <- subset(data, sample == TRUE)
test <- subset(data, sample == FALSE)

# regression linéaire multiple
modeleReg <- lm(PrevisionnelAnnuel ~ . , data = apprentissage) # le "." signifie qu'on prend toutes les variables


# ------------------------------------
# Diverses Fonctions

# summary() permet de produire les sorties pour chaque regression présentées précédemment. Ainsi, cette fonction affiche : les coefficients estimés, leur écart-type, et la valeur de la statistique t de Student ainsi que la p-value (probabilité que le coefficient soit significativement différent de zéro) associées à chaque coefficient. Sont aussi présentés le R2 et R2 ajusté, ainsi que la statistique F de Fisher (testant la significativité globales des variables), son degré de liberté, et la p-value associée.
summary(modeleReg)

# Qualité du modèle :
# Multiple R-squared:  0.9964,	Adjusted R-squared:  0.9963 
# Plus sa valeur est proche de 1, et plus l'adéquation entre le modèle et les données observées va être forte. Cependant, cette valeur est fortement influencée, entre autres, par le nombre de variables explicatives incluses dans la regression. Le R2 ajusté (Adjusted R-Squared) va alors tenir compte de ce nombre et sera donc plus correct.


# coef() permet de n'extraire que les coefficients estimés.
# coef(modeleReg)

# confint() permet d'afficher l'intervalle de confiance à 95% pour les coefficients estimés.
# confint(modeleReg)

# fitted() permet d'extraire les valeurs prédites.
# fitted(modeleReg)

# resid() permet d'extraire les résidus (Valeur prédite - Valeur réelle).
# resid(modeleReg)
# ------------------------------------


# La fonction predict() permet de prédire la valeur de y (i.e du prix) pour de nouvelles données (des variables explicatives). Seul les deux premiers arguments sont requis : se.fit permet d'afficher l'écart-type de la valeur prédite, et interval et level permettent afficher ici les valeurs de l'intervalle de confiance fixé à 99%.
# predict(modeleReg, test, se.fit=TRUE, interval = "prediction", level = 0.99)


res = predict(modeleReg, test)
res 

write.csv(res, file ="C:\\Users\\Loïc\\Downloads\\Data_Mining\\projet\\Alphaprise_previsionAnnuel_predict_test.csv")
