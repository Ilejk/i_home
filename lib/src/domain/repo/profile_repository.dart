import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/bloc/profile_bloc/profile_bloc.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/flutter_toast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository {
  final BuildContext context;

  const ProfileRepository({required this.context});
  Future<void> handleImagePicking(ImageSource imageSource) async {
    try {
      final currentUseruid = FirebaseAuth.instance.currentUser!.uid;
      final state = context.read<ProfileBloc>().state;
      String pickedImage = state.imagePickerURL;
      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: imageSource);
      if (file == null) return;
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload =
          referenceDirImages.child(currentUseruid);
      try {
        await referenceImageToUpload.putFile(File(file.path));
        pickedImage = await referenceImageToUpload.getDownloadURL();
      } catch (e) {
        toastInfo(msg: e.toString());
      }
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUseruid)
            .update({
          'imageUrl': pickedImage,
        });
      } catch (e) {
        toastInfo(msg: e.toString());
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }

  Future<String> handleSetUserName() async {
    try {
      final state = context.read<ProfileBloc>().state;
      String setUserName = state.userName;

      try {
        final currentUseruid = FirebaseAuth.instance.currentUser!.uid;
        DocumentSnapshot userDataSnapShot = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUseruid)
            .get();
        setUserName = userDataSnapShot.get('name');
        return setUserName;
      } catch (e) {
        toastInfo(msg: e.toString());
        return '';
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
      return '';
    }
  }

  Future<String> handleSetImageUrl() async {
    try {
      final currentUseruid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDataSnapShot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUseruid)
          .get();
      return userDataSnapShot.get('imageUrl');
    } catch (e) {
      toastInfo(msg: e.toString());
      return '';
    }
  }
}
