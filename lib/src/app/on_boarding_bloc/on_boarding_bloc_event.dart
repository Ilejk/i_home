part of 'on_boarding_bloc_bloc.dart';

@freezed
class OnBoardingBlocEvent with _$OnBoardingBlocEvent {
  const factory OnBoardingBlocEvent.started() = _Started;
}