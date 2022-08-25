import 'package:demo_structure/config/app_colors.dart';
import 'package:demo_structure/config/text_style.dart';
import 'package:demo_structure/view/auth/view/login.dart';
import 'package:demo_structure/view/botom_bar/bottom_bar.dart';
import 'package:demo_structure/view/tabs/dashboard_tab/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isVisible = false;
  bool? isVisible2 = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/images/logo.png", fit: BoxFit.fill,),
                  ),
                  SizedBox(height: Get.width / 11),
                  commonTextFormField(
                    controller: nameController,
                    hintText: "Name",
                    needValidation: true,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  commonTextFormField(
                    controller: emailController,
                    hintText: "Email",
                    keyboardType: TextInputType.text,
                    needValidation: true,
                    isEmailValidator: true,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  commonTextFormField(
                    controller: mobileController,
                    hintText: "Mobile Number",
                    needValidation: true,
                    counterText: "",
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    prefixIcon: const Icon(
                      Icons.call_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  commonTextFormField(
                    controller: referralController,
                    hintText: "Referral code (Optional)",
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.home_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  commonTextFormField(
                    controller: passwordController,
                    needValidation: true,
                    hintText: "Password",
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.primaryColor,
                    ),
                    obscureText: isVisible == true ? true : false,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible!;
                        });
                      },
                      child: isVisible == true
                          ? const Icon(
                              Icons.visibility_outlined,
                              color: AppColors.blackColor,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: AppColors.blackColor,
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  commonTextFormField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    needValidation: true,
                    keyboardType: TextInputType.text,
                    onChange: (v){
                      setState(() {

                      });
                    },
                    isConPasswordValidator: true,
                    passoword: passwordController.text,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.primaryColor,
                    ),
                    obscureText: isVisible2 == true ? true : false,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible2 = !isVisible2!;
                        });
                      },
                      child: isVisible2 == true
                          ? const Icon(
                              Icons.visibility_outlined,
                              color: AppColors.blackColor,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: AppColors.blackColor,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(
                          () => const BottomBar(),
                          transition: Transition.cupertino,
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 48, bottom: 16),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: kElevationToShadow[3],
                      ),
                      child: Text(
                        "SIGN UP",
                        style: AppTextStyle.regular.copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: AppTextStyle.medium.copyWith(color: AppColors.blackColor, fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const LoginScreen(),
                            transition: Transition.cupertino,
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: AppTextStyle.medium.copyWith(color: AppColors.primaryColor, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
