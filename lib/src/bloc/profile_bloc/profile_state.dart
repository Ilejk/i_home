part of 'profile_bloc.dart';

class ProfileState {
  final String imagePickerURL;
  final String userName;
  const ProfileState({
    this.imagePickerURL = '',
    this.userName = '',
  });

  ProfileState copywith({String? imagePickerURL, String? userName}) {
    return ProfileState(
      imagePickerURL: imagePickerURL ?? this.imagePickerURL,
      userName: userName ?? this.userName,
    );
  }
}
