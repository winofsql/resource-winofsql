REM access フォルダ
MOVE ..\access\*.* \app\workspace

REM csv フォルダ
mkdir \app\workspace\csv
MOVE ..\csv\*.* \app\workspace\csv

REM excel フォルダ
MOVE ..\excel\*.* \app\workspace

REM sqlite3
MOVE ..\sqlite3\*.* \app\workspace
