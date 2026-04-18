# CRASAS — Competitive Robotics Automated Scout and Analysis Suite

> [!IMPORTANT]
> **Acknowledgements:** Built by Putu Barwell, the Captain of CBHS Robotics 2976A.      
> **Team:** CBHS Robotics 2976A — Christchurch Boys' High School    
> **License:** MIT License — free to use, modify, and distribute with attribution.

---

## What is CRASAS?

CRASAS is an automated intelligence pipeline for VEX V5 competitive teams.  
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

Each report contains:
1. Executive Summary
2. Mechanism Analysis
3. Autonomous Routine Trends
4. Driver Control Tactics
5. High-Value Teams and Channels
6. Novelty Flags
7. Recommended Watch List
8. Meta Trajectory

---
> [!IMPORTANT]
> ## Requirements
> - [n8n](https://n8n.io) (v2.12.2, self-hosted via `npx n8n`)
> - A [YouTube Data API v3](https://console.cloud.google.com/) key
> - A [Gemini API](https://aistudio.google.com/apikey) key (free tier sufficient)

Pull requests welcome. If you adapt CRASAS using different models or input pipelines, please open a PR or issue.
