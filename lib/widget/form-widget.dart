import 'package:coinless/theme.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String title;
  const FormWidget({
    super.key,
    required this.title,
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
