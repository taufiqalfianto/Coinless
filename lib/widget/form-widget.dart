import 'package:coinless/shared/theme.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String title;
  final bool obsecure;
  final TextEditingController controller;
  const FormWidget({
    super.key,
    this.obsecure = false,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: light,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: obsecure,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                // color: kBlueColor,
                width: 3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
