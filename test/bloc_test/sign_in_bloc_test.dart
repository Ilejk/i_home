import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/auth/sign_in_bloc/sign_in_bloc.dart';

void main() {
  group('SignInBloc', () {
    late SignInBloc signInBloc;

    setUp(() {
      signInBloc = SignInBloc();
    });

    tearDown(() {
      signInBloc.close();
    });

    test('emits correct state when SignInEmailEvent is added', () {
      const String email = 'test@example.com';
      const expectedState = SignInState(email: email);

      blocTest<SignInBloc, SignInState>(
        'emits correct state when SignInEmailEvent is added',
        build: () => signInBloc,
        act: (bloc) => bloc.add(const SignInEmailEvent(email)),
        expect: () => [expectedState],
      );
    });

    test('emits correct state when SignInPasswordEvent is added', () {
      const String password = 'password123';
      const expectedState = SignInState(password: password);

      blocTest<SignInBloc, SignInState>(
        'emits correct state when SignInPasswordEvent is added',
        build: () => signInBloc,
        act: (bloc) => bloc.add(const SignInPasswordEvent(password)),
        expect: () => [expectedState],
      );
    });
  });
}
