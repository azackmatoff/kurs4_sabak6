import 'package:flutter/material.dart';
import 'package:kurs4_sabak6/app_constants/colors/app_colors.dart';
import 'package:kurs4_sabak6/app_constants/text_styles/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    @required this.buttonText,
    @required this.onPressed,
    this.bgColor,
    Key key,
  }) : super(key: key);

  final Color bgColor;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: bgColor ?? AppColors.secondaryColor, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
          ),
          child: Text(
            buttonText,
            style: AppTextStyles.buttonStyle,
          ),
        ),
      ),
    );
  }
}
