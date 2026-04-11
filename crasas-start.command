#!/bin/bash
# ─────────────────────────────────────────────
# crasas-start.command  —  CBHS Robotics CRASAS V5
# ─────────────────────────────────────────────
# ── 1. Start n8n ─────────────────────────────
echo "Starting n8n server..."
N8N_SECURE_COOKIE=false \
NODE_FUNCTION_ALLOW_BUILTIN=fs,path,os,child_process \
EXECUTIONS_TIMEOUT=7200 \
N8N_RUNNERS_TASK_TIMEOUT=7200 \
GEMINI_API_KEY=YOUR_GEMINI_API_KEY \
npx n8n