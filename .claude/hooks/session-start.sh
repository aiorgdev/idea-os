#!/bin/bash

# aiorg Kit - Session Start Hook
# Always shows version hint, suggests /whats-new
# Works for any kit - reads name from version.json

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"
VERSION_FILE="$PROJECT_DIR/.claude/version.json"

# Get kit info from version.json
KIT_NAME="Kit"
VERSION="?"
if [ -f "$VERSION_FILE" ]; then
    # Try to get display name first, fall back to package name
    KIT_NAME=$(grep '"packageDisplayName"' "$VERSION_FILE" | head -1 | sed 's/.*: "\([^"]*\)".*/\1/')
    if [ -z "$KIT_NAME" ] || [ "$KIT_NAME" = "" ]; then
        KIT_NAME=$(grep '"packageName"' "$VERSION_FILE" | head -1 | sed 's/.*: "\([^"]*\)".*/\1/')
    fi
    VERSION=$(grep '"version"' "$VERSION_FILE" | head -1 | sed 's/.*: "\([^"]*\)".*/\1/')
fi

# Colors
YELLOW='\033[1;33m'
DIM='\033[2m'
NC='\033[0m'

# ============================================
# CHECK FOR UPGRADE MARKER
# ============================================
MARKER_FILE="$PROJECT_DIR/.upgrade-marker.json"
if [ -f "$MARKER_FILE" ]; then
    FROM_VERSION=$(grep '"fromVersion"' "$MARKER_FILE" | sed 's/.*: "\([^"]*\)".*/\1/')

    # Show prominent upgrade banner on stderr
    echo "" >&2
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" >&2
    echo -e "${YELLOW} 🎉 Upgraded to v$VERSION!  │  Type /whats-new${NC}" >&2
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" >&2
    echo "" >&2

    # Inject brief context for Claude
    CONTEXT="User just upgraded $KIT_NAME from v$FROM_VERSION to v$VERSION. When they send their first message, briefly acknowledge the upgrade and suggest they can type /whats-new to see what changed."
    CONTEXT_ESCAPED=$(echo "$CONTEXT" | sed 's/"/\\"/g')
    echo "{\"hookSpecificOutput\":{\"hookEventName\":\"SessionStart\",\"additionalContext\":\"$CONTEXT_ESCAPED\"}}"

    # Delete marker (one-time message)
    rm -f "$MARKER_FILE"
    exit 0
fi

# ============================================
# NORMAL SESSION START - Always show version hint
# ============================================

# Show subtle version hint on stderr
echo "" >&2
echo -e "${DIM}$KIT_NAME v$VERSION  │  /whats-new${NC}" >&2
echo "" >&2
