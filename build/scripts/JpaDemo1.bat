@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  JpaDemo1 startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and JPA_DEMO1_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\JpaDemo1.jar;%APP_HOME%\lib\hibernate-core-5.3.2.Final.jar;%APP_HOME%\lib\postgresql-42.2.2.jar;%APP_HOME%\lib\hibernate-jpa-2.1-api-1.0.2.jar;%APP_HOME%\lib\gretty-2.0.0.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\javax.websocket-api-1.0.jar;%APP_HOME%\lib\hibernate-commons-annotations-5.0.4.Final.jar;%APP_HOME%\lib\jboss-logging-3.3.2.Final.jar;%APP_HOME%\lib\javax.persistence-api-2.2.jar;%APP_HOME%\lib\javassist-3.22.0-GA.jar;%APP_HOME%\lib\byte-buddy-1.8.12.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\jboss-transaction-api_1.2_spec-1.1.1.Final.jar;%APP_HOME%\lib\jandex-2.0.5.Final.jar;%APP_HOME%\lib\classmate-1.3.4.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\dom4j-1.6.1.jar;%APP_HOME%\lib\gretty-core-2.0.0.jar;%APP_HOME%\lib\spring-boot-loader-tools-1.5.4.RELEASE.jar;%APP_HOME%\lib\jetty-util-8.1.8.v20121106.jar;%APP_HOME%\lib\groovy-json-2.4.11.jar;%APP_HOME%\lib\groovy-2.4.11.jar;%APP_HOME%\lib\commons-cli-1.2.jar;%APP_HOME%\lib\commons-configuration-1.10.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\commons-lang3-3.3.2.jar;%APP_HOME%\lib\org.apache.servicemix.bundles.bcprov-jdk16-1.46_3.jar;%APP_HOME%\lib\spring-boot-devtools-1.3.3.RELEASE.jar;%APP_HOME%\lib\spring-boot-autoconfigure-1.3.3.RELEASE.jar;%APP_HOME%\lib\spring-boot-1.3.3.RELEASE.jar;%APP_HOME%\lib\spring-context-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-aop-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-beans-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-expression-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-core-4.3.9.RELEASE.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\aopalliance-1.0.jar

@rem Execute JpaDemo1
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %JPA_DEMO1_OPTS%  -classpath "%CLASSPATH%" tables.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable JPA_DEMO1_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%JPA_DEMO1_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
