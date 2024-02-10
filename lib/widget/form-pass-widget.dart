import 'package:coinless/shared/theme.dart';
import 'package:flutter/material.dart';

class FormPassWidget extends StatefulWidget {
  final TextEditingController controller;
  const FormPassWidget({
    super.key,
    required this.controller,
  });

  @override
  State<FormPassWidget> createState() => _FormPassWidgetState();
}

class _FormPassWidgetState extends State<FormPassWidget> {
  bool _isvisibility = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: light,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: _isvisibility,
          decoration: InputDecoration(
            focusColor: whitecolor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: bluecolor,
                width: 3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isvisibility = !_isvisibility;
                });
              },
              icon: Icon(
                _isvisibility ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
