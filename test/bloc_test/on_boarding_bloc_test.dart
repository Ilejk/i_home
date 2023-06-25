import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/core/on_boarding_bloc/on_boarding_bloc_bloc.dart';

void main() {
  group('OnBoardingBloc', () {
    late OnBoardingBlocBloc onBoardingBlocBloc;
    setUp(() => onBoardingBlocBloc = OnBoardingBlocBloc());
    tearDown(() => onBoardingBlocBloc.close());
    test('initial state is correct',
        () => expect(onBoardingBlocBloc.state.page, 0));
    blocTest<OnBoardingBlocBloc, OnBoardingBlocState>(
      'emits the correct stathe when ChangePageEvent is added',
      build: () => onBoardingBlocBloc,
      act: (bloc) => bloc.add(const OnBoardingBlocEvent(1)),
      expect: () => [const OnBoardingBlocState(page: 1)],
    );
    blocTest<OnBoardingBlocBloc, OnBoardingBlocState>(
      'emits the correct stathe when ChangePageEvent is added',
      build: () => onBoardingBlocBloc,
      act: (bloc) => bloc.add(const OnBoardingBlocEvent(2)),
      expect: () => [const OnBoardingBlocState(page: 2)],
    );
  });
}
