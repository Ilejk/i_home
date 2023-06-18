import 'package:flutter/material.dart';

class DeviceModel {
  final String type;
  final String name;
  final bool isOnValue;
  final String image;
  final String deviceID;

  DeviceModel({
    required this.image,
    required this.isOnValue,
    required this.name,
    required this.type,
    required this.deviceID,
  });
}
