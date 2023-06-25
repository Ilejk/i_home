import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i_home/src/domain/core/bottom_bar_bloc/bottom_bar_bloc_bloc.dart';

void main() {
  group('BottomBarBloc', () {
    late BottomBarBlocBloc bottomBarBloc;

    setUp(() {
      bottomBarBloc = BottomBarBlocBloc();
    });

    tearDown(() {
      bottomBarBloc.close();
    });

    test('initial state is correct', () {
      expect(bottomBarBloc.state.selectedIndex, 0);
    });

    blocTest<BottomBarBlocBloc, BottomBarBlocState>(
      'emits the correct state when ChangeNavBarPageEvent is added',
      build: () => bottomBarBloc,
      act: (bloc) => bloc.add(const BottomBarBlocEvent(1)),
      expect: () => [
        const BottomBarBlocState(selectedIndex: 1),
      ],
    );
  });
}
