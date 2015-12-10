setlocal

echo PROCESSOR_ARCHITECTURE var:
echo %PROCESSOR_ARCHITECTURE% | find /i "x86" > nul
if %errorlevel%==0 (
	set netpath=\\192.168.1.16\public\zabbix\zabbix_agents\win32\*
	set localpath="C:\Program Files (x86)\zabbix_agentd"
) else (
    set netpath=\\192.168.1.16\public\zabbix\zabbix_agents\win64\*
    set localpath="C:\Program Files\zabbix_agentd"
)

mkdir %localpath%
xcopy /ZYE %netpath% %localpath%\

%localpath%\zabbix_agentd.exe --config %localpath%\conf\zabbix_agentd.conf --install
%localpath%\zabbix_agentd.exe --start

endlocal
