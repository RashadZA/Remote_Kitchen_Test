part of 'design_utils.dart';

class AppTheme {
  AppTheme._();

  static const double defaultIconSize = 24;

  static const double defaultElevation = 2;

  static final lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    splashColor: AppColors.transparent,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    hintColor: AppColors.primaryColor.withOpacity(.4),
    iconTheme:
        const IconThemeData(size: defaultIconSize, color: AppColors.white),
    appBarTheme: AppBarTheme(
      iconTheme:
          const IconThemeData(size: defaultIconSize, color: AppColors.white),
      actionsIconTheme:
          const IconThemeData(size: defaultIconSize, color: AppColors.white),
      elevation: defaultElevation,
      toolbarHeight: appBarHeight,
      titleTextStyle: AppTextTheme.text18
          .copyWith(color: AppColors.white, fontWeight: FontWeight.w600),
      backgroundColor: AppColors.primaryColor,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.primaryColor),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      primaryColor: AppColors.primaryColor,
      barBackgroundColor: AppColors.primaryShadowColor,
      scaffoldBackgroundColor: AppColors.primaryShadowColor,
      textTheme: CupertinoTextThemeData(
        textStyle: AppTextTheme.text14
            .copyWith(color: AppColors.white, fontWeight: FontWeight.w600),
        primaryColor: AppColors.primaryColor,
      ),
    ),
  );
}
