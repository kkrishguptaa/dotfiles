#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DEST_DIR="$HOME/.dotfiles/dot_config/defaults"
mkdir -p "$DEST_DIR"

# Get all domains as a comma-separated string
domains_csv=$(defaults domains)

# Remove spaces, split by comma into array
IFS=',' read -r -a domains <<<"${domains_csv// /}"

for domain in "${domains[@]}"; do
  # Trim whitespace from domain
  domain=$(echo "$domain" | xargs)

  # Export the domain to a plist file
  echo "Exporting $domain..."
  defaults export "$domain" "$DEST_DIR/${domain}.plist" || {
    echo "Failed to export $domain"
  }
done
