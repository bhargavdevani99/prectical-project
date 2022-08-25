import 'package:demo_structure/config/app_colors.dart';
import 'package:demo_structure/config/image_path.dart';
import 'package:demo_structure/config/text_style.dart';
import 'package:demo_structure/view/auth/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameProfileController = TextEditingController();
  TextEditingController emailProfileController = TextEditingController();
  TextEditingController mobileProfileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 2.5,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
        title: Text(
          "Edit Profile",
          style: AppTextStyle.semiBold.copyWith(
            fontSize: 18,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.blackColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.12),
                                blurRadius: 8,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: AppColors.greyColor,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 24, bottom: 16),
                child: Text(
                  "Name",
                  style: AppTextStyle.medium.copyWith(
                    fontSize: 16,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                ),
                child: commonTextFormField(
                  controller: nameProfileController,
                  hintText: "Name",
                  border: InputBorder.none,
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  "Email",
                  style: AppTextStyle.medium.copyWith(
                    fontSize: 16,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                ),
                child: commonTextFormField(
                  controller: emailProfileController,
                  hintText: "Email",
                  border: InputBorder.none,
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  "Mobile Number",
                  style: AppTextStyle.medium.copyWith(
                    fontSize: 16,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                ),
                child: commonTextFormField(
                  controller: mobileProfileController,
                  hintText: "Mobile Number",
                  counterText: "",
                  border: InputBorder.none,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  prefixIcon: const Icon(
                    Icons.call_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: Get.width / 2,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 48, bottom: 24),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: kElevationToShadow[3],
                  ),
                  child: Text(
                    "SAVE",
                    style: AppTextStyle.regular.copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Cancel",
                  style: AppTextStyle.regular.copyWith(
                    color: AppColors.greyColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
