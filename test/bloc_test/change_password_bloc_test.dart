import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/auth/change_password/change_password_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';

void main() {
  group('ChangePasswordBloc', () {
    late ChangePasswordBloc changePasswordBloc;

    setUp(() {
      changePasswordBloc = ChangePasswordBloc();
    });

    tearDown(() {
      changePasswordBloc.close();
    });

    test('initial old password state',
        () => expect(changePasswordBloc.state.oldPassword, emptyString));
    blocTest<ChangePasswordBloc, ChangePasswordState>(
      'emits correct state when ChangePasswordOldPasswordEvent is added',
      build: () => changePasswordBloc,
      act: (bloc) =>
          bloc.add(const ChangePasswordOldPasswordEvent('oldPassword12345')),
      expect: () =>
          [const ChangePasswordState(oldPassword: 'oldPassword12345')],
    );

    test('initial new password state',
        () => expect(changePasswordBloc.state.newPassword, emptyString));
    blocTest<ChangePasswordBloc, ChangePasswordState>(
      'emits correct state when ChangePasswordNewPasswordEvent is added',
      build: () => changePasswordBloc,
      act: (bloc) =>
          bloc.add(const ChangePasswordNewPasswordEvent('newPassword1234')),
      expect: () => [const ChangePasswordState(newPassword: 'newPassword1234')],
    );
  });
}
