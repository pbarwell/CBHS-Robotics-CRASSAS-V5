# CRASAS Installation Guide

CRASAS runs on [n8n](https://n8n.io), a local workflow automation tool, and uses the Google Gemini and YouTube Data APIs for video analysis and report generation. Follow these steps to get it running on your machine.

---

## Step 1 — Install Dependencies

| # | What | Command | Notes |
|---|------|---------|-------|
| 1 | Node.js | Download from [nodejs.org](https://nodejs.org) | v18 or higher required |
| 2 | n8n | `npm install -g n8n` | Installs n8n globally |
| 3 | md-to-pdf | `npm install -g md-to-pdf` | Converts reports to PDF |
| 4 | Verify Node | `node --version` | Should print v18.x or higher |
| 5 | Verify n8n | `npx n8n --version` | Should print 2.x.x |
| 6 | Verify md-to-pdf | `md-to-pdf --version` | Should print without error |

---

## Step 2 — Get Your API Keys

You need two API keys. Keep these private and never share them or commit them to a public repository.

| # | Key | Instructions | Where to find it |
|---|-----|-------------|-----------------|
| 1 | YouTube Data API v3 | [Enable the YouTube Data API](https://developers.google.com/youtube/v3/getting-started) | Google Cloud Console → APIs & Services → Credentials |
| 2 | Gemini API | [Get a Gemini API key](https://ai.google.dev/gemini-api/docs/api-key) | Google AI Studio → Get API Key |
| 3 | Gemini Billing | [Enable billing](https://ai.google.dev/gemini-api/docs/billing) | Required to avoid daily rate limits — costs cents per run |

---

## Step 3 — Download the Workflow

| # | Action | Notes |
|---|--------|-------|
| 1 | Download `CBHS_Robotics_CRASAS.json` from this repository | Use the green Code button → Download ZIP, or clone the repo |
| 2 | Place it anywhere accessible on your machine | You will import it into n8n in Step 6 |

---

## Step 4 — Configure the Start Script

Download the start script for your operating system from this repository.

### macOS — `crasas-start.command`

Open the file in a text editor and fill in your API keys:

```bash
YOUTUBE_API_KEY=YOUR_YOUTUBE_API_KEY_HERE \
GEMINI_API_KEY=YOUR_GEMINI_API_KEY_HERE \
```

Then make it executable by running this once in Terminal:

```bash
chmod +x /path/to/crasas-start.command
```

### Windows — `crasas-start.bat`

Open the file in Notepad and fill in your API keys:

```bat
set YOUTUBE_API_KEY=YOUR_YOUTUBE_API_KEY_HERE
set GEMINI_API_KEY=YOUR_GEMINI_API_KEY_HERE
```

---

## Step 5 — Set Your Reports Folder

In the workflow JSON, the Save Report node writes to a folder on your machine. Before importing, open the JSON in a text editor and find this line and replace it with a folder path of your choice:

```
REPLACE_WITH_YOUR_REPORTS_FOLDER_PATH
```

**macOS example:**

```
/Users/yourname/Documents/CRASAS Reports
```

**Windows example:**

```
C:\Users\yourname\Documents\CRASAS Reports
```

---

## Step 6 — Import the Workflow into n8n

| # | Action |
|---|--------|
| 1 | Run your start script to launch n8n |
| 2 | Open your browser and go to `http://127.0.0.1:5678` |
| 3 | Create a free local account when prompted |
| 4 | Click the **+** button to create a new workflow |
| 5 | Click the three-dot menu (⋯) → **Import from file** |
| 6 | Select `CBHS_Robotics_CRASAS.json` |
| 7 | The workflow will appear — click **Save** |

---

## Step 7 — Add Your API Keys to the Workflow

The two API keys need to be pasted directly into the workflow nodes.

| # | Node | Field | Value |
|---|------|-------|-------|
| 1 | YouTube Search (both nodes) | `key=` in the URL field | Your YouTube Data API v3 key |
| 2 | Gemini Vision Caption | `const apiKey =` | Your Gemini API key |
| 3 | Prompt and Summary | `const apiKey =` | Your Gemini API key |

---

## Step 8 — Run CRASAS

| # | Action |
|---|--------|
| 1 | Launch n8n using your start script |
| 2 | Open `http://127.0.0.1:5678` in your browser |
| 3 | Open the CRASAS workflow |
| 4 | Click **Execute Workflow** |
| 5 | The pipeline takes 10–20 minutes depending on how many videos are analysed |
| 6 | Find your report in the folder you configured in Step 5 |

---

## Stopping n8n

When you are done, run the stop script (`crasas-stop.command` on macOS, `crasas-stop.bat` on Windows) or press `Ctrl+C` in the terminal window where n8n is running.
