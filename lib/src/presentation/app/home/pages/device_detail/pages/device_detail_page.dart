import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/app/home/pages/device_detail/widgets/light_mode_widget.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';

class DeviceDetailPage extends StatefulWidget {
  const DeviceDetailPage({
    super.key,
    required this.index,
  });
  final int index;
  @override
  State<DeviceDetailPage> createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorManager.primaryDarkGrey,
        title: getAppBarTitle(widget.index),
      ),
      body: getDeviceDetailBody(widget.index),
    );
  }

  Widget getAppBarTitle(int index) {
    String title = '';
    var isSmartTv = index == 0;
    var isSmartAc = index == 1;
    var isSmartLight = index == 2;
    var isSmartFridge = index == 3;
    if (isSmartTv) {
      title = 'SMART TV';
    } else if (isSmartAc) {
      title = 'SMART AC';
    } else if (isSmartLight) {
      title = 'SMART LIGHT';
    } else if (isSmartFridge) {
      title = 'SMART FRIDGE';
    }
    return TextWidget(
      text: title,
      style: appTextStyleWidget(
        size: FontSize.s20,
        color: ColorManager.white,
        fontWeight: FontWeight.normal,
        letterSpacing: SizeManager.s2,
      ),
    );
  }

  Widget getDeviceDetailBody(int index) {
    var isSmartTv = index == 0;
    var isSmartAc = index == 1;
    var isSmartLight = index == 2;
    var isSmartFridge = index == 3;

    if (isSmartTv) {
      return getSmartTvBody();
    } else if (isSmartAc) {
      return getSmartAcBody();
    } else if (isSmartLight) {
      return getSmartLightbody(index);
    } else if (isSmartFridge) {
      return getSmartFridgeBody();
    }
    return Container();
  }

  Widget getSmartTvBody() {
    return Column();
  }

  Widget getSmartAcBody() {
    return Column();
  }

  Widget getSmartLightbody(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: PaddingManager.p12.w,
        vertical: PaddingManager.p12.h,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(PaddingManager.p12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Power\npercentage',
                      maxLines: 2,
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s20,
                        color: ColorManager.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextWidget(
                      text: '${_currentSliderValue.toStringAsFixed(0)} %',
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s25,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: SizeManager.s100.h,
                      width: SizeManager.s1.w,
                      color: ColorManager.accentLightYellow,
                    ),
                    Container(
                      width: SizeManager.s150.w,
                      height: SizeManager.s100.h,
                      decoration: BoxDecoration(
                        color: ColorManager.secondaryDarkGrey,
                        border: Border.all(
                            color: ColorManager.accentDarkYellow,
                            width: SizeManager.s3),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(SizeManager.s110),
                          topRight: Radius.circular(SizeManager.s110),
                        ),
                      ),
                    ),
                    Container(
                      width: SizeManager.s75.w,
                      height: SizeManager.s30.h,
                      decoration: BoxDecoration(
                        color: ColorManager.accentDarkYellow,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(SizeManager.s110),
                          bottomLeft: Radius.circular(SizeManager.s110),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(
                                (_currentSliderValue * 2).toInt(),
                                255,
                                235,
                                59),
                            spreadRadius: 5,
                            blurRadius: 4,
                            offset: const Offset(-3, 2),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const HeightSpacer(iH: SizeManager.s50),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.secondaryDarkGrey,
              borderRadius: BorderRadius.circular(SizeManager.s20),
            ),
            child: Slider(
              thumbColor: ColorManager.accentDarkYellow,
              secondaryActiveColor: ColorManager.accentLightYellow,
              inactiveColor: ColorManager.secondaryDarkGrey,
              activeColor: ColorManager.accentDarkYellow,
              value: _currentSliderValue,
              max: 100,
              divisions: 20,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          const HeightSpacer(iH: SizeManager.s30),
          Container(
            height: SizeManager.s135.h,
            width: SizeManager.deviceWidth,
            decoration: BoxDecoration(
              color: ColorManager.secondaryDarkGrey,
              borderRadius: BorderRadius.circular(SizeManager.s20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(PaddingManager.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LightModeWidget(
                    onTap: () {
                      _currentSliderValue = 25;
                      setState(() {});
                    },
                    modeName: 'Dim\nlighting',
                    modePercentage: '25 %',
                    isSelected: _currentSliderValue == 25 ? true : false,
                  ),
                  LightModeWidget(
                    onTap: () {
                      _currentSliderValue = 50;
                      setState(() {});
                    },
                    modeName: 'Medium\nlighting',
                    modePercentage: '50 %',
                    isSelected: _currentSliderValue == 50 ? true : false,
                  ),
                  LightModeWidget(
                    onTap: () {
                      _currentSliderValue = 100;
                      setState(() {});
                    },
                    modeName: 'Bright\nlighting',
                    modePercentage: '100 %',
                    isSelected: _currentSliderValue == 100 ? true : false,
                  ),
                ],
              ),
            ),
          ),
          const HeightSpacer(iH: SizeManager.s30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: lowPowerModeFunction,
                child: Container(
                  height: SizeManager.s80.h,
                  width: SizeManager.s200.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.accentDarkYellow,
                      width: SizeManager.s3,
                    ),
                    color: ColorManager.secondaryDarkGrey,
                    borderRadius: BorderRadius.circular(SizeManager.s50),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: 'Low power mode',
                      maxLines: 2,
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s17,
                        color: ColorManager.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: turnOnFunction,
                child: Container(
                  height: SizeManager.s80.h,
                  width: SizeManager.s80.h,
                  decoration: BoxDecoration(
                    color: ColorManager.secondaryDarkGrey,
                    border: Border.all(
                      color: ColorManager.accentDarkYellow,
                      width: SizeManager.s3,
                    ),
                    borderRadius: BorderRadius.circular(SizeManager.s50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingManager.p15),
                    child: Image.asset(
                      ImageManager.homeTurnOn,
                      color: ColorManager.accentDarkYellow,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void lowPowerModeFunction() {
    if (_currentSliderValue > 25) {
      _currentSliderValue = 25;
    }
    setState(() {});
  }

  void turnOnFunction() {
    if (_currentSliderValue >= 1) {
      _currentSliderValue = 0;
    } else if (_currentSliderValue == 0) {
      _currentSliderValue = 100;
    }
    setState(() {});
  }

  Widget getSmartFridgeBody() {
    return Column();
  }
}
