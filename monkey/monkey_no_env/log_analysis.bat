@ECHO OFF

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::             ����logcat��־                  ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

REM ����һ���ֶ�����Monkey��־·��

SET monkeyLogFile=F:\Monkey\V1.0.0\20140825181801_monkey.log



REM ��������ֱ�ӽ�Monkey��־�ϵ���bat�ļ���

IF NOT "%1"=="" SET monkeyLogFile=%1



ECHO.[ INFO ] logcat��־: %monkeyLogFile%

ECHO.[ INFO ] ��ʼ����

SET blnException=0

ECHO.

ECHO.

REM ������÷���̫�죬û�ио���������ע��ȥ����װ�����У���ͣ�ٸ�

REM ping -n 2 127.0.0.1>nul



::ANR��־

FOR /F "delims=" %%a IN ('FINDSTR /C:"ANR" %monkeyLogFile%') DO ( 

    SET strANR=%%a

)



::������־

FOR /F "delims=" %%a IN ('FINDSTR /C:"CRASH" %monkeyLogFile%') DO ( 

    SET strCRASH=%%a

)

    

::�쳣��־

FOR /F "delims=" %%a IN ('FINDSTR /C:"Exception" %monkeyLogFile%') DO ( 

    SET strException=%%a

)



::����

FOR /F "delims=" %%a IN ('FINDSTR /C:"Monkey finished" %monkeyLogFile%') DO ( 

    SET strFinished=%%a

)



IF NOT "%strANR%" == "" (

    ECHO.[ INFO ] ����Monkey��־����: ANR

    ECHO.[ INFO ] ------------------------------------

    ECHO.         "%strANR%"

    SET /a blnException+=1

    ECHO.

)



IF NOT "%strCRASH%" == "" (

    ECHO.[ INFO ] ����Monkey��־����: CRASH

    ECHO.[ INFO ] ------------------------------------

    ECHO.         "%strCRASH%"

    SET /a blnException+=1

    ECHO.

)



IF NOT "%strException%" == "" (

    ECHO.[ INFO ] ����Monkey��־����: �쳣

    ECHO.[ INFO ] ------------------------------------

    ECHO.         "%strException%"

    SET /a blnException+=1

)



IF NOT "%strFinished%" == "" (

    ECHO.[ INFO ] ����Monkey��־����: ִ�гɹ����

    ECHO.[ INFO ] ------------------------------------

    ECHO.         "%strFinished%"

    ECHO.

) ELSE (

    IF %blnException% EQU 0 ECHO.[ INFO ] ����Monkey��־���: Monkeyִ���쳣�жϣ�������ִ��Monkey�ű�!

    ECHO.

)



REM ���blnException��Ϊ0��˵�������쳣���ı�����Ϊ����ɫ

IF %blnException% NEQ 0 ( 

    Color 0D

    ECHO.[ INFO ] ����Monkey��־���:�����쳣��־�����ֹ�����ϸ��飡

    ECHO.

) ELSE (

    ECHO.[ INFO ] ����Monkey��־���:����

    ECHO.

)

ECHO.

ECHO.[ EXIT ] ��������رմ���...

PAUSE>nul