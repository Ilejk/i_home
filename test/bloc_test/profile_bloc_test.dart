import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/core/profile_bloc/profile_bloc.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('ProfileBloc', () {
    late ProfileBloc profileBloc;

    setUp(() {
      profileBloc = ProfileBloc();
    });
    tearDown(() => profileBloc.close());
    test('initial image state is correct',
        () => expect(profileBloc.state.imagePickerURL, emptyString));
    test('initial userName state is correct',
        () => expect(profileBloc.state.userName, emptyString));
    blocTest<ProfileBloc, ProfileState>(
      'emits the correct state when the image is set',
      build: () => profileBloc,
      act: (bloc) => bloc.add(const PickImageEvent(
          'https://firebasestorage.googleapis.com/v0/b/i-home-a1f3f.appspot.com/o/images%2FNnf7NpdXgmRDZ5W8vkcMekHPq0p1?alt=media&token=f3826d4e-1202-457d-85f8-fde180b0674b')),
      expect: () => [
        const ProfileState(
            imagePickerURL:
                'https://firebasestorage.googleapis.com/v0/b/i-home-a1f3f.appspot.com/o/images%2FNnf7NpdXgmRDZ5W8vkcMekHPq0p1?alt=media&token=f3826d4e-1202-457d-85f8-fde180b0674b')
      ],
    );
    blocTest<ProfileBloc, ProfileState>(
      'emits the correct state when the username is set',
      build: () => profileBloc,
      act: (bloc) => bloc.add(const SetUserName('Jake Rake')),
      expect: () => [const ProfileState(userName: 'Jake Rake')],
    );
  });
}

class MockProfileBloc extends Mock implements ProfileBloc {}
