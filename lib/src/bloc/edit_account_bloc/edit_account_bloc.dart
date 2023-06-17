import 'package:bloc/bloc.dart';

part 'edit_account_event.dart';
part 'edit_account_state.dart';

class EditAccountBloc extends Bloc<EditAccountEvent, EditAccountState> {
  EditAccountBloc() : super(const EditAccountState()) {
    on<EditAccountNewEmailEvent>(_editAccountNewEmailEvent);
    on<EditAccountNewNameEvent>(_editAccountNewNameEvent);
  }
  void _editAccountNewEmailEvent(
      EditAccountNewEmailEvent event, Emitter<EditAccountState> emit) {
    emit(state.copyWith(newEmail: event.newEmail));
  }

  void _editAccountNewNameEvent(
      EditAccountNewNameEvent event, Emitter<EditAccountState> emit) {
    emit(state.copyWith(newName: event.newName));
  }
}
