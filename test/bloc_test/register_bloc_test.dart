import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/auth/register_bloc/register_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';

void main() {
  group('RegisterBloc', () {
    late RegisterBloc registerBloc;

    setUp(() {
      registerBloc = RegisterBloc();
    });

    tearDown(() {
      registerBloc.close();
    });

    test('initial email state',
        () => expect(registerBloc.state.email, emptyString));

    blocTest<RegisterBloc, RegisterState>(
      'emits correct state when RegisterEmailEvent is added',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterEmailEvent('exm@exmp.com')),
      expect: () => [const RegisterState(email: 'exm@exmp.com')],
    );

    test('initial password state',
        () => expect(registerBloc.state.password, emptyString));
    blocTest<RegisterBloc, RegisterState>(
      'emits correct state when RegisterPasswordEvent is added',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterPasswordEvent('password12345')),
      expect: () => [const RegisterState(password: 'password12345')],
    );

    test('initial name state',
        () => expect(registerBloc.state.name, emptyString));

    blocTest<RegisterBloc, RegisterState>(
      'emits correct state when RegisterNameEvent is added',
      build: () => registerBloc,
      act: (bloc) => bloc.add(const RegisterNameEvent('Jake Rake')),
      expect: () => [const RegisterState(name: 'Jake Rake')],
    );

    test('initial confrim password state',
        () => expect(registerBloc.state.confirmPassword, emptyString));

    blocTest<RegisterBloc, RegisterState>(
      'emits correct state when RegisterConfirmPasswordEvent is added',
      build: () => registerBloc,
      act: (bloc) =>
          bloc.add(const RegisterConfirmPasswordEvent('password12345')),
      expect: () => [const RegisterState(confirmPassword: 'password12345')],
    );
  });
}
