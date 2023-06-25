import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/auth/register_bloc/register_bloc.dart';

void main() {
  group('RegisterBloc', () {
    late RegisterBloc registerBloc;

    setUp(() {
      registerBloc = RegisterBloc();
    });

    tearDown(() {
      registerBloc.close();
    });

    test('emits correct state when RegisterEmailEvent is added', () {
      const String email = 'test@example.com';
      const expectedState = RegisterState(email: email);

      blocTest<RegisterBloc, RegisterState>(
        'emits correct state when RegisterEmailEvent is added',
        build: () => registerBloc,
        act: (bloc) => bloc.add(const RegisterEmailEvent(email)),
        expect: () => [expectedState],
      );
    });

    test('emits correct state when RegisterPasswordEvent is added', () {
      const String password = 'password123';
      const expectedState = RegisterState(password: password);

      blocTest<RegisterBloc, RegisterState>(
        'emits correct state when RegisterPasswordEvent is added',
        build: () => registerBloc,
        act: (bloc) => bloc.add(const RegisterPasswordEvent(password)),
        expect: () => [expectedState],
      );
    });

    test('emits correct state when RegisterNameEvent is added', () {
      const String name = 'John Doe';
      const expectedState = RegisterState(name: name);

      blocTest<RegisterBloc, RegisterState>(
        'emits correct state when RegisterNameEvent is added',
        build: () => registerBloc,
        act: (bloc) => bloc.add(const RegisterNameEvent(name)),
        expect: () => [expectedState],
      );
    });

    test('emits correct state when RegisterConfirmPasswordEvent is added', () {
      const String confirmPassword = 'password123';
      const expectedState = RegisterState(confirmPassword: confirmPassword);

      blocTest<RegisterBloc, RegisterState>(
        'emits correct state when RegisterConfirmPasswordEvent is added',
        build: () => registerBloc,
        act: (bloc) =>
            bloc.add(const RegisterConfirmPasswordEvent(confirmPassword)),
        expect: () => [expectedState],
      );
    });
  });
}
