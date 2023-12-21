enum TypeSpriteHero
{
  GOING_LEFT, FRONT, GOING_RIGHT, BACK_LEFT, BACK, BACK_RIGHT, SIDE_LEFT, MOVE_SIDE_LEFT,
    SIDE_RIGHT, MOVE_SIDE_RIGHT, START_DEATH, DEATH1, DEATH2, DEATH3, DEATH4, FINAL_DEATH,
    SEMI_MOVE_LEFT, SEMI_MOVE_RIGHT
}

enum TypeSpriteLevel
{
  EMPTY, EMPTY_UNDER_DESTRUCTIBLE_WALL, EMPTY_UNDER_BUILD, WALL, BOTTOM_EDGE, TOP_EDGE, LEFT_EDGE, 
  RIGHT_EDGE, BOTTOM_LEFT, BOTTOM_RIGHT, TOP_LEFT, TOP_RIGHT, DESTRUCTIBLE_WALL, DESTRUCTIBLE_WALL_UNDER_BUILD, EXIT_DOOR
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
    sprites.put(TypeSpriteLevel.BOTTOM_RIGHT, allSprites.get(1 * boardSpriteSize, 6 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.TOP_LEFT, allSprites.get(1 * boardSpriteSize, 4 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.TOP_RIGHT, invertSprite(sprites.get(TypeSpriteLevel.TOP_LEFT)));


    //DESTRUCTIBLE_WALL
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL, allSprites.get(4 * boardSpriteSize, 4 * boardSpriteSize, boardSpriteSize, boardSpriteSize));
    sprites.put(TypeSpriteLevel.DESTRUCTIBLE_WALL_UNDER_BUILD, allSprites.get(4 * boardSpriteSize, 5 * boardSpriteSize, boardSpriteSize, boardSpriteSize));

    //EXIT_DOOR
    sprites.put(TypeSpriteLevel.EXIT_DOOR, allSprites.get(8 * boardSpriteSize, 3 * boardSpriteSize, boardSpriteSize, boardSpriteSize));

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
  
  }
