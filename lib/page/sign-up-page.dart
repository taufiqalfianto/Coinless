import 'package:coinless/shared/theme.dart';
import 'package:coinless/widget/custom-button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                'Sign Up',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Daftar secara gratis dan jadilah\npengguna Coinless',
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 35,
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
                height: 28,
              ),
              Text('Atau'),
              SizedBox(
                height: 28,
              ),
              // FormWidget(
              //   title: 'Username',
              // ),
              // FormWidget(
              //   controller: ,
              //   title: 'Email',
              // ),
              SizedBox(
                height: 28,
              ),
              SizedBox(
                height: 28,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: CustomButton(
                  title: 'Sign Up',
                ),
              ),
              SizedBox(
                height: 28,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Sudah punya akun?',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                  TextSpan(
                    text: ' Log In',
                    style: darkblueTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/');
                      },
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
