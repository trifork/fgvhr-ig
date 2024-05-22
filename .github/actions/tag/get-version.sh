#!/bin/bash

WORKFLOW_TAG=${WORKFLOW_TAG}
GIT_TAG=${GIT_TAG}
PREFIX=${PREFIX}

# If tag is set through manual workflow
if [[ ! -z "$WORKFLOW_TAG" ]]; then
    output=${WORKFLOW_TAG#"$PREFIX"}
    echo "$output"
# If a Git tag has been set
elif [[ $GIT_TAG == *"refs/tags/"* ]]; then
    refprefix="refs/tags/"
    output=${GIT_TAG#"$refprefix"}
    downcasedPrefix="${PREFIX,,}"
    downcasedOutput="${output,,}"
    output=${downcasedOutput#"$downcasedPrefix"}
    echo "$output"
# If none of the above
else
    echo ""
fi
