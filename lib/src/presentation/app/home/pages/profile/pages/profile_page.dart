import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_home/src/bloc/profile_bloc/profile_bloc.dart';
import 'package:i_home/src/domain/repo/profile_repository.dart';
import 'package:i_home/src/presentation/app/home/pages/profile/widgets/button_column.dart';
import 'package:i_home/src/presentation/app/home/pages/profile/widgets/welcome_widget.dart';
import 'package:i_home/src/presentation/utils/constnants/constants.dart';
import 'package:i_home/src/presentation/utils/global/global_methods.dart';
import 'package:i_home/src/presentation/utils/managers/asset_manager.dart';
import 'package:i_home/src/presentation/utils/managers/color_manager.dart';
import 'package:i_home/src/presentation/utils/managers/font_manager.dart';
import 'package:i_home/src/presentation/utils/managers/size_manager.dart';
import 'package:i_home/src/presentation/utils/managers/string_manager.dart';
import 'package:i_home/src/presentation/widgets/app_textstyle_widget.dart';
import 'package:i_home/src/presentation/widgets/spacers.dart';
import 'package:i_home/src/presentation/widgets/text_widget.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = '';
  String imageUrl = '';
  late Future<void> userDataFuture;

  @override
  void initState() {
    super.initState();
    userDataFuture = loadUserData();
  }

  Future<void> loadUserData() async {
    final repository = ProfileRepository(context: context);
    String newUserName = await repository.handleSetUserName();
    String newImageUrl = await repository.handleSetImageUrl();
    setState(() {
      userName = newUserName;
      imageUrl = newImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorManager.primaryDarkGrey,
            title: TextWidget(
              text: StringManager.profile,
              style: appTextStyleWidget(
                size: FontSize.s20,
                color: ColorManager.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  //TODO
                },
                icon: const Icon(
                  Icons.more_vert_rounded,
                  size: SizeManager.s25,
                ),
              )
            ],
          ),
          backgroundColor: ColorManager.primaryDarkGrey,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingManager.p12.w,
                vertical: PaddingManager.p24.h,
              ),
              child: FutureBuilder<void>(
                  future: userDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return GBM.spinkit;
                    }
                    return Column(
                      children: [
                        WelcomeWidget(
                          userName: userName,
                          imageUrl: imageUrl == emptyString
                              ? Image.asset(
                                  ImageManager.defaultUserIMG,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: SizeManager.s200.h,
                                  decoration: BoxDecoration(
                                    color: ColorManager.primaryDarkGrey,
                                  ),
                                  child: Column(
                                    children: [
                                      BottomSheetButton(
                                        onTap: () async {
                                          GBM.pop(context: context);
                                          context
                                              .read<ProfileBloc>()
                                              .add(PickImageEvent(imageUrl));
                                          await ProfileRepository(
                                                  context: context)
                                              .handleImagePicking(
                                                  ImageSource.camera);
                                          await loadUserData();
                                        },
                                        title: StringManager.takePhoto,
                                      ),
                                      BottomSheetButton(
                                        onTap: () async {
                                          GBM.pop(context: context);
                                          context
                                              .read<ProfileBloc>()
                                              .add(PickImageEvent(imageUrl));
                                          await ProfileRepository(
                                                  context: context)
                                              .handleImagePicking(
                                                  ImageSource.gallery);
                                          await loadUserData();
                                        },
                                        title: StringManager.choosePhoto,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const HeightSpacer(iH: SizeManager.s20),
                        const ProfileButtonColumn(),
                      ],
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: PaddingManager.p12.h,
        horizontal: PaddingManager.p24.w,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: SizeManager.s50.h,
          width: SizeManager.deviceWidth,
          decoration: BoxDecoration(
            color: ColorManager.primaryDarkGrey,
            border: Border.all(
              color: ColorManager.accentDarkYellow,
              width: SizeManager.s1.h,
            ),
            borderRadius: BorderRadius.circular(SizeManager.s20),
          ),
          child: Center(
            child: TextWidget(
              align: TextAlign.center,
              text: title,
              style: appTextStyleWidget(
                size: FontSize.s20,
                color: ColorManager.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
