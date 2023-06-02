import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_home/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // configureInjection(Environment.prod);
  runApp(
    const AppWidget(),
  );
}
