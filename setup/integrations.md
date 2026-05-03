# Integrations

_Tools and data sources CoSy connects to._

---

## How CoSy Accesses Data

CoSy runs inside Claude Code. It can access external tools through:

1. **MCP Servers** -- Claude Code's Model Context Protocol connects to services
   like Google Drive, Slack, GitHub, etc. See the
   [MCP documentation](https://docs.anthropic.com/en/docs/claude-code/mcp).

2. **CLI tools** -- Any command-line tool installed on your system (curl, gh, glab, etc.)

3. **REST APIs** -- Direct API calls via curl for services like Jira, Confluence, etc.

---

## Common Integrations

| Tool | Access Method | What CoSy Uses It For |
|------|-------------|----------------------|
| Google Calendar | MCP or CLI | Daily brief scheduling, meeting prep |
| Google Drive / Docs | MCP | Docs, planning files, shared context |
| Gmail | MCP or CLI | Email signals, interaction context |
| Google Tasks / Todoist / etc. | MCP or CLI | Task list for prioritization |
| Slack / Teams | MCP | Team signals, async interaction log |
| Jira / Linear / GitHub Issues | REST API or CLI | Roadmap and work item tracking |
| GitHub / GitLab | MCP or CLI | Code review, PR tracking, team activity |
| Confluence / Notion | REST API | Internal docs, team context |

---

## Setting Up an Integration

1. **Check MCP availability** -- Many services have MCP servers. Check the
   [MCP server registry](https://github.com/modelcontextprotocol/servers).

2. **Configure in Claude Code** -- Add the MCP server to your Claude Code
   configuration. See Claude Code docs for details.

3. **Update the daily brief prompt** -- Add the data collection commands for
   your new integration to `prompts/daily-brief.md`.

4. **Test it** -- Run `CoSy, run my daily brief` and verify the integration
   pulls data correctly.

---

## Headless / Cron Execution

Claude Code can run non-interactively for automated tasks like the vacation poller.
Key flags:

| Flag | Purpose |
|------|---------|
| `-p "prompt"` | Run non-interactively with a prompt |
| `--allowedTools "..."` | Pre-approve tools so it runs unattended |

See `setup/daily-brief-cron.md` and `setup/vacation-mode.md` for working examples
of headless execution via cron.

---

## Future Considerations

- LinkedIn signals (industry visibility, relevant posts)
- Performance review system integration
- Custom CoSy web UI / mobile interface
