set step=1

IF "%1"=="even" set step=2

FOR /L %%A IN (2, %step%, 16) DO (
  mzn2fzn -D "size=%%A" rfs_finder.mzn
  fz.exe -p 4 -mode stat rfs_finder.fzn
)
