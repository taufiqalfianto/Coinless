import 'package:coinless/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bluecolor,
      ),
      child: Center(
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
