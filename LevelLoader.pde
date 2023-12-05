class LevelLoader {

  String[] _lines;

  LevelLoader(String filePath) {
    _lines = loadStrings(filePath);
  }

  void loadLevel(Board board) {
    int Pixels = 16;
    for ( int i = 0; i < board._cells.length; i++) {
      for ( int j = 0; j < board._cells[i].length; j++) {
        int offset_top = j * board._cellSize+2*board._cellSize;
        
        final boolean is_empty = _lines[i].charAt(j) == 'v' || _lines[i].charAt(j) == 'B' || _lines[i].charAt(j) == 'M' || _lines[i].charAt(j) == 'o';
        final boolean is_wall = _lines[i].charAt(j) == 'x';
        final boolean is_destructible = _lines[i].charAt(j) == 'o';
        final boolean is_exit = _lines[i].charAt(j) == 'S';

        //TypeCell current_cell = board._cells[i][j];
        //Determine l'etat de la cellule actuelle.
        int size = board._cellSize;
        if (is_empty) {
          board._cells[i][j] = TypeCell.EMPTY;
          PImage temp = board._cellImage.get(3 * Pixels,6 * Pixels, Pixels, Pixels);
          temp.resize(board._cellSize,0);
          image(temp, i * size , offset_top);
        }
        if (is_wall) {
          board._cells[i][j] = TypeCell.WALL;
          PImage temp = board._cellImage.get(5 * Pixels,6 * Pixels, Pixels, Pixels);
          temp.resize(board._cellSize,0);
          image(temp,i * size, offset_top);
        }
        if (is_destructible) {
          board._cells[i][j] = TypeCell.DESTRUCTIBLE_WALL;
          PImage temp = board._cellImage.get(4 * Pixels,4 * Pixels, Pixels, Pixels);
          temp.resize(board._cellSize, 0);
          image(temp,i * size, offset_top);
        }
        if (is_exit) {
          board._cells[i][j] = TypeCell.EXIT_DOOR;
          PImage temp = board._cellImage.get(8 * Pixels,3 * Pixels, Pixels, Pixels);
          temp.resize(board._cellSize, 0);
          image(temp,i * size, offset_top);
        }
      }
    }
  }
}
