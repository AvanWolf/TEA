@ECHO off
SETLOCAL EnableDelayedExpansion
REN _Transcendence.tdb Transcendence.tdb
IF NOT EXIST _TDB (MD _TDB)
FOR %%F IN (*.xml) DO (
  ECHO "Processing %%F"
  FINDSTR /m "<TranscendenceModule>" %%F
  IF !errorlevel!==0 (echo "Skipping %%F - Is a module") ELSE (
    ECHO "Compiling %%F"
    VER > NUL
    SET name=%%F
    SET output=!name:.xml=.tdb!
    ECHO Output is !output!
    TransCompiler.exe /input:%%F /output:_TDB/!output!
  )
)
REN Transcendence.tdb _Transcendence.tdb
ENDLOCAL
@ECHO on