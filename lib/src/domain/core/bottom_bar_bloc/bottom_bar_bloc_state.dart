part of 'bottom_bar_bloc_bloc.dart';

class BottomBarBlocState extends Equatable {
  final int selectedIndex;

  const BottomBarBlocState({this.selectedIndex = 0});

  BottomBarBlocState copyWith({int? selectedIndex}) {
    return BottomBarBlocState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<int> get props => [selectedIndex];
}
