import 'package:bloc/bloc.dart';

part 'bottom_bar_bloc_event.dart';
part 'bottom_bar_bloc_state.dart';

class BottomBarBlocBloc extends Bloc<BottomBarBlocEvent, BottomBarBlocState> {
  BottomBarBlocBloc() : super(BottomBarBlocState()) {
    on<BottomBarBlocEvent>((event, emit) {
      emit(BottomBarBlocState(selectedIndex: state.selectedIndex));
    });
  }
}
