import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/auth/forgot_password_bloc/forgot_password_bloc.dart';

void main() {
  group('ForgotPasswordBloc', () {
    late ForgotPasswordBloc forgotPasswordBloc;

    setUp(() {
      forgotPasswordBloc = ForgotPasswordBloc();
    });

    tearDown(() {
      forgotPasswordBloc.close();
    });

    test('emits correct state when ForgotPasswordEvent is added', () {
      const String email = 'test@example.com';
      const expectedState = ForgotPasswordState(email: email);

      blocTest<ForgotPasswordBloc, ForgotPasswordState>(
        'emits correct state when ForgotPasswordEvent is added',
        build: () => forgotPasswordBloc,
        act: (bloc) => bloc.add(const ForgotPasswordEvent(email)),
        expect: () => [expectedState],
      );
    });
  });
}
