import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/core/edit_account_bloc/edit_account_bloc.dart';

void main() {
  group('EditAccountBloc', () {
    late EditAccountBloc editAccountBloc;

    setUp(() {
      editAccountBloc = EditAccountBloc();
    });

    tearDown(() {
      editAccountBloc.close();
    });

    test('initial state is correct', () {
      expect(editAccountBloc.state, const EditAccountState());
    });

    blocTest<EditAccountBloc, EditAccountState>(
      'emits the correct state when EditAccountNewEmailEvent is added',
      build: () => editAccountBloc,
      act: (bloc) =>
          bloc.add(const EditAccountNewEmailEvent('example@example.com')),
      expect: () => [
        const EditAccountState(newEmail: 'example@example.com'),
      ],
    );

    blocTest<EditAccountBloc, EditAccountState>(
      'emits the correct state when EditAccountNewNameEvent is added',
      build: () => editAccountBloc,
      act: (bloc) => bloc.add(const EditAccountNewNameEvent('Jake Rake')),
      expect: () => [
        const EditAccountState(newName: 'Jake Rake'),
      ],
    );

    blocTest<EditAccountBloc, EditAccountState>(
      'emits the correct state when EditAccountPasswordEvent is added',
      build: () => editAccountBloc,
      act: (bloc) => bloc.add(const EditAccountPasswordEvent('password123')),
      expect: () => [
        const EditAccountState(password: 'password123'),
      ],
    );
  });
}
