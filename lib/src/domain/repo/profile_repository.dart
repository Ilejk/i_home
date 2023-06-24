import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/domain/core/profile_bloc/profile_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/flutter_toast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository {
  final BuildContext context;

  const ProfileRepository({required this.context});

  Future<void> handleImagePicking(ImageSource imageSource) async {
    try {
      final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
      final state = context.read<ProfileBloc>().state;
      String pickedImage = state.imagePickerURL;

      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: imageSource);
      if (file == null) return;

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload =
          referenceDirImages.child(currentUserUid);

      try {
        await referenceImageToUpload.putFile(File(file.path));
        pickedImage = await referenceImageToUpload.getDownloadURL();
      } catch (e) {
        toastInfo(msg: e.toString());
      }

      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserUid)
            .update({'imageUrl': pickedImage});
      } catch (e) {
        toastInfo(msg: e.toString());
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }

  Future<String> handleSetUserName() async {
    try {
      final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
      String setUserName = emptyString;

      try {
        DocumentSnapshot userDataSnapShot = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserUid)
            .get();
        setUserName = userDataSnapShot.get('name');
        return setUserName;
      } catch (e) {
        toastInfo(msg: e.toString());
        return emptyString;
      }
    } catch (e) {
      toastInfo(msg: StringManager.netError);
      return emptyString;
    }
  }

  Future<String> handleSetImageUrl() async {
    try {
      final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDataSnapShot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .get();
      return userDataSnapShot.get('imageUrl') ?? emptyString;
    } catch (e) {
      return emptyString;
    }
  }
}
