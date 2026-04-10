<div style="background-color: #0d1117; color: #ffffff; padding: 20px; border-radius: 8px; text-align: center; margin-bottom: 30px;">
  <h1 style="margin: 0; font-size: 2.8em;">CRASAS — Competitive Robotics Automated Scout and Analysis Suite</h1>
</div>

<div style="background-color: #0a84ff; color: #ffffff; padding: 25px; border-radius: 8px; margin-bottom: 40px; box-shadow: 0 4px 12px rgba(10, 132, 255, 0.3);">
  <h2 style="margin: 0 0 15px 0; font-size: 1.6em;">Project Credentials</h2>
  <p style="margin: 8px 0; font-size: 1.15em;"><strong>Version:</strong> V6</p>
  <p style="margin: 8px 0; font-size: 1.15em;"><strong>Team:</strong> CBHS Robotics 2976A — Christchurch Boys' High School</p>
  <p style="margin: 8px 0; font-size: 1.15em;"><strong>Season:</strong> VEX V5 Push Back (2025–2026)</p>
</div>

## What is CRASAS?

CRASAS is an automated weekly intelligence pipeline for VEX V5 competitive teams.  
It searches YouTube for recent competition footage, uses Google Gemini to analyse robot designs from the actual videos, and produces a structured markdown report covering mechanism trends, autonomous strategies, and competitive meta shifts.

As far as the author is aware, this is the first publicly released AI-powered competitive scouting system built specifically for VEX V5.

---

## How It Works

1. **YouTube Search** — Two searches run via the YouTube Data API v3, pulling videos from the past 7–21 days matching VEX V5 Push Back keywords.
2. **Filter & Deduplicate** — Live streams, premieres, non-V5 content (VEX IQ, F1 in Schools), and very short or very long videos are filtered out.
3. **Gemini Vision Caption** — The top 10 videos by view count are sent to Gemini 2.5 Flash, which watches each video and produces a dense technical caption describing robot mechanisms, autonomous routines, and driver strategies.
4. **Report Generation** — All video metadata and Gemini captions are passed to a second Gemini 2.5 Flash call that writes a full competitive intelligence report.
5. **Save to OneDrive** — The report is saved as a markdown file to a specified local directory (configured for OneDrive sync).

---

## Report Structure

Each weekly report contains:
1. Executive Summary
2. Mechanism Analysis
3. Autonomous Routine Trends
4. Driver Control Tactics
5. High-Value Teams and Channels
6. Novelty Flags
7. Recommended Watch List
8. Meta Trajectory

---

## Requirements
- [n8n](https://n8n.io) (v2.12.2, self-hosted via `npx n8n`)
- A [YouTube Data API v3](https://console.cloud.google.com/) key
- A [Gemini API](https://aistudio.google.com/apikey) key (free tier sufficient)
- macOS (tested on macOS 26 beta, Apple Silicon M5)

---

## Setup

### 1. Clone this repository
```bash
git clone https://github.com/YOUR_USERNAME/crasas.git
cd crasas
