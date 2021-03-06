::    RESTful Interface Tool Sample Script for HPE iLO Products    ::
::  Copyright 2014, 2019 Hewlett Packard Enterprise Development LP ::

:: Description:  This is a sample batch script to send a test      ::
:: SNMP trap to the alert destinations configured for the iLO      ::

:: NOTE:  You will need to replace the USER_LOGIN and PASSWORD     ::
::        values with values that are appropriate for your         ::
::        environment.                                             ::

::        Firmware support information for this script:            ::
::            iLO 5 - All versions                                 ::
::            iLO 4 - version 2.10 or later.                       ::


@echo off
set argC=0
for %%x in (%*) do Set /A argC+=1
if %argC% EQU 3 goto :remote
if %argC% EQU 0 goto :local
goto :error

:local
ilorest sendtest snmpalert -u USER_LOGIN -p PASSWORD
ilorest logout
goto :exit
:remote
ilorest sendtest snmpalert --url=%1 -u %2 -p %3
ilorest logout
goto :exit

:error
echo Usage:
echo        remote: Send_Snmp_Test_Trap.bat ^<iLO url^> ^<iLO username^>  ^<iLO password^>
echo        local:  Send_Snmp_Test_Trap.bat
