@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\viral\Documents\uni stuff\291\project 2\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\viral\Documents\uni stuff\291\project 2\motor_control_FINAL_sending.c"
if not exist hex2mif.exe goto done
if exist motor_control_FINAL_sending.ihx hex2mif motor_control_FINAL_sending.ihx
if exist motor_control_FINAL_sending.hex hex2mif motor_control_FINAL_sending.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\viral\Documents\uni stuff\291\project 2\motor_control_FINAL_sending.hex
