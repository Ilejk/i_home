import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/core/app_widget.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';

void main() async {
  await GBM.init();
  runApp(
    const AppWidget(),
  );
}
