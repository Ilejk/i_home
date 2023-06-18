import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_home/src/domain/models/device_model.dart';

class DeviceRepository {
  final BuildContext context;
  DeviceRepository(this.context);
  final List<DeviceModel> _devices = [];
  List<DeviceModel> get devices {
    return [..._devices];
  }

  Future<List<DeviceModel>> fetchAndSetDevices() async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      final deviceSnapShot = await FirebaseFirestore.instance
          .collection('devices')
          .doc(user!.uid)
          .collection('deviceData')
          .get();
      final List<DeviceModel> loadedDevices = [];
      for (var doc in deviceSnapShot.docs) {
        final deviceData = doc.data();
        loadedDevices.add(
          DeviceModel(
            image: deviceData['imageURL'],
            isOnValue: deviceData['isOnValue'],
            name: deviceData['name'],
            type: deviceData['type'],
            deviceID: deviceData['deviceID'],
          ),
        );
      }
      _devices.clear();
      _devices.addAll(loadedDevices);
      return loadedDevices;
    } catch (e) {
      rethrow;
    }
  }
}
