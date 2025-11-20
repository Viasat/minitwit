#!/bin/bash

# Download and install GitHub Actions runner
RUNNER_VERSION="2.316.0"
RUNNER_DIR="actions-runner"

mkdir $RUNNER_DIR && cd $RUNNER_DIR
curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
tar xzf ./actions-runner-linux-x64.tar.gz

# Configure runner with GitHub
./config.sh --url https://github.com/viasat/minitwit --token $RUNNER_TOKEN --unattended --labels codebuild

# Run the runner
./run.sh
