String [] lignes;

lignes = loadStrings("levels/level1.txt");
final boolean isEmpty = lignes[i][j] == "v" || lignes[i][j] == "B" || lignes[i][j] == "M";
final boolean isWall = lignes[i][j] == "x";
final boolean isDestructible = lignes[i][j] == "o";
final boolean isExit = lignes[i][j] == "S";

for ( int i = 0; i < _board._cells.length; i++) {
    for ( int j = 0; j < _board._cells[i].length; j++) {
      if (isEmpty) {
        _board._cells[i][j] = TypeCell.EMPTY;
      }
      if (isWall) {
        _board._cells[i][j] = TypeCell.WALL;
      }
      if (isDestructible) {
        _board._cells[i][j] = TypeCell.DESTRUCTIBLE_WALL;
      }
      if (isExit) {
        _board._cells[i][j] = TypeCell.EXIT_DOOR;
      }
    }
  }
