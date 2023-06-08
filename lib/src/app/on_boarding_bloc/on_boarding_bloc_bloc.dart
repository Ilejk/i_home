import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_bloc_event.dart';
part 'on_boarding_bloc_state.dart';
part 'on_boarding_bloc_bloc.freezed.dart';

class OnBoardingBlocBloc extends Bloc<OnBoardingBlocEvent, OnBoardingBlocState> {
  OnBoardingBlocBloc() : super(_Initial()) {
    on<OnBoardingBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
