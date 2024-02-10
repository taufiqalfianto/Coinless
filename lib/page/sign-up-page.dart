import 'package:another_flushbar/flushbar.dart';
import 'package:coinless/bloc/auth/bloc/auth_bloc.dart';
import 'package:coinless/model/sign-up.dart';
import 'package:coinless/shared/theme.dart';
import 'package:coinless/widget/custom-button.dart';
import 'package:coinless/widget/form-widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController namecontroller = TextEditingController(text: '');
  final TextEditingController emailcontroller = TextEditingController(text: '');
  final TextEditingController passwordcontroller =
      TextEditingController(text: '');
  final TextEditingController confirmpasswordcontroller =
      TextEditingController(text: '');
  SignUpPage({super.key});

  bool validate(BuildContext context) {
    if (namecontroller.text.isEmpty ||
        emailcontroller.text.isEmpty ||
        passwordcontroller.text.isEmpty ||
        confirmpasswordcontroller.text.isEmpty) {
      Flushbar(
        message: 'Semua kolom wajib diisi',
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: redcolor,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(16),
        duration: Duration(
          seconds: 2,
        ),
      ).show(context);
      return false;
    }

    return true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
          if (state is AuthFailed) {
            Flushbar(
              message: state.toString(),
              flushbarPosition: FlushbarPosition.TOP,
              backgroundColor: redcolor,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              borderRadius: BorderRadius.circular(16),
              duration: Duration(
                seconds: 2,
              ),
            ).show(context);
          }
        },
        builder: (context, state) {
          return ListView(
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
                  FormWidget(
                    controller: namecontroller,
                    title: 'Username',
                  ),
                  FormWidget(
                    controller: emailcontroller,
                    title: 'Email',
                  ),
                  FormWidget(
                    controller: passwordcontroller,
                    title: 'Password',
                  ),
                  FormWidget(
                    controller: confirmpasswordcontroller,
                    title: 'Confirm Password',
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(state.toString());
                      if (validate(context)) {
                        context.read<AuthBloc>()
                          ..add(
                            Authregister(
                              SignUpModel(
                                name: namecontroller.text,
                                email: emailcontroller.text,
                                password: passwordcontroller.text,
                                confirmpassword: confirmpasswordcontroller.text,
                              ),
                            ),
                          );
                      }
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: bluecolor,
                      ),
                      child: Center(
                        child: state is AuthLoading
                            ? SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  color: whitecolor,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Sign Up',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 14,
                                ),
                              ),
                      ),
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
          );
        },
      ),
    );
  }
}
