import 'package:coinless/bloc/auth/bloc/auth_bloc.dart';
import 'package:coinless/model/login-model.dart';
import 'package:coinless/shared/theme.dart';
import 'package:coinless/widget/form-widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordcontroller = TextEditingController(text: '');

  bool _isRemember = false;

  bool validate() {
    if (emailController.text.isEmpty) {
      Flushbar(
        message: 'Username wajib diisi',
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
    if (passwordcontroller.text.isEmpty) {
      Flushbar(
        message: 'Password wajib diisi',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
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
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
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
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  FormWidget(
                    title: 'Username',
                    controller: emailController,
                  ),
                  FormWidget(
                    title: 'Password',
                    obsecure: true,
                    controller: passwordcontroller,
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
                  GestureDetector(
                    onTap: () {
                      print(state.toString());
                      if (validate()) {
                        context.read<AuthBloc>().add(
                              AuthLogin(
                                LoginModel(
                                  email: emailController.text,
                                  password: passwordcontroller.text,
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
                                'Log In',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 14,
                                ),
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
          );
        },
      ),
    );
  }
}
