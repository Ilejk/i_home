import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';

class SpeakPage extends StatelessWidget {
  const SpeakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      body: Center(
        child: Text(
          'speak',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
