final int SCORE_BONUS = 20;
final int SCORE_MONSTER_DESTROYED = 100;
final color orange = color(247, 134, 0);

//parametres pour l'animation du mur destructible
int currentImageIndex = 0;
final int interval = 150; // interval en millisecondes
int lastImageSwitchTime = 0;

//Parametres pour l'animation de la porte de sortie
int currentDoorIndex = 0;
int lastDoorSwitchTime = 0;

int column = 1;
int line = 1;
