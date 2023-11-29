String [] lignes;

lignes = loadStrings("levels/level1.txt");
final boolean is_empty = lignes[i][j] == "v" || lignes[i][j] == "B" || lignes[i][j] == "M";
final boolean is_wall = lignes[i][j] == "x";
final boolean is_destructible = lignes[i][j] == "o";
final boolean is_exit = lignes[i][j] == "S";

for ( int i = 0; i < _board._cells.length; i++) {
    for ( int j = 0; j < _board._cells[i].length; j++) {
      TypeCell current_cell = _board._cells[i][j];
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
