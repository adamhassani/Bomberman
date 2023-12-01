class LevelLoader {

  String[] _lines;

  LevelLoader(String filePath) {
    _lines = loadStrings(filePath);
  }

  void loadLevel(Board board) {



    for ( int i = 0; i < board._cells.length; i++) {


      for ( int j = 0; j < board._cells[i].length; j++) {

        final boolean is_empty = _lines[i].charAt(j) == 'v' || _lines[i].charAt(j) == 'B' || _lines[i].charAt(j) == 'M';
        final boolean is_wall = _lines[i].charAt(j) == 'x';
        final boolean is_destructible = _lines[i].charAt(j) == 'o';
        final boolean is_exit = _lines[i].charAt(j) == 'S';

        //TypeCell current_cell = board._cells[i][j];
        //Determine l'etat de la cellule actuelle.
        if (is_empty) {
          board._cells[i][j] = TypeCell.EMPTY;
        }
        if (is_wall) {
          board._cells[i][j] = TypeCell.WALL;
        }
        if (is_destructible) {
          board._cells[i][j] = TypeCell.DESTRUCTIBLE_WALL;
        }
        if (is_exit) {
          board._cells[i][j] = TypeCell.EXIT_DOOR;
        }
      }
    }
  }
}
