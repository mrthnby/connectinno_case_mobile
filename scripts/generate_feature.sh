#!/bin/bash

# Usage: ./scripts/generate_feature.sh <feature_name>
#
# Generates a clean feature folder structure inside `lib/features/` following
# the standard Data–Domain–Presentation architecture often used in Flutter projects.
#
# Example:
#   ./generate_feature.sh profile
#   → Creates folders and a `profile_page.dart` under lib/features/profile/
#
# Notes:
# - Make the script executable once with:
#       chmod +x scripts/generate_feature.sh
#   Then run it directly with:
#       ./scripts/generate_feature.sh <feature_name>
# - Alternatively, run without chmod:
#       bash scripts/generate_feature.sh <feature_name>

# Check if feature name is provided
if [ $# -eq 0 ]; then
    echo "❌ Error: Feature name is required"
    echo "Usage: ./generate_feature.sh <feature_name>"
    exit 1
fi

# Extract the provided feature name
FEATURE_NAME=$1
FEATURE_PATH="lib/features/$FEATURE_NAME"

# Create the main feature directory
mkdir -p "$FEATURE_PATH"

# Create top-level subdirectories
mkdir -p "$FEATURE_PATH/data"
mkdir -p "$FEATURE_PATH/domain"
mkdir -p "$FEATURE_PATH/presentation"

# Create Domain subdirectories
mkdir -p "$FEATURE_PATH/domain/entities"
mkdir -p "$FEATURE_PATH/domain/repositories"
mkdir -p "$FEATURE_PATH/domain/usecases"

# Create Data subdirectories
mkdir -p "$FEATURE_PATH/data/datasources"
mkdir -p "$FEATURE_PATH/data/models"
mkdir -p "$FEATURE_PATH/data/repositories"

# Create Presentation subdirectories
mkdir -p "$FEATURE_PATH/presentation/pages"
mkdir -p "$FEATURE_PATH/presentation/widgets"
mkdir -p "$FEATURE_PATH/presentation/controllers"

# Create a placeholder main page file
touch "$FEATURE_PATH/presentation/pages/${FEATURE_NAME}_page.dart"

echo "✅ Feature '$FEATURE_NAME' structure created successfully at $FEATURE_PATH"
