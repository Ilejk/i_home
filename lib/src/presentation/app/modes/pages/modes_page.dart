import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';

class ModesPage extends StatelessWidget {
  const ModesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      body: Center(
        child: Text(
          'modes',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
