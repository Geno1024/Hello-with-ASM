@echo off

    if exist "hello.obj" del "hello.obj"
    if exist "hello.exe" del "hello.exe"

    \masm32\bin\ml /c /coff "hello.asm"
    if errorlevel 1 goto errasm

    \masm32\bin\PoLink /SUBSYSTEM:CONSOLE "hello.obj"
    if errorlevel 1 goto errlink
    dir "hello.*"
    goto TheEnd

  :errlink
    echo _
    echo Link error
    goto TheEnd

  :errasm
    echo _
    echo Assembly Error
    goto TheEnd
    
  :TheEnd

pause
