int: n;
int: m;

array[1..n, 1..m] of var 1..4: grid;

constraint forall (row_i in 1..n, row_j in 1..n where row_i<row_j) (
  forall (col_i in 1..m, col_j in 1..m where col_i<col_j) (
    not(grid[row_i, col_i] == grid[row_i, col_j] /\ grid[row_j, col_i] == grid[row_j, col_j] /\ grid[row_i, col_i] == grid[row_j, col_i] /\ grid[row_j, col_i] == grid[row_j, col_j])
  )
);

solve satisfy;

output[show(grid[i,j]) ++ if j mod n = 0 then "\n" else " " endif | i in 1..n, j in 1..m]