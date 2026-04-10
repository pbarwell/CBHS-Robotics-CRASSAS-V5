# CRASAS — Competitive Robotics Automated Scout and Analysis Suite

> [!IMPORTANT]
> **Acknowledgements:** Built by Putu Barwell, CBHS Robotics 2976A. Powered by n8n, Google Gemini, and the YouTube Data API.      
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
> - macOS (tested on macOS 26.4, Apple Silicon M5)

---

## Setup

### 1. Clone this repository
```bash
git clone https://github.com/YOUR_USERNAME/CRASAS.git
cd CRASAS
```
### 2. Get your API keys

YouTube Data API v3 — Create a project in Google Cloud Console, enable the YouTube Data API v3, and generate an API key.
Gemini API — Go to AI Studio and create a free API key.

### 3. Configure the workflow
Open CBHS_Robotics_CRASAS_V6.json and replace the following placeholders:

PlaceholderReplace with YOUR_YOUTUBE_DATA_KEYY 
our YouTube Data API keyYOUR_GEMINI_KEYYour Gemini API key
Also update the OneDrive path in the Save Report Locally node to match your system:
JavaScriptconst reportsDir = path.join(os.homedir(), 'YOUR/PATH/TO/REPORTS');

### 4. Start n8n
```Bash
N8N_SECURE_COOKIE=false \
NODE_FUNCTION_ALLOW_BUILTIN=fs,path,os \
EXECUTIONS_TIMEOUT=7200 \
N8N_RUNNERS_TASK_TIMEOUT=3600 \
npx n8n
```

### 5. Import the workflow

Open n8n at http://localhost:5678
Go to Workflows → Import from file
Select CBHS_Robotics_CRASAS_V6.json
Set the Merge Stats node to Run Once for All Items
Activate the workflow or trigger it manually

### Configuration
Open `CBHS_Robotics_CRASAS_V6.json` and replace the following placeholders:

| Placeholder | Replace with |
|---|---|
| `YOUR_YOUTUBE_DATA_KEY` | Your YouTube Data API key |
| `YOUR_GEMINI_KEY` | Your Gemini API key |

Also update the OneDrive path in the **Save Report Locally** node to match
your system:

```javascript
const reportsDir = path.join(os.homedir(), 'YOUR/PATH/TO/REPORTS');
```

### Output
Reports are saved as markdown files named CRASAS_REPORT--YYYY-MM-DD.md.
A latest.md symlink always points to the most recent report.

### Limitations

Gemini free tier allows 250 requests/day — sufficient for weekly use
Vision analysis is text-based inference from video content, not frame extraction
Accuracy depends on video quality and whether robots are clearly visible
Push Back–specific prompts may need updating for future VEX seasons


### Contributing
Pull requests welcome. If you adapt CRASAS using different models or input pipelines, please open a PR or issue.
