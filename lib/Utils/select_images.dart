part of 'design_utils.dart';

bool get isDarkMode => false;

Image noImage({
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
}) =>
    selectImage(
      setldImageIcon(AppImage.logo),
      height: height,
      width: width,
      fit: fit,
    );

/// To select which Image/Icon being used in current mode
String setldImageIcon(
  String lightImageIcon, [
  String? darkImageIcon,
]) =>
    darkImageIcon != null && isDarkMode ? darkImageIcon : lightImageIcon;

Image selectImage(
  String image, {
  double? width,
  double? height,
  BoxFit fit = BoxFit.cover,
}) {
  return Image.asset(
    image,
    fit: fit,
    width: width,
    height: height,
  );
}

Widget networkImage({
  String? image,
  double? height,
  double? width,
  double borderRadius = 0,
  BoxFit fit = BoxFit.cover,
}) {
  return isNullEmptyOrFalse(image)
      ? noImage(
          fit: fit,
          width: width,
          height: height,
        )
      : ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: CachedNetworkImage(
            fit: fit,
            width: width,
            height: height,
            imageUrl: GetUtils.isURL(image ?? "") ? image! : "",
            placeholder: (context, url) => const Center(),
            errorWidget: (context, url, error) => const Icon(
              CupertinoIcons.exclamationmark_circle,
              color: CupertinoColors.destructiveRed,
            ),
          ),
        );
}

Widget selectIcon(
  String icon, {
  double? width,
  Color? color,
  void Function()? onPressed,
}) {
  return CoreButton(
    onPressed: onPressed,
    child: Image.asset(
      icon,
      width: width,
      color: color,
      height: width,
    ),
  );
}
