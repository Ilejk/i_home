part of 'on_boarding_bloc_bloc.dart';

class OnBoardingBlocEvent extends Equatable {
  final int page;
  const OnBoardingBlocEvent(this.page);

  @override
  List<int?> get props => [page];
}
