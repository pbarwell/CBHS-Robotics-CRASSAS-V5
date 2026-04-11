#!/bin/bash
# ─────────────────────────────────────────────
# crasas-stop.command  —  CBHS Robotics CRASAS V5
# Stops n8n server
# ─────────────────────────────────────────────

echo "Stopping CRASAS services..."
pkill -f n8n 2>/dev/null && echo "n8n stopped" || echo "n8n was not running"
echo "All CRASAS services stopped. Safe to close this window."
