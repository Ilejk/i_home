part of 'profile_bloc.dart';

class ProfileState {
  final String imagePickerURL;
  const ProfileState({
    this.imagePickerURL = '',
  });

  ProfileState copywith({String? imagePickerURL}) {
    return ProfileState(
      imagePickerURL: imagePickerURL ?? this.imagePickerURL,
    );
  }
}
