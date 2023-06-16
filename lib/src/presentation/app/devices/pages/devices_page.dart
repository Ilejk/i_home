import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      body: Center(
        child: Text(
          'Devices',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
