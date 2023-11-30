class LevelLoader {

  String[] lines;

  LevelLoader(String filePath) {
    lines = loadStrings(filePath);
  }

  void loadLevel(Board board) {



    for ( int i = 0; i < board._cells.length; i++) {


      for ( int j = 0; j < board._cells[i].length; j++) {

        final boolean is_empty = lines[i].charAt(j) == 'v' || lines[i].charAt(j) == 'B' || lines[i].charAt(j) == 'M';
        final boolean is_wall = lines[i].charAt(j) == 'x';
        final boolean is_destructible = lines[i].charAt(j) == 'o';
        final boolean is_exit = lines[i].charAt(j) == 'S';

        TypeCell current_cell = board._cells[i][j];
        if (is_empty) {
          current_cell = TypeCell.EMPTY;
        }
        if (is_wall) {
          current_cell = TypeCell.WALL;
        }
        if (is_destructible) {
          current_cell = TypeCell.DESTRUCTIBLE_WALL;
        }
        if (is_exit) {
          current_cell = TypeCell.EXIT_DOOR;
        }
      }
    }
  }
}
