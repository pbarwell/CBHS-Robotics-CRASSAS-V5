@echo off
:: ─────────────────────────────────────────────
:: crasas-stop.bat  —  CBHS Robotics CRASAS V5
:: Stops n8n server
:: ─────────────────────────────────────────────
echo Stopping CRASAS services...
taskkill /F /IM node.exe >nul 2>&1 && echo n8n stopped || echo n8n was not running
echo All CRASAS services stopped. Safe to close this window.
pause
