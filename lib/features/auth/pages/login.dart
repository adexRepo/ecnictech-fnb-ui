// import 'package:ecnictech_fnb_ui/common/service/validation.dart';
// import 'package:ecnictech_fnb_ui/common/widgets/custom_text_button.dart';
// import 'package:ecnictech_fnb_ui/common/widgets/custom_text_form.dart';
// import 'package:ecnictech_fnb_ui/common/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ecnictech_fnb_ui/common/service/validation.dart';
import 'package:ecnictech_fnb_ui/common/widgets/custom_text_button.dart';
import 'package:ecnictech_fnb_ui/common/widgets/custom_text_form.dart';
import 'package:ecnictech_fnb_ui/common/widgets/custom_text_style.dart';
import 'package:ecnictech_fnb_ui/constant/colors.dart';
import 'package:ecnictech_fnb_ui/features/auth/bloc/authentication_bloc.dart';
// import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          margin: EdgeInsets.all(20.h),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginForm(),
              // Gap(20.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "New To Ecnic?",
              //       style: TextStyle(
              //         fontSize: 16.sp,
              //       ),
              //     ),
              //     Gap(5.h),
              //     Text(
              //       "Join Now",
              //       style: TextStyle(
              //           fontSize: 16.sp,
              //           color: ColorsManager.mainOrange,
              //           fontStyle: FontStyle.italic),
              //     ),
              //   ],
              // )
            ],
          )),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final passwordFocuseNode = FocusNode();
  final passwordConfirmationFocuseNode = FocusNode();
  bool isObscureText = true;

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    passwordFocuseNode.dispose();
    passwordConfirmationFocuseNode.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 25.h,
          horizontal: 20.h,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.gray93Color,
              offset: Offset(
                2.0,
                2.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainOrange,
              ),
            ),
            Gap(5.h),
            Text(
              "Stay update on your professional work",
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            Gap(10.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CustomTextFormField(
                      hint: "username",
                      validator: (value) {
                        String username = (value ?? '').trim();
                        usernameController.text = username;

                        if (username.isEmpty) {
                          return 'Please enter an username address';
                        }
                      },
                      controller: usernameController,
                    ),
                    Gap(10.h),
                    CustomTextFormField(
                      focusNode: passwordFocuseNode,
                      controller: passwordController,
                      hint: 'Password',
                      isObscureText: isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !Validation.isPasswordValid(value)) {
                          return 'Please enter a valid password';
                        }
                      },
                    ),
                  ],
                ),
                Gap(10.h),
                Column(
                  children: [
                    CustomTextButton(
                      buttonText: "Login",
                      textStyle: CustomTextStyles.font16White600Weight,
                      onPressed: () async {
                        passwordFocuseNode.unfocus();
                        if (formKey.currentState!.validate()) {
                          context.read<AuthenticationBloc>().add(
                                LogIn(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                ),
                              );
                        }
                      },
                    ),
                    // Gap(5.h),
                    // Row(
                    //   children: [
                    //     const Expanded(
                    //       child: Divider(
                    //         color: Colors.grey,
                    //         thickness: 1.0,
                    //       ),
                    //     ),
                    //     Gap(5.w),
                    //     const Text('or'),
                    //     Gap(5.w),
                    //     const Expanded(
                    //       child: Divider(
                    //         color: Colors.grey,
                    //         thickness: 1.0,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Gap(5.h),
                    // CustomOutlineButton(
                    //   buttonText: "Sign in with Google",
                    //   outlinedColor: ColorsManager.mainOrange,
                    //   iconData: Icons.login_outlined,
                    //   textStyle: CustomTextStyles.font16MainOrange600Weight,
                    //   onPressed: () async {
                    //     passwordFocuseNode.unfocus();
                    //     if (formKey.currentState!.validate()) {}
                    //   },
                    // ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
