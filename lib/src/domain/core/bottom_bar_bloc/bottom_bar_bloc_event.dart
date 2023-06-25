part of 'bottom_bar_bloc_bloc.dart';

class BottomBarBlocEvent extends Equatable {
  final int selectedIndex;

  const BottomBarBlocEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}
