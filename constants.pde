final int SCORE_BONUS = 20;
final int SCORE_MONSTER_DESTROYED = 100;
final color orange = color(247, 134, 0);

//parametres pour l'animation du mur destructible
int currentImageIndexDesWall = 0;
final int intervalDesWall = 150; // interval en millisecondes
int lastImageSwitchTimeDesWall = 0;

//Parametres pour l'animation de la porte de sortie
int currentImageIndexExit = 0;
int lastImageSwitchTimeExit = 0;

//Parametres pour l'animation du hero
int currentImageIndexHero = 0;
int lastImageSwitchTimeHero = 0;
final int intervalHero = 200;

//Etat des touches pour le moivement du hero
boolean keyUp = false;
boolean keyDown = false;
boolean keyRight = false;
boolean keyLeft = false;
