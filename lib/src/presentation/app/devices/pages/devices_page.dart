import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/bloc/device_bloc/device_bloc.dart';
import 'package:i_home/src/presentation/app/devices/widgets/smart_box_widget.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DeviceBloc>().add(FetchDevicesEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceBloc, DeviceState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: GBM.spinkit);
        }
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
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      final deviceData = context
                          .read<DeviceBloc>()
                          .deviceRepository
                          .devices[index];
                      return SmartBoxWidget(
                        name: deviceData.name,
                        type: deviceData.type,
                        image: deviceData.image,
                        isOnValue: deviceData.isOnValue,
                        onChaned: (value) {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
