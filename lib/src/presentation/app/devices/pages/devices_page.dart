import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryDarkGrey,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              //TODO
            },
            icon: const Icon(
              CupertinoIcons.add,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
      backgroundColor: ColorManager.primaryDarkGrey,
      body: Container(),
    );
  }
}
