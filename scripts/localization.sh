#!/usr/bin/env bash

# Usage: ./scripts/localization.sh
#
# Runs the Easy Localization code generator to produce Dart keys for
# all translations defined in `assets/translations/` and outputs them to `lib/gen/locale_keys.g.dart`.
#
# Flags explained:
#   -S assets/translations      → Source directory containing your JSON/CSV translation files.
#   -f keys                     → Generation format; "keys" means it generates constant keys.
#   -O lib/gen                  → Output directory for the generated file.
#   -o locale_keys.g.dart       → Output file name.
#
# This allows you to safely reference translations in code like:
#   Text(LocaleKeys.my_home_title.tr())
#
# Notes:
# - Make the script executable once with:
#       chmod +x scripts/generate_locales.sh
#   Then run it directly with:
#       ./scripts/generate_locales.sh
# - Alternatively, run without chmod:
#       bash scripts/generate_locales.sh

dart run easy_localization:generate -S assets/translations -f keys -O lib/gen -o locale_keys.g.dart
