import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/auth/change_password/change_password_bloc.dart';

void main() {
  group('ChangePasswordBloc', () {
    late ChangePasswordBloc changePasswordBloc;

    setUp(() {
      changePasswordBloc = ChangePasswordBloc();
    });

    tearDown(() {
      changePasswordBloc.close();
    });

    test('emits correct state when ChangePasswordOldPasswordEvent is added',
        () {
      const String oldPassword = 'oldPassword123';
      const expectedState = ChangePasswordState(oldPassword: oldPassword);

      blocTest<ChangePasswordBloc, ChangePasswordState>(
        'emits correct state when ChangePasswordOldPasswordEvent is added',
        build: () => changePasswordBloc,
        act: (bloc) =>
            bloc.add(const ChangePasswordOldPasswordEvent(oldPassword)),
        expect: () => [expectedState],
      );
    });

    test('emits correct state when ChangePasswordNewPasswordEvent is added',
        () {
      const String newPassword = 'newPassword456';
      const expectedState = ChangePasswordState(newPassword: newPassword);

      blocTest<ChangePasswordBloc, ChangePasswordState>(
        'emits correct state when ChangePasswordNewPasswordEvent is added',
        build: () => changePasswordBloc,
        act: (bloc) =>
            bloc.add(const ChangePasswordNewPasswordEvent(newPassword)),
        expect: () => [expectedState],
      );
    });
  });
}
