import 'package:consumindo_api/src/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CardGenre extends StatelessWidget {
  final Function()? onTap;
  final bool clickedButton;
  final String name;
  const CardGenre(
      {Key? key, this.onTap, required this.clickedButton, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: clickedButton ? AppColors.buttonClicked : AppColors.button,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
