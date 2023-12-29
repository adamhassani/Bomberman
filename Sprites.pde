enum TypeSpriteHero
{
  GOING_LEFT, FRONT, GOING_RIGHT, BACK_LEFT, BACK, BACK_RIGHT, SIDE_LEFT, MOVE_SIDE_LEFT,
    SIDE_RIGHT, MOVE_SIDE_RIGHT, START_DEATH, DEATH1, DEATH2, DEATH3, DEATH4, FINAL_DEATH,
    SEMI_MOVE_LEFT, SEMI_MOVE_RIGHT
}

enum TypeSpriteLevel
{
  EMPTY, EMPTY_UNDER_DESTRUCTIBLE_WALL, EMPTY_UNDER_BUILD, WALL, BOTTOM_EDGE, TOP_EDGE, LEFT_EDGE,
    RIGHT_EDGE, BOTTOM_LEFT, BOTTOM_RIGHT, TOP_LEFT, TOP_RIGHT, DESTRUCTIBLE_WALL1, DESTRUCTIBLE_WALL2, DESTRUCTIBLE_WALL3, DESTRUCTIBLE_WALL4,
    DESTRUCTIBLE_WALL_UNDER_BUILD1, DESTRUCTIBLE_WALL_UNDER_BUILD2, DESTRUCTIBLE_WALL_UNDER_BUILD3, DESTRUCTIBLE_WALL_UNDER_BUILD4, EXIT_DOOR1, EXIT_DOOR2
}

class Sprites {
  PImage allSprites;
  int boardSpriteSize;
  int bombermanSpriteWidth;
  int bombermanSpriteHeight;
  
  //parametres pour l'animation du mur destructible
  int currentImageIndex = 0;
  int interval = 250; // interval en millisecondes
  int lastImageSwitchTime = 0;
  
  //Parametres pour l'animation de la porte de sortie
  int currentDoorIndex = 0;
  int lastDoorSwitchTime = 0;

  Sprites(String filepath) {
    allSprites = loadImage(filepath);
    boardSpriteSize = 16;
    bombermanSpriteWidth = 16;
    bombermanSpriteHeight = 24;
  }

  HashMap<TypeSpriteHero, PImage> defSpriteBomberman() {
    HashMap<TypeSpriteHero, PImage> sprites = new HashMap<>();

    //STATIC
    sprites.put(TypeSpriteHero.FRONT, allSprites.get(bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.BACK, allSprites.get(4 * bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.SIDE_LEFT, allSprites.get(0, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.SIDE_RIGHT, allSprites.get(3 * bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));

    //MOVING
    sprites.put(TypeSpriteHero.GOING_LEFT, allSprites.get(0, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.GOING_RIGHT, allSprites.get(2 * bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.BACK_LEFT, allSprites.get(3 * bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.BACK_RIGHT, allSprites.get(5 * bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.MOVE_SIDE_LEFT, allSprites.get(bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.MOVE_SIDE_RIGHT, allSprites.get(4 * bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.SEMI_MOVE_LEFT, allSprites.get(2 * bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.SEMI_MOVE_RIGHT, allSprites.get(5 * bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));


    //DEATH
    sprites.put(TypeSpriteHero.START_DEATH, allSprites.get(0, 2 * bombermanSpriteWidth, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.DEATH1, allSprites.get(bombermanSpriteWidth, 2 * bombermanSpriteWidth, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.DEATH2, allSprites.get(2 * bombermanSpriteWidth, 2 * bombermanSpriteWidth, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.DEATH3, allSprites.get(3 * bombermanSpriteWidth, 2 * bombermanSpriteWidth, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.DEATH4, allSprites.get(4 * bombermanSpriteWidth, 2 * bombermanSpriteWidth, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.FINAL_DEATH, allSprites.get(5 * bombermanSpriteWidth, 2 * bombermanSpriteWidth, bombermanSpriteWidth, bombermanSpriteHeight));

    return sprites;
  }

  HashMap<TypeSpriteLevel, PImage> defSpritesLevel() {

    HashMap<TypeSpriteLevel, PImage> sprites = new HashMap<>();

    //EMPTY
    sprites.put(TypeSpriteLevel.EMPTY, allSprites.get(3 * boardSpriteSize, 6 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.EMPTY_UNDER_DESTRUCTIBLE_WALL, allSprites.get(4 * boardSpriteSize, 6 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.EMPTY_UNDER_BUILD, allSprites.get(3 * boardSpriteSize, 5 * boardSpriteSize, boardSpriteSize, boardSpriteSize));

    //WALL
    sprites.put(TypeSpriteLevel.WALL, allSprites.get(5 * boardSpriteSize, 6 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.BOTTOM_EDGE, allSprites.get(2 * boardSpriteSize, 6 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.TOP_EDGE, allSprites.get(3 * boardSpriteSize, 4 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.LEFT_EDGE, allSprites.get(1 * boardSpriteSize, 5 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.RIGHT_EDGE, invertSprite(sprites.get(TypeSpriteLevel.LEFT_EDGE)));
    sprites.put(TypeSpriteLevel.BOTTOM_LEFT, allSprites.get(1 * boardSpriteSize, 6 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.BOTTOM_RIGHT, invertSprite(sprites.get(TypeSpriteLevel.BOTTOM_LEFT)));
    sprites.put(TypeSpriteLevel.TOP_LEFT, allSprites.get(1 * boardSpriteSize, 4 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.TOP_RIGHT, invertSprite(sprites.get(TypeSpriteLevel.TOP_LEFT)));


    //DESTRUCTIBLE_WALL
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL1, allSprites.get(4 * boardSpriteSize, 4 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL2, allSprites.get(5 * boardSpriteSize, 4 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL3, allSprites.get(6 * boardSpriteSize, 4 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL4, allSprites.get(7 * boardSpriteSize, 4 * boardSpriteSize, boardSpriteSize, boardSpriteSize));

    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD1, allSprites.get(4 * boardSpriteSize, 5 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD2, allSprites.get(5 * boardSpriteSize, 5 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD3, allSprites.get(6 * boardSpriteSize, 5 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD4, allSprites.get(7 * boardSpriteSize, 5 * boardSpriteSize, boardSpriteSize, boardSpriteSize));

    //EXIT_DOOR
    sprites.put(TypeSpriteLevel.EXIT_DOOR1, allSprites.get(8 * boardSpriteSize, 3 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.EXIT_DOOR2, allSprites.get(9 * boardSpriteSize, 3 * boardSpriteSize, boardSpriteSize, boardSpriteSize));


    return sprites;
  }

  PImage invertSprite(PImage sprite) {

    PImage invertedSprite = createImage(sprite.width, sprite.height, ARGB);

    for (int x = 0; x < sprite.width; x++) {
      for (int y = 0; y < sprite.width; y++) {
        int currentColor = sprite.get(x, y);
        invertedSprite.set(sprite.width - x - 1, y, currentColor);
      }
    }
    return invertedSprite;
  }

  void animatedWall(float posX, float posY, Board board, TypeSpriteLevel type) {
    HashMap<TypeSpriteLevel, PImage> definedSprites = defSpritesLevel();
    PImage[] animation = new PImage[4];

    if (type == TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD1) {
      animation[0] = definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD1);
      animation[1] = definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD2);
      animation[2] = definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD3);
      animation[3] = definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD4);
    } else if (type == TypeSpriteLevel.DESTRUCTIBLE_WALL1) {
      animation[0] = definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL1);
      animation[1] = definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL2);
      animation[2] = definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL3);
      animation[3] = definedSprites.get(TypeSpriteLevel.DESTRUCTIBLE_WALL4);
    }

    if (millis() - lastImageSwitchTime > interval) {
      currentImageIndex = (currentImageIndex + 1) % animation.length;
      lastImageSwitchTime = millis();
    }
    image(animation[currentImageIndex], posX, posY, board._cellSize, board._cellSize);
  }


  void animatedDoor(float posX, float posY, Board board) {
    HashMap<TypeSpriteLevel, PImage> definedSprites = defSpritesLevel();
    PImage[] animation = new PImage[2];

      animation[0] = definedSprites.get(TypeSpriteLevel.EXIT_DOOR1);
      animation[1] = definedSprites.get(TypeSpriteLevel.EXIT_DOOR2);
    
    //Utilisation de random pour un rendu plus realiste de l'animation de la porte
    if (millis() - lastDoorSwitchTime > int(random(50,500))) {
      currentDoorIndex = (currentDoorIndex + 1) % animation.length;
      lastDoorSwitchTime = millis();
    }
    image(animation[currentDoorIndex], posX, posY, board._cellSize, board._cellSize);
  }
  
  
  boolean areSpritesEqual(PImage sprite1, PImage sprite2) {
    if (sprite1.width != sprite2.width || sprite1.height != sprite2.height) {
      return false;
    }

    // Comparez les pixels de chaque image
    for (int x = 0; x < sprite1.width; x++) {
      for (int y = 0; y < sprite1.height; y++) {
        int pixel1 = sprite1.get(x, y);
        int pixel2 = sprite2.get(x, y);

        if (pixel1 != pixel2) {
          return false;
        }
      }
    }

    return true;
  }
}
