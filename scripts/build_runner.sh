#!/usr/bin/env bash

# Usage: ./scripts/build_runner.sh
#
# Runs `build_runner` in watch mode to automatically regenerate code when changes are detected.
# The `--delete-conflicting-outputs` flag ensures outdated or conflicting generated files are
# removed before rebuilding, preventing common errors.
#
# In this project, build_runner is mainly used for:
#   - Asset generation
#   - Localization
#   - Code generation from annotations
#
# Notes:
# - Make the script executable once with:
#       chmod +x scripts/build_runner.sh
#   Then you can run it directly with:
#       ./scripts/build_runner.sh
# - Alternatively, you can skip `chmod` and run it with:
#       bash scripts/build_runner.sh

dart run build_runner watch --delete-conflicting-outputs
