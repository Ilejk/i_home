import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.primaryDarkGrey,
      ),
    );
  }
}
