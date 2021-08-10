
@ECHO OFF
setlocal enableextensions enabledelayedexpansion 
set count=C:\Users\TUFIQoE\PycharmProjects\avrateNG\count.txt
set file=C:\Users\TUFIQoE\PycharmProjects\avrateNG\playlist.list
set /a count_loop = 0

for /f "delims=" %%x in (%count%) do set count=%%x
set /a count += 1
echo !count! > C:\Users\TUFIQoE\PycharmProjects\avrateNG\count.txt

for /f "delims=" %%a in (%file%) do (
        set /a count_loop += 1
        set var=%%a
                if "!count!"=="!count_loop!" GOTO break
    
)
:break
OptiPlay-0.7beta2.exe -i !var! -an

endlocal
exit

