import 'package:flutter/material.dart';
import 'package:remote_kitchen_test/Utils/design_utils.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  const DefaultCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultAllPadding),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      width: 60,
      height: 60,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
