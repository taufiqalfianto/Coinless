// ignore: file_names
import 'package:coinless/theme.dart';
import 'package:coinless/widget/form-pass-widget.dart';
import 'package:coinless/widget/form-widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isRemember = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 75,
          horizontal: 55,
        ),
        children: [
          Column(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 50,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Log In',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Masukkan email dan password yang sesuai.',
                // textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              FormWidget(title: 'Username'),
              FormPassWidget(
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: _isRemember,
                      onChanged: (value) {
                        setState(() {
                          _isRemember = !_isRemember;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Remember me',
                    style: blackTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bluecolor,
                ),
                child: Center(
                  child: Text(
                    'Log In',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: blackcolor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google.png',
                      width: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Log in with Google',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  text: 'Belum punya akun?',
                  style: blackTextStyle.copyWith(fontSize: 14),
                  children: [
                    TextSpan(
                      text: ' Sign up',
                      style: darkblueTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/sign-up');
                        },
                    ),
                  ],
                ),
              ),
              Text(
                'Lupa password?',
                style: blueTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
