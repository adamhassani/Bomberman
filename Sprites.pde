enum TypeSpriteHero
{
  GOING_LEFT, FRONT, GOING_RIGHT, BACK_LEFT, BACK, BACK_RIGHT, SIDE_LEFT, MOVE_SIDE_LEFT,
    SIDE_RIGHT, MOVE_SIDE_RIGHT, START_DEATH, DEATH1, DEATH2, DEATH3, DEATH4, FINAL_DEATH,
    SEMI_MOVE_LEFT, SEMI_MOVE_RIGHT
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

  HashMap<TypeSpriteHero, PImage> defBomberman() {
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
  
}
