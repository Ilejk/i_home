import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar_bloc_event.dart';
part 'bottom_bar_bloc_state.dart';

class BottomBarBlocBloc extends Bloc<BottomBarBlocEvent, BottomBarBlocState> {
  BottomBarBlocBloc() : super(const BottomBarBlocState()) {
    on<BottomBarBlocEvent>(_changeBottomBarEvent);
  }
  void _changeBottomBarEvent(
      BottomBarBlocEvent event, Emitter<BottomBarBlocState> emit) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }
}
