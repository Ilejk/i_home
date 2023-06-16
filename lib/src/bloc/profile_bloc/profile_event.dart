part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class PickImageEvent extends ProfileEvent {
  final String imageUrl;
  const PickImageEvent(this.imageUrl);
}
