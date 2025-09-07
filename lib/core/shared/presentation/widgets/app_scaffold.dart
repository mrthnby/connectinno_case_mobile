import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:flutter/material.dart';

/// A reusable scaffold widget that provides consistent padding and safe area.
///
/// Wraps [Scaffold] with [SafeArea] and a default page padding for content.
///
/// Example usage:
/// ```dart
/// AppScaffold(
///   appBar: AppBar(title: Text('Home')),
///   child: Column(
///     children: [
///       Text('Hello World'),
///       AppDimens.h16, // vertical gap
///       Text('Another text'),
///     ],
///   ),
/// );
/// ```
class AppScaffold extends StatelessWidget {
  /// Creates a new instance of [AppScaffold].
  const AppScaffold({
    super.key,
    this.child,
    this.appBar,
    this.padding = AppDimens.defaultPagePadding,
  });

  /// Optional [AppBar] for the scaffold.
  final PreferredSizeWidget? appBar;

  /// The main content of the scaffold.
  final Widget? child;

  /// Padding around the body content. Defaults to [AppDimens.defaultPagePadding].
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
