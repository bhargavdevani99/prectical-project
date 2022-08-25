import 'package:demo_structure/config/app_colors.dart';
import 'package:demo_structure/config/text_style.dart';
import 'package:demo_structure/utils/validation/validator.dart';
import 'package:demo_structure/view/auth/view/signup.dart';
import 'package:demo_structure/view/botom_bar/bottom_bar.dart';
import 'package:demo_structure/view/tabs/dashboard_tab/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isVisible = false;

  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset("assets/images/login_logo.png"),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "SKIP >>",
                          style: AppTextStyle.regular.copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Container(
                      alignment: Alignment.center,
                      height: 180,
                      width: 180,
                      child: Image.asset("assets/images/logo.png", fit: BoxFit.fill,),
                    ),
                    SizedBox(height: Get.width / 8),
                    commonTextFormField(
                      controller: mobileController,
                      hintText: "Mobile Number",
                      counterText: "",
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      needValidation: true,
                      prefixIcon: const Icon(
                        Icons.call_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    commonTextFormField(
                      controller: passwordController,
                      hintText: "Password",
                      keyboardType: TextInputType.text,
                      needValidation: true,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot password",
                            style: AppTextStyle.regular.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
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
                        margin: const EdgeInsets.only(top: 40, bottom: 16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: kElevationToShadow[3],
                        ),
                        child: Text(
                          "SIGN IN",
                          style: AppTextStyle.regular.copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a member yet? ",
                          style: AppTextStyle.medium.copyWith(color: AppColors.blackColor, fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const SignupScreen(),
                              transition: Transition.cupertino,
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: AppTextStyle.medium.copyWith(color: AppColors.primaryColor, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget commonTextFormField({
  TextEditingController? controller,
  TextInputType? keyboardType,
  int? maxLength,
  String? hintText,
  // TextStyle? hintStyle,
  String? counterText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  InputBorder? border,
  bool obscureText = false,
  bool needValidation = false,
  bool isEmailValidator = false,
  bool isConPasswordValidator = false,
  String? passoword,
  Function(String)? onChange,
}) {
  return TextFormField(
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: onChange,
    validator: needValidation
        ? (v) {
            return TextFieldValidation.validation(
                value: v, isEmailValidator: isEmailValidator, message: hintText, isConPasswordValidator: isConPasswordValidator, password: passoword);
          }
        : null,
    style: AppTextStyle.regular.copyWith(
      color: AppColors.blackColor,
    ),
    keyboardType: keyboardType,
    maxLength: maxLength,
    obscureText: obscureText,
    cursorColor: AppColors.primaryColor,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyle.regular.copyWith(
        color: AppColors.greyColor,
      ),
      border: border,

      counterText: counterText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    ),
  );
}
