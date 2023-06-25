part of 'on_boarding_bloc_bloc.dart';

class OnBoardingBlocState extends Equatable {
  final int page;
  const OnBoardingBlocState({this.page = 0});

  OnBoardingBlocState copyWith({int? page}) {
    return OnBoardingBlocState(page: page ?? this.page);
  }

  @override
  List<int?> get props => [page];
}
