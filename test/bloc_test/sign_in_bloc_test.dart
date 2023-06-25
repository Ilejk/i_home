import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';

void main() {
  group('SignInBloc', () {
    late SignInBloc signInBloc;

    setUp(() {
      signInBloc = SignInBloc();
    });

    tearDown(() {
      signInBloc.close();
    });

    test('initial email state',
        () => expect(signInBloc.state.email, emptyString));

    blocTest<SignInBloc, SignInState>(
      'emits correct state when SignInEmailEvent is added',
      build: () => signInBloc,
      act: (bloc) => bloc.add(const SignInEmailEvent('exm@exmp.com')),
      expect: () => [const SignInState(email: 'exm@exmp.com')],
    );

    test('initial password state',
        () => expect(signInBloc.state.password, emptyString));

    blocTest<SignInBloc, SignInState>(
      'emits correct state when SignInPasswordEvent is added',
      build: () => signInBloc,
      act: (bloc) => bloc.add(const SignInPasswordEvent('password123')),
      expect: () => [const SignInState(password: 'password123')],
    );
  });
}
