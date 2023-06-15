import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_home/firebase_options.dart';
import 'package:i_home/src/domain/service/storage_service.dart';

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

  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageService = await StorageService().init();
  }
}
