# Vacation Mode

_Status and configuration for CoSy's PTO poller._

| Field | Value |
|-------|-------|
| **Status** | inactive |
| **Start date** | -- |
| **End date** | -- |
| **Delegate** | -- |
| **Notes** | -- |

## How to activate

Tell CoSy: "I'm going on PTO from [start] to [end]" and it will update this file.
Or edit directly -- set Status to `active` and fill in the dates (YYYY-MM-DD format).

The cron script (`scripts/vacation-poller.sh`) checks this file daily and only runs
the vacation poller when Status is `active` and today falls within the date range.

## How to deactivate

Tell CoSy: "I'm back" -- it will set Status to `inactive` and trigger the return brief.
Or edit directly -- set Status to `inactive`.
