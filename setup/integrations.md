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

4. **Update your cron scripts** -- Add the new MCP tool names to the
   `ALLOWED_TOOLS` variable in `scripts/daily-brief-cron.sh` and
   `scripts/vacation-poller.sh`. Without this, headless runs won't be able
   to use the new integration. See "How Tool Permissions Work" below.

5. **Test it** -- Run `CoSy, run my daily brief` and verify the integration
   pulls data correctly.

---

## How Tool Permissions Work

Claude Code has two permission modes, and they work differently:

**Interactive mode** (you run `claude` and chat): Claude Code asks you to
approve each tool before using it. You can grant one-time or session-wide
approval. No upfront configuration needed.

**Headless mode** (cron scripts, `-p` flag): There's no one to approve
tool usage, so you must pre-approve tools via `--allowedTools`. If a tool
isn't in the list, Claude Code can't use it and the step silently fails.

### What goes in `--allowedTools`

The base set every CoSy script needs:

```
Bash,Read,Write
```

- `Bash` -- runs shell commands (curl for REST APIs, CLI tools like `gws` or `gh`)
- `Read` -- reads local files (context files, prompts)
- `Write` -- saves output (briefs, pending updates)

On top of that, add the MCP tool names for your integrations. MCP tool names
follow the pattern `mcp__<server>__<tool>`. For example:

| Integration | MCP tool names |
|-------------|---------------|
| Slack | `mcp__slack__search_messages`, `mcp__slack__get_channel_history` |
| GitHub | `mcp__github__search_pull_requests`, `mcp__github__list_pull_requests` |
| Google Drive | `mcp__google-drive__readGoogleDoc`, `mcp__google-drive__getGoogleSheetContent` |

### Finding your MCP tool names

Run this in your terminal to see all available MCP tools:

```bash
claude mcp list
```

Or check your MCP configuration file (location depends on your setup -- see
the [Claude Code MCP docs](https://docs.anthropic.com/en/docs/claude-code/mcp)).

### Where to configure

Both cron scripts have an `ALLOWED_TOOLS` variable at the top with
commented-out examples for common integrations. Uncomment and add what you need.

---

## Headless / Cron Execution

Claude Code can run non-interactively for automated tasks like the daily brief
and vacation poller. Key flags:

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
