import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  /// Transition to a new screen
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  /// Transition and replace the current screen with a new one
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  /// Back to the previous screen
  Future<dynamic> pop() async => Navigator.of(this).pop();

  /// Transtion and remove all previous screens
  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) => Navigator.of(
    this,
  ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
}
extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
