import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/auth/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';

void main() {
  group('ForgotPasswordBloc', () {
    late ForgotPasswordBloc forgotPasswordBloc;

    setUp(() {
      forgotPasswordBloc = ForgotPasswordBloc();
    });

    tearDown(() {
      forgotPasswordBloc.close();
    });

    test('initial email state',
        () => expect(forgotPasswordBloc.state.email, emptyString));
    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'emits correct state when ForgotPasswordEvent is added',
      build: () => forgotPasswordBloc,
      act: (bloc) => bloc.add(const ForgotPasswordEvent('example@exmap.com')),
      expect: () => [const ForgotPasswordState(email: 'example@exmap.com')],
    );
  });
}
