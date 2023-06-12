import 'package:flutter/material.dart';

class GBM {
  static pushNamed({required BuildContext context, required String routeName}) {
    Navigator.of(context).pushNamed(routeName);
  }

  static pushAndReplaceNamed(
      {required BuildContext context, required String routeName}) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  static pop({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}
