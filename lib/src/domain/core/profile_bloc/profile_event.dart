part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class PickImageEvent extends ProfileEvent {
  final String imageUrl;
  const PickImageEvent(this.imageUrl);

  @override
  List<String?> get props => [imageUrl];
}

class SetUserName extends ProfileEvent {
  final String userName;
  const SetUserName(this.userName);

  @override
  List<String?> get props => [userName];
}
