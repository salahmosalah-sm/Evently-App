import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes/route_manager.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  void onIntroEnd(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesManager.signIN);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(assetName, width: width);
  }


  @override
  Widget build(BuildContext context) {
    final ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    Widget buildTitle(String text) {
      return Text(text, style: Theme.of(context).textTheme.bodyMedium!);
    }

    Widget buildBody(String text, {
      String? firstBodyText,
      String? secondBodyText,
      Widget? firstBodyWidget,
      Widget? secondBodyWidget,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: Theme.of(context).textTheme.headlineMedium!),
          SizedBox(height: 16.h),
          firstBodyText == null || firstBodyWidget == null
              ? const Text("")
              : Row(
            children: [
              Text(
                firstBodyText,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!,
              ),
              const Spacer(),
              firstBodyWidget,
            ],
          ),
          SizedBox(height: 16.h),
          secondBodyText == null || secondBodyWidget == null
              ? const Text("")
              : Row(
                children: [
                  Text(
                secondBodyText,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!,
              ),
              const Spacer(),
              secondBodyWidget,
            ],
          ),

        ],
      );
    }
    PageDecoration pageDecoration = PageDecoration(
      imageFlex: 2,
      titlePadding: REdgeInsets.symmetric(horizontal: 16),
      bodyPadding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
      pageColor: Theme.of(context).scaffoldBackgroundColor,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      controlsPadding: EdgeInsets.zero,

      allowImplicitScrolling: true,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: REdgeInsets.only(top: 28, right: 16),
          child: _buildImage(ImagesManager.onBoardingLogo, 160.w),
        ),
      ),

      pages: [
        PageViewModel(
          titleWidget: buildTitle(
            AppLocalizations.of(context)!.personalize_your_experience,
          ),
          bodyWidget: buildBody(
            AppLocalizations.of(context)!.chooseThemeAndLanguage,
            firstBodyText: "Language",
            firstBodyWidget: InkWell(
              onTap: () => _onLangButtonClick(configProvider),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.blue,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: REdgeInsets.all(8),
                child: Text(
                  configProvider.isEng ? "EN" : "AR",
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onPrimary,
                  ),
                ),
              ),
            ),
            secondBodyText: "Theme",
            secondBodyWidget: IconButton(
              onPressed: () => _onThemeButtonClick(configProvider),
              icon: SvgPicture.asset(
                configProvider.isLight ? IconsManager.sun : IconsManager.moon,
              ),
            ),
          ),
          image: _buildImage(ImagesManager.onBoardingFirstPage),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: buildTitle(
            AppLocalizations.of(context)!.find_events_that_inspire_you,
          ),
          bodyWidget: buildBody(
            AppLocalizations.of(
              context,
            )!.dive_into_a_world_of_events_crafted_to_fit_your_unique_interests,
          ),
          image: _buildImage(ImagesManager.onBoardingSecPage),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: buildTitle(
            AppLocalizations.of(context)!.effortless_event_planning,
          ),
          bodyWidget: buildBody(
            AppLocalizations.of(
              context,
            )!.take_the_hassle_out_of_organizing_events_with_our_all_in_one_planning_tools,
          ),
          image: _buildImage(ImagesManager.onBoardingThirdPage),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: buildTitle(
            AppLocalizations.of(
              context,
            )!.connect_with_friends_and_share_moments,
          ),
          bodyWidget: buildBody(
            AppLocalizations.of(
              context,
            )!.make_every_event_memorable_by_sharing_the_experience_with_others,
          ),
          image: _buildImage(ImagesManager.onBoardingForthPage),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => onIntroEnd(context),
      onSkip: () => onIntroEnd(context),

      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: SvgPicture.asset(IconsManager.onBoardingArrowBack),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: SvgPicture.asset(IconsManager.onBoardingArrowForward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,

      dotsDecorator: DotsDecorator(
        size: Size(8.0.w, 10.0.h),
        color: ColorsManager.black,
        activeSize: Size(20.w, 10.0.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
        ),
      ),

      dotsContainerDecorator: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
        ),
      ),
    );
  }

  void _onThemeButtonClick(ConfigProvider configProvider) {
    if (configProvider.isLight) {
      configProvider.themeChanger(ThemeMode.dark);
    } else {
      configProvider.themeChanger(ThemeMode.light);
    }
  }

  void _onLangButtonClick(ConfigProvider configProvider) {
    if (configProvider.isEng) {
      configProvider.langChanger("ar");
    } else {
      configProvider.langChanger("en");
    }
  }
}
