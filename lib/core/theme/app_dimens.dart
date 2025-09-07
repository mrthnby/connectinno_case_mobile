// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// Centralized spacing, sizing, animation durations, and border radius constants for the app.
///
/// Provides a consistent scale for spacing, predefined vertical/horizontal gaps,
/// common paddings, animation durations, and standard border radii.
final class AppDimens {
  AppDimens._(); // Private constructor to prevent instantiation.

  // --------------------------------------------------------------------------
  // Spacing scale
  // --------------------------------------------------------------------------

  static const double s4 = 4;
  static const double s8 = 8;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s50 = 50;
  static const double s64 = 64;

  // --------------------------------------------------------------------------
  // Predefined vertical gaps (SizedBox)
  // --------------------------------------------------------------------------

  static const SizedBox h4 = SizedBox(height: s4);
  static const SizedBox h8 = SizedBox(height: s8);
  static const SizedBox h16 = SizedBox(height: s16);
  static const SizedBox h24 = SizedBox(height: s24);
  static const SizedBox h32 = SizedBox(height: s32);

  // --------------------------------------------------------------------------
  // Predefined horizontal gaps (SizedBox)
  // --------------------------------------------------------------------------

  static const SizedBox w4 = SizedBox(width: s4);
  static const SizedBox w8 = SizedBox(width: s8);
  static const SizedBox w16 = SizedBox(width: s16);
  static const SizedBox w24 = SizedBox(width: s24);
  static const SizedBox w32 = SizedBox(width: s32);

  // --------------------------------------------------------------------------
  // Common paddings
  // --------------------------------------------------------------------------

  static const EdgeInsets defaultPagePadding = EdgeInsets.all(s24);

  // --------------------------------------------------------------------------
  // Animation durations
  // --------------------------------------------------------------------------

  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
}
