import 'package:flutter/material.dart';
import 'package:i_home/src/presentation/pages/on_boarding_page/widgets/on_boarding_page_column.dart';
import 'package:i_home/src/presentation/pages/on_boarding_page/widgets/photo_type_grids.dart';
import 'package:i_home/src/presentation/utils/asset_manager.dart';
import 'package:i_home/src/presentation/utils/color_manager.dart';
import 'package:i_home/src/presentation/utils/size_manager.dart';
import 'package:i_home/src/presentation/utils/string_manager.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryDarkGrey,
      body: SizedBox(
        width: SizeManager.deviceWidth,
        child: Stack(
          children: [
            PageView(
              children: [
                OnBoardingPageColumn(
                  title: StringManager.onBoardingTitle1,
                  subtitle: StringManager.onBoardingSubTitle1,
                  onTap: () {
                    //TODO
                  },
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
                  onTap: () {
                    //TODO
                  },
                  buttonTitle: StringManager.next,
                  photoGridType: const PhotoGrid2(
                    imagePath1: ImageManager.onBoardingColumn2_1,
                    imagePath2: ImageManager.onBoardingColumn2_2,
                  ),
                ),
                OnBoardingPageColumn(
                  title: StringManager.onBoardingTitle3,
                  subtitle: StringManager.onBoardingSubTitle3,
                  onTap: () {
                    //TODO
                  },
                  buttonTitle: StringManager.getStarted,
                  photoGridType: const PhotoGrid1(
                    imagePath1: ImageManager.onBoardingColumn3_1,
                    imagePath2: ImageManager.onBoardingColumn3_2,
                    imagePath3: ImageManager.onBoardingColumn3_3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
