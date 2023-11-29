String [] lignes;

lignes = loadStrings("levels/level1.txt");
  for ( int i = 0; i < _board._cells.length; i++) {
    for ( int j = 0; j < _board._cells[i].length; j++) {
      if (lignes[i][j] == "v" || lignes[i][j] == "B" || lignes[i][j] == "M") {
        _board._cells[i][j] = TypeCell.EMPTY;
      }
      if (lignes[i][j] == "x") {
        _board._cells[i][j] = TypeCell.WALL;
      }
      if (lignes[i][j] == "o") {
        _board._cells[i][j] = TypeCell.DESTRUCTIBLE_WALL;
      }
      if (lignes[i][j] == "S") {
        _board._cells[i][j] = TypeCell.EXIT_DOOR;
      }
    }
