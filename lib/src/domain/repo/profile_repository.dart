import 'dart:io';

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
      final state = context.read<ProfileBloc>().state;
      String pickedImage = state.imagePickerURL;
      ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(source: imageSource);
      if (file == null) return;
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);
      try {
        await referenceImageToUpload.putFile(File(file.path));
        pickedImage = await referenceImageToUpload.getDownloadURL();
      } catch (e) {}
    } catch (e) {
      toastInfo(msg: StringManager.netError);
    }
  }
}
