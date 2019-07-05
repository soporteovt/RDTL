::SCRIPTS PROGRAMADOS ::
@ECHO off
@SETLOCAL

@REM VARIABLES USADAS EN EL SCRIPT
@SET VERSION=1.7.14
@SET CARPETA_INSTALL=c:\REDITEL
@SET CARPETA_LOG=%CARPETA_INSTALL%\LOG
@SET CARPETA_SIEBEL=%CARPETA_INSTALL%\SIEBEL
@SET CARPETA_ZABBIX=c:\zabbix
@SET CUR_YYYY=%date:~-4,4%
@SET CUR_MM=%date:~-10,2%
@SET CUR_DD=%date:~-7,2%
@SET CUR_HH=%time:~0,2%
@if %CUR_HH% lss 10 (@SET CUR_HH=%time:~1,1%)
@SET CUR_NN=%time:~3,2%
@SET CUR_SS=%time:~6,2%
@SET CUR_MS=%time:~9,2%
@set fichero_log=%CARPETA_LOG%\log_tarea_git_%CUR_YYYY%_%CUR_MM%_%CUR_DD%__%CUR_HH%_%CUR_NN%_%CUR_SS%.txt
@set HORA_EJECUCION=%date:~-4,4%/%date:~-10,2%/%date:~-7,2% %time:~0,2%:%time:~3,2%
@rem DATOS De la maquina para el escritorio
@SET DATOS_EQUIPO=C:\Bginfo
@SET SN_FILE=%DATOS_EQUIPO%\SN.txt
@SET VER_FILE=%DATOS_EQUIPO%\VERSION.txt
@SET BUILD_FILE=%DATOS_EQUIPO%\BUILD.txt
:: Copia la carpeta de instalacion a local
@SET COPIA_FICHEROS=0
:: Mensajes Debug
@SET DEBUG=1

@IF "%DEBUG%"=="1" (
  @ECHO Version  %VERSION%
	@ECHO Fichero Log  %fichero_log%
	@ECHO Hora ejecucion  %HORA_EJECUCION%
	@ECHO Datos equipo %DATOS_EQUIPO%
	@ECHO Numero de Serie %SN_FILE%
	@ECHO Version Script %VER_FILE%
	@ECHO Fecha Creacion %BUILD_FILE%
	@ECHO Fecha2   : %CUR_YYYY% / %CUR_MM% / %CUR_DD% - %CUR_HH% : %CUR_NN% : %CUR_SS%
	@ECHO Carpeta Instalacion %CARPETA_INSTALL%
)

:: Creacion de las carpetas
@IF NOT EXIST "%CARPETA_INSTALL%" (
	@echo [SISTEMA] Creando Carpeta Inst %CARPETA_INSTALL%
	@mkdir %CARPETA_INSTALL% > NUL 2>&1
)
@IF NOT EXIST "%CARPETA_LOG%" (
	@echo [SISTEMA] Creando Carpeta log %CARPETA_LOG%
	@mkdir %CARPETA_LOG% > NUL 2>&1
)

@echo --- Tareas Remotas --- >> %fichero_log%
