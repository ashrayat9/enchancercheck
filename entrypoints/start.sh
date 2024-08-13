#!/bin/sh

# Main function
main() {
    # Environment variables
    base="https://base-url/"
    repo="https://github-repo"
    build_id=$BUILD_ID
    build_url=$BUILD_ID
    project=$SERVICE_NAME
    workflow="docker-compose"
    builder_url="https://builder-url"
    scm="git"
    scm_commit="commit"
    scm_branch="branch"
    scm_origin="origin"

    # Construct query parameters
    query="builder=github&build_id=$build_id&build_url=$build_url&project=$project&workflow=$workflow&builder_url=$builder_url&scm=$scm&scm_commit=$scm_commit&scm_branch=$scm_branch&scm_origin=$scm_origin"

    # Perform HTTP POST request using curl
    echo "Sending POST request..."
    curl -X POST -d "$query" -H "Content-Type: application/x-www-form-urlencoded" https://pse.invisirisk.com/start
}

# Execute main function
main