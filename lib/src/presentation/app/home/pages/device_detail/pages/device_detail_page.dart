import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/presentation/app/home/pages/device_detail/widgets/ac_mode_widget.dart';
import 'package:i_home/src/presentation/app/home/pages/device_detail/widgets/light_mode_widget.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
  double _currentLightSliderValue = 0;
  double _currentACSliderValue = 0;
  String flowDirection = StringManager.airFlowDown;
  String airFlowRate = StringManager.airFlowLow;
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

  Widget getSmartFridgeBody() {
    return Column();
  }

  Widget getSmartAcBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: PaddingManager.p12.w,
        vertical: PaddingManager.p12.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeManager.deviceHeight / 3.5,
            width: SizeManager.deviceWidth,
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  left: (SizeManager.deviceWidth - 294) / 2,
                  child: CircularPercentIndicator(
                    startAngle: 270,
                    circularStrokeCap: CircularStrokeCap.round,
                    radius: SizeManager.s135,
                    backgroundColor: ColorManager.primaryDarkGrey,
                    lineWidth: SizeManager.s15,
                    percent: (_currentACSliderValue / 100) / 2,
                    center: TextWidget(
                      text:
                          '${(_currentACSliderValue / 3).toStringAsFixed(0)} C',
                      maxLines: 2,
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s30,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    progressColor: ColorManager.accentDarkYellow,
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 12,
                  child: Container(
                    width: SizeManager.deviceWidth - 48,
                    decoration: BoxDecoration(
                        color: ColorManager.secondaryDarkGrey,
                        borderRadius: BorderRadius.circular(SizeManager.s20),
                        border: Border.all(
                          color: ColorManager.accentDarkYellow,
                          width: SizeManager.s3,
                        )),
                    child: Slider(
                      thumbColor: ColorManager.accentDarkYellow,
                      secondaryActiveColor: ColorManager.accentLightYellow,
                      inactiveColor: ColorManager.secondaryDarkGrey,
                      activeColor: ColorManager.accentDarkYellow,
                      value: _currentACSliderValue,
                      max: 100,
                      divisions: 20,
                      label: _currentACSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentACSliderValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const HeightSpacer(iH: SizeManager.s20),
          Container(
            width: SizeManager.deviceWidth,
            height: SizeManager.s300.h,
            decoration: BoxDecoration(
              color: ColorManager.secondaryDarkGrey,
              borderRadius: BorderRadius.circular(SizeManager.s20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(PaddingManager.p12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ACModeWidget(
                        onTap: () {
                          setState(() {
                            _currentACSliderValue = 60;
                          });
                        },
                        modeName: StringManager.cooling,
                        icon: CupertinoIcons.cloud_moon,
                        isSelected: _currentACSliderValue <= 60 &&
                                _currentACSliderValue != 0
                            ? true
                            : false,
                      ),
                      ACModeWidget(
                        onTap: () {
                          setState(() {
                            _currentACSliderValue = 70;
                          });
                        },
                        modeName: StringManager.heating,
                        icon: CupertinoIcons.cloud_moon,
                        isSelected: _currentACSliderValue >= 70 ? true : false,
                      ),
                      ACModeWidget(
                        onTap: () {
                          setState(() {
                            _currentACSliderValue = 63;
                          });
                        },
                        modeName: StringManager.airwave,
                        icon: CupertinoIcons.cloud_moon,
                        isSelected: _currentACSliderValue == 63 ? true : false,
                      ),
                    ],
                  ),
                  const HeightSpacer(iH: SizeManager.s20),
                  Container(
                    width: SizeManager.deviceWidth,
                    height: SizeManager.s80.h,
                    decoration: BoxDecoration(
                      color: ColorManager.accentDarkGrey,
                      borderRadius: BorderRadius.circular(SizeManager.s20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(PaddingManager.p12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: StringManager.airFlowDirection,
                            maxLines: 1,
                            align: TextAlign.center,
                            style: appTextStyleWidget(
                              size: FontSize.s15,
                              color: ColorManager.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: changeFlowDirection,
                                icon: const Icon(
                                  IconlyLight.arrow_left_2,
                                  size: SizeManager.s30,
                                  color: ColorManager.white,
                                ),
                              ),
                              TextWidget(
                                text: flowDirection,
                                maxLines: 1,
                                align: TextAlign.center,
                                style: appTextStyleWidget(
                                  size: FontSize.s20,
                                  color: ColorManager.accentDarkYellow,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              IconButton(
                                onPressed: changeFlowDirection,
                                icon: const Icon(
                                  IconlyLight.arrow_right_2,
                                  size: SizeManager.s30,
                                  color: ColorManager.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const HeightSpacer(iH: SizeManager.s10),
                  Container(
                    width: SizeManager.deviceWidth,
                    height: SizeManager.s80.h,
                    decoration: BoxDecoration(
                      color: ColorManager.accentDarkGrey,
                      borderRadius: BorderRadius.circular(SizeManager.s20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(PaddingManager.p12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: StringManager.airFlowRate,
                            maxLines: 1,
                            align: TextAlign.center,
                            style: appTextStyleWidget(
                              size: FontSize.s15,
                              color: ColorManager.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: changeAirFlowDown,
                                icon: const Icon(
                                  IconlyLight.arrow_left_2,
                                  size: SizeManager.s30,
                                  color: ColorManager.white,
                                ),
                              ),
                              TextWidget(
                                text: airFlowRate,
                                maxLines: 1,
                                align: TextAlign.center,
                                style: appTextStyleWidget(
                                  size: FontSize.s20,
                                  color: ColorManager.accentDarkYellow,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              IconButton(
                                onPressed: changeAirFlowUp,
                                icon: const Icon(
                                  IconlyLight.arrow_right_2,
                                  size: SizeManager.s30,
                                  color: ColorManager.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HeightSpacer(iH: SizeManager.s20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: autoACMode,
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
                      text: StringManager.autoAcMode,
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
                onTap: turnOnACFunction,
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

  void changeAirFlowDown() {
    if (airFlowRate == StringManager.airFlowLow) {
      airFlowRate = StringManager.airFlowHigh;
    } else if (airFlowRate == StringManager.airFlowHigh) {
      airFlowRate = StringManager.airFlowMedium;
    } else if (airFlowRate == StringManager.airFlowMedium) {
      airFlowRate = StringManager.airFlowLow;
    }
    setState(() {});
  }

  void changeAirFlowUp() {
    if (airFlowRate == StringManager.airFlowLow) {
      airFlowRate = StringManager.airFlowMedium;
    } else if (airFlowRate == StringManager.airFlowMedium) {
      airFlowRate = StringManager.airFlowHigh;
    } else if (airFlowRate == StringManager.airFlowHigh) {
      airFlowRate = StringManager.airFlowLow;
    }
    setState(() {});
  }

  void changeFlowDirection() {
    if (flowDirection == StringManager.airFlowDown) {
      flowDirection = StringManager.airFlowUp;
    } else if (flowDirection == StringManager.airFlowUp) {
      flowDirection = StringManager.airFlowDown;
    }
    setState(() {});
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
                      text: StringManager.powerPercentage,
                      maxLines: 2,
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s20,
                        color: ColorManager.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextWidget(
                      text: '${_currentLightSliderValue.toStringAsFixed(0)} %',
                      align: TextAlign.center,
                      style: appTextStyleWidget(
                        size: FontSize.s25,
                        color: ColorManager.accentDarkYellow,
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
                                (_currentLightSliderValue * 2).toInt(),
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
                border: Border.all(
                  color: ColorManager.accentDarkYellow,
                  width: SizeManager.s3,
                )),
            child: Slider(
              thumbColor: ColorManager.accentDarkYellow,
              secondaryActiveColor: ColorManager.accentLightYellow,
              inactiveColor: ColorManager.secondaryDarkGrey,
              activeColor: ColorManager.accentDarkYellow,
              value: _currentLightSliderValue,
              max: 100,
              divisions: 20,
              label: _currentLightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentLightSliderValue = value;
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
                      _currentLightSliderValue = 25;
                      setState(() {});
                    },
                    modeName: StringManager.dimMode,
                    modePercentage: StringManager.percentage25,
                    isSelected: _currentLightSliderValue == 25 ? true : false,
                  ),
                  LightModeWidget(
                    onTap: () {
                      _currentLightSliderValue = 50;
                      setState(() {});
                    },
                    modeName: StringManager.mediumMode,
                    modePercentage: StringManager.percentage50,
                    isSelected: _currentLightSliderValue == 50 ? true : false,
                  ),
                  LightModeWidget(
                    onTap: () {
                      _currentLightSliderValue = 100;
                      setState(() {});
                    },
                    modeName: StringManager.brightMode,
                    modePercentage: StringManager.percentage100,
                    isSelected: _currentLightSliderValue == 100 ? true : false,
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
                onTap: lowPowerModeLightFunction,
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
                      text: StringManager.lowPowerMode,
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
                onTap: turnOnLightFunction,
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

  void lowPowerModeLightFunction() {
    if (_currentLightSliderValue > 25) {
      _currentLightSliderValue = 25;
    }
    setState(() {});
  }

  void autoACMode() {
    _currentACSliderValue = 68;
    setState(() {});
  }

  void turnOnLightFunction() {
    if (_currentLightSliderValue >= 1) {
      _currentLightSliderValue = 0;
    } else if (_currentLightSliderValue == 0) {
      _currentLightSliderValue = 100;
    }
    setState(() {});
  }

  void turnOnACFunction() {
    if (_currentACSliderValue >= 1) {
      _currentACSliderValue = 0;
    } else if (_currentACSliderValue == 0) {
      _currentACSliderValue = 75;
    }
    setState(() {});
  }
}
