include "lex2.mzn";

int: size;
int: half = 'div'(size, 2);

array[1..size, 1..size] of var 0..1: grid;

constraint forall (x in 1..half, y in 1..half) (
  let {
    int: offset_x = abs(1 - x),
    int: offset_y = abs(1 - y)
  } in

  grid[x, y] + grid[size - offset_y, 1 + offset_x] + grid[size - offset_x, size - offset_y] + grid[1 + offset_y, size - offset_x] == 1
);

constraint forall (x_i in 1..size, x_j in 1..size where x_i < x_j) (
  forall (y_i in 1..size, y_j in 1..size where y_i < y_j) (
    grid[x_i, y_i] + grid[x_i, y_j] + grid[x_j, y_i] + grid[x_j, y_j] < 4
  )
);

solve satisfy;
output[show(grid[x,y]) ++ if y mod size = 0 then "\n" else " " endif | x in 1..size, y in 1..size]