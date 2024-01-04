enum TypeSpriteHero
{
  GOING_DOWN1, STATIC_DOWN, GOING_DOWN2, GOING_UP1, STATIC_UP, GOING_UP2, STATIC_LEFT, GOING_LEFT1,
    GOING_LEFT2, STATIC_RIGHT, GOING_RIGHT1, GOING_RIGHT2, START_DEATH, DEATH1, DEATH2, DEATH3, DEATH4, FINAL_DEATH
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



  Sprites(String filepath) {
    allSprites = loadImage(filepath);
    boardSpriteSize = 16;
    bombermanSpriteWidth = 16;
    bombermanSpriteHeight = 24;
  }

  HashMap<TypeSpriteHero, PImage> defSpriteBomberman() {
    HashMap<TypeSpriteHero, PImage> sprites = new HashMap<>();

    //STATIC
    sprites.put(TypeSpriteHero.STATIC_DOWN, allSprites.get(bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.STATIC_UP, allSprites.get(4 * bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.STATIC_LEFT, allSprites.get(0, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.STATIC_RIGHT, allSprites.get(3 * bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));

    //MOVING
    sprites.put(TypeSpriteHero.GOING_DOWN1, allSprites.get(0, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.GOING_DOWN2, allSprites.get(2 * bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.GOING_UP1, allSprites.get(3 * bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.GOING_UP2, allSprites.get(5 * bombermanSpriteWidth, 0, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.GOING_LEFT1, allSprites.get(bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.GOING_LEFT2, allSprites.get(2 * bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.GOING_RIGHT1, allSprites.get(4 * bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));
    sprites.put(TypeSpriteHero.GOING_RIGHT2, allSprites.get(5 * bombermanSpriteWidth, bombermanSpriteHeight, bombermanSpriteWidth, bombermanSpriteHeight));


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

    if (millis() - lastImageSwitchTimeDesWall > intervalDesWall) {
      currentImageIndexDesWall = (currentImageIndexDesWall + 1) % animation.length;
      lastImageSwitchTimeDesWall = millis();
    }
    image(animation[currentImageIndexDesWall], posX, posY, board._cellSize, board._cellSize);
  }


  void animatedDoor(float posX, float posY, Board board) {
    HashMap<TypeSpriteLevel, PImage> definedSprites = defSpritesLevel();
    PImage[] animation = new PImage[2];

    animation[0] = definedSprites.get(TypeSpriteLevel.EXIT_DOOR1);
    animation[1] = definedSprites.get(TypeSpriteLevel.EXIT_DOOR2);

    //Utilisation de random pour un rendu plus realiste de l'animation de la porte
    if (millis() - lastImageSwitchTimeExit > int(random(50, 500))) {
      currentImageIndexExit = (currentImageIndexExit + 1) % animation.length;
      lastImageSwitchTimeExit = millis();
    }
    image(animation[currentImageIndexExit], posX, posY, board._cellSize, board._cellSize);
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

  void heroWalkingLeft(float posX, float posY, float size) {
    HashMap<TypeSpriteHero, PImage> definedSprites = defSpriteBomberman();
    PImage[] animation = new PImage[4];

    animation[0] = definedSprites.get(TypeSpriteHero.GOING_LEFT1);
    animation[1] = definedSprites.get(TypeSpriteHero.STATIC_LEFT);
    animation[2] = definedSprites.get(TypeSpriteHero.GOING_LEFT2);
    animation[3] = definedSprites.get(TypeSpriteHero.STATIC_LEFT);

    if (millis() - lastImageSwitchTimeHero > intervalHero) {
      currentImageIndexHero = (currentImageIndexHero + 1) % animation.length;
      lastImageSwitchTimeHero = millis();
    }
    image(animation[currentImageIndexHero], posX, posY, size, size * 3/2);
  }
  
  
  void heroWalkingRight(float posX, float posY, float size) {
    HashMap<TypeSpriteHero, PImage> definedSprites = defSpriteBomberman();
    PImage[] animation = new PImage[4];

    animation[0] = definedSprites.get(TypeSpriteHero.GOING_RIGHT1);
    animation[1] = definedSprites.get(TypeSpriteHero.STATIC_RIGHT);
    animation[2] = definedSprites.get(TypeSpriteHero.GOING_RIGHT2);
    animation[3] = definedSprites.get(TypeSpriteHero.STATIC_RIGHT);


    if (millis() - lastImageSwitchTimeHero > intervalHero) {
      currentImageIndexHero = (currentImageIndexHero + 1) % animation.length;
      lastImageSwitchTimeHero = millis();
    }
    image(animation[currentImageIndexHero], posX, posY, size, size * 3/2);
  }
  
  
  void heroWalkingUp(float posX, float posY, float size) {
    HashMap<TypeSpriteHero, PImage> definedSprites = defSpriteBomberman();
    PImage[] animation = new PImage[4];

    animation[0] = definedSprites.get(TypeSpriteHero.GOING_UP1);
    animation[1] = definedSprites.get(TypeSpriteHero.STATIC_UP);
    animation[2] = definedSprites.get(TypeSpriteHero.GOING_UP2);
    animation[3] = definedSprites.get(TypeSpriteHero.STATIC_UP);

    if (millis() - lastImageSwitchTimeHero > intervalHero) {
      currentImageIndexHero = (currentImageIndexHero + 1) % animation.length;
      lastImageSwitchTimeHero = millis();
    }
    image(animation[currentImageIndexHero], posX, posY, size, size * 3/2);
  }
  
  
  void heroWalkingDown(float posX, float posY, float size) {
    HashMap<TypeSpriteHero, PImage> definedSprites = defSpriteBomberman();
    PImage[] animation = new PImage[4];

    animation[0] = definedSprites.get(TypeSpriteHero.GOING_DOWN1);
    animation[1] = definedSprites.get(TypeSpriteHero.STATIC_DOWN);
    animation[2] = definedSprites.get(TypeSpriteHero.GOING_DOWN2);
    animation[3] = definedSprites.get(TypeSpriteHero.STATIC_DOWN);

    if (millis() - lastImageSwitchTimeHero > intervalHero) {
      currentImageIndexHero = (currentImageIndexHero + 1) % animation.length;
      lastImageSwitchTimeHero = millis();
    }
    image(animation[currentImageIndexHero], posX, posY, size, size * 3/2);
  }
}
