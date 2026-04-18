@echo off
:: ─────────────────────────────────────────────
:: crasas-start.bat  —  CBHS Robotics CRASAS V5
:: ─────────────────────────────────────────────
echo Starting n8n server...
set N8N_SECURE_COOKIE=false
set NODE_FUNCTION_ALLOW_BUILTIN=fs,path,os,child_process
set EXECUTIONS_TIMEOUT=7200
set N8N_RUNNERS_TASK_TIMEOUT=7200
set GEMINI_API_KEY=YOUR_GEMINI_API_KEY
npx n8n
