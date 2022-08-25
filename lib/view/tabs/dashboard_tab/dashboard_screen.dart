import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_structure/config/app_colors.dart';
import 'package:demo_structure/config/text_style.dart';
import 'package:demo_structure/view/tabs/dashboard_tab/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  HomeController homeController = Get.put(HomeController());
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

    // get all product
    homeController.getAllProduct();
    // homeController.;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.primaryColor),
          ),
          IconButton(
              onPressed: () {},
              icon: Badge(
                badgeContent: const Text(
                  '6',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                badgeColor: AppColors.blackColor,
                child: const Icon(Icons.shopping_cart_outlined, color: AppColors.primaryColor),
              )),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const Drawer(),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 10),
              child: Text(
                'HOME',
                style: AppTextStyle.semiBold.copyWith(color: AppColors.primaryColor, fontSize: 25),
              ),
            ),
            Obx(
              () => homeController.productList.isEmpty
                  ? SizedBox()
                  : Container(
                      margin: const EdgeInsets.only(
                        top: 4,
                      ),
                      child: CarouselSlider.builder(
                        itemCount: homeController.productList.length,
                        carouselController: _controller,
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.15,
                          disableCenter: true,
                          viewportFraction: 1,
                          enlargeCenterPage: false,
                          onPageChanged: (
                            index,
                            reason,
                          ) {},
                        ),
                        itemBuilder: (
                          context,
                          index,
                          realIdx,
                        ) {
                          return Image.network(
                            '${homeController.productList[index]['var_image']}',
                            fit: BoxFit.cover,
                            errorBuilder: (_, s, _b) => SizedBox(),
                          );
                        },
                      ),
                    ),
            ),
            commonTitleText(title: 'TOP CATEGORIES'),
            Obx(
              () => homeController.topCategoryData.isEmpty
                  ? const SizedBox()
                  : GridView.builder(
                      itemCount: homeController.topCategoryData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 190,
                        // crossAxisSpacing: 15,
                        // mainAxisSpacing: 15
                      ),
                      itemBuilder: (_, i) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(border: Border.all(color: AppColors.greyColor.withOpacity(0.5))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "${homeController.topCategoryData[i]['var_icon']}",
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Text(
                                "${homeController.topCategoryData[i]['var_title']}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.semiBold.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            commonTitleText(title: 'HOT PRODUCTS', bPadding: 0),
            Obx(
              () => homeController.hotProduct.isEmpty
                  ? const SizedBox()
                  : Container(
                      height: 250,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListView.builder(
                          itemCount: homeController.hotProduct.length,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 16),
                          itemBuilder: (_, i) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  border: Border.all(color: AppColors.greyColor.withOpacity(0.5)),
                                  boxShadow: kElevationToShadow[1]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: Get.width / 2.5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "${homeController.hotProduct[i]['image']}",
                                              ),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  Text(
                                    "${homeController.hotProduct[i]['name']}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.medium.copyWith(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    // "${homeController.topCategoryData[i]['name']}",
                                    "₹ 90.00",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.semiBold.copyWith(fontSize: 19),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.only(left: 5),
                                    decoration: BoxDecoration(
                                      color: AppColors.greyColor.withOpacity(0.3),
                                      border: Border.all(color: AppColors.blackColor, width: 0.3),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "1 Pc (250 to 400 G...\n)",
                                          style: AppTextStyle.regular.copyWith(fontSize: 13),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: AppColors.greyColor,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (homeController.hotProduct[i]['count'] > 0) {
                                            homeController.hotProduct[i]['count']--;
                                            setState(() {});
                                          }
                                        },
                                        icon: const Icon(Icons.remove_circle_outline),
                                        color: AppColors.greyColor,
                                      ),
                                      Text('${homeController.hotProduct[i]['count']}', style: AppTextStyle.semiBold.copyWith(fontSize: 19)),
                                      IconButton(
                                        onPressed: () {
                                          homeController.hotProduct[i]['count']++;
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.add_circle_outline_outlined),
                                        color: AppColors.greyColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
            )
          ],
        ),
      ),
    );
  }

  commonTitleText({String? title, double? bPadding}) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: bPadding ?? 15, left: 16, right: 10),
      child: Row(
        children: [
          Text(
            '$title',
            style: AppTextStyle.regular.copyWith(color: AppColors.primaryColor, fontSize: 18),
          ),
          const Spacer(),
          Text(
            'VIEW ALL',
            style: AppTextStyle.regular.copyWith(color: AppColors.primaryColor, fontSize: 14),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primaryColor,
            size: 18,
          )
        ],
      ),
    );
  }
}
