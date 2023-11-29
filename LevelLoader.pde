class LevelLoader {

  String[] lines;

  LevelLoader(String filePath) {
    lines = loadStrings(filePath);
  }

  void loadLevel(Board board) {

    final boolean is_empty = lines[i][j] == "v" || lines[i][j] == "B" || lines[i][j] == "M";
    final boolean is_wall = lines[i][j] == "x";
    final boolean is_destructible = lines[i][j] == "o";
    final boolean is_exit = lines[i][j] == "S";

    for ( int i = 0; i < board._cells.length; i++) {
      for ( int j = 0; j < board._cells[i].length; j++) {
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
