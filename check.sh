#!/bin/bash
  count=$(gh run list \
  --limit 5 \
  --json status \
  --jq '[.[] | select(.status == "in_progress" or .status == "queued" or .status == "waiting" or .status == "pending" or .status == "requested")] | length')

  if [[ $count -eq 0 ]]; then
    echo "gh workflow run $count"
  fi
  
  echo "first count: $count"

  count=$(gh run list --limit 5 --json status --jq '[.[] | select(.status == "in_progress" or .status == "queued")] | length')
  echo "try again count: $count"
