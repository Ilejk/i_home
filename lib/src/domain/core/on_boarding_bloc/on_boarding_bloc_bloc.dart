import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_bloc_event.dart';
part 'on_boarding_bloc_state.dart';

class OnBoardingBlocBloc
    extends Bloc<OnBoardingBlocEvent, OnBoardingBlocState> {
  OnBoardingBlocBloc() : super(const OnBoardingBlocState()) {
    on<OnBoardingBlocEvent>(_onBoardingChangeEvent);
  }
  void _onBoardingChangeEvent(
      OnBoardingBlocEvent event, Emitter<OnBoardingBlocState> emit) {
    emit(state.copyWith(page: event.page));
  }
}
