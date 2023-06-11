import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/app/on_boarding_bloc/on_boarding_bloc_bloc.dart';
import 'package:i_home/src/presentation/pages/on_boarding_page/widgets/on_boarding_page_column.dart';
import 'package:i_home/src/presentation/pages/on_boarding_page/widgets/photo_type_grids.dart';
import 'package:i_home/src/presentation/router/router.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_home/src/presentation/utils/services/global_methods.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      body: BlocBuilder<OnBoardingBlocBloc, OnBoardingBlocState>(
        builder: (context, state) {
          return SizedBox(
            width: SizeManager.deviceWidth,
            child: Stack(
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<OnBoardingBlocBloc>(context).add(
                      OnBoardingBlocEvent(),
                    );
                  },
                  children: [
                    OnBoardingPageColumn(
                      title: StringManager.onBoardingTitle1,
                      subtitle: StringManager.onBoardingSubTitle1,
                      onTap: () => _nextPage(1),
                      buttonTitle: StringManager.next,
                      photoGridType: const PhotoGrid1(
                        imagePath1: ImageManager.onBoardingColumn1_1,
                        imagePath2: ImageManager.onBoardingColumn1_2,
                        imagePath3: ImageManager.onBoardingColumn1_3,
                      ),
                    ),
                    OnBoardingPageColumn(
                      title: StringManager.onBoardingTitle2,
                      subtitle: StringManager.onBoardingSubTitle2,
                      onTap: () => _nextPage(2),
                      buttonTitle: StringManager.next,
                      photoGridType: const PhotoGrid2(
                        imagePath1: ImageManager.onBoardingColumn2_1,
                        imagePath2: ImageManager.onBoardingColumn2_2,
                      ),
                    ),
                    OnBoardingPageColumn(
                      title: StringManager.onBoardingTitle3,
                      subtitle: StringManager.onBoardingSubTitle3,
                      onTap: () => GBM.pushAndReplaceNamed(
                          context: context, routeName: Routes.homeRoute),
                      buttonTitle: StringManager.getStarted,
                      photoGridType: const PhotoGrid3(
                        imagePath1: ImageManager.onBoardingColumn3_1,
                        imagePath2: ImageManager.onBoardingColumn3_2,
                        imagePath3: ImageManager.onBoardingColumn3_3,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: SizeManager.s30.h,
                  left: SizeManager.s150.w,
                  right: SizeManager.s150.w,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotColor: ColorManager.accentDarkGrey,
                      activeDotColor: ColorManager.accentDarkYellow,
                      dotHeight: SizeManager.s10.h,
                      dotWidth: SizeManager.s10.w,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _nextPage(int index) {
    return pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 650),
      curve: Curves.decelerate,
    );
  }
}
