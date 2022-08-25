import 'dart:convert';
import 'dart:developer';

import 'package:demo_structure/config/api_string.dart';
import 'package:demo_structure/utils/http_handler/network_http.dart';
import 'package:demo_structure/widget/reusable_widgets/loading_dialog.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList productList = List.empty().obs;
  RxMap productObj = {}.obs;

  RxList topCategoryData = [].obs;

  RxList hotProduct = [
    {
      "image":
          "https://imgs.search.brave.com/BfxVeSWbc_sLExBiYN-KSpYewAHrxJberkEHwKluAXw/rs:fit:608:225:1/g:ce/aHR0cHM6Ly90c2Uz/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5q/VWpBZnFmMUxxQnhW/NW5DS1FLNHRBSGFG/eCZwaWQ9QXBp",
      "name": "Fresh Vegetables",
      "count": 0,
    },
    {
      "image":
          "https://imgs.search.brave.com/TlaN6FFNmaePsiIT0z4vuwcREeEJOZERrBMSOgjENus/rs:fit:403:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5w/alRLakZ0Q2dZbjRu/YWNoa2tFTGpnSGFJ/dCZwaWQ9QXBp",
      "name": "Fresh Fruits",
      "count": 0,
    },
    {
      "image":
          "https://imgs.search.brave.com/wK6jOHJ1b3nSLHHoPM_6okPXAo7OxlMVmaE03eb34i0/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC55/M19TRzlFc0IxSDND/WGxid0xpYzRRSGFI/YSZwaWQ9QXBp",
      "name": "Khakharas",
      "count": 0,
    },
    {
      "image":
          "https://imgs.search.brave.com/StmxafQi3lEnMBRazzyKOWM8WJBZsAoC_MhRrmpwCBE/rs:fit:756:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC4t/N09ldDZlRkNiTENG/WjFvVTVUT3V3SGFF/cCZwaWQ9QXBp",
      "name": "Munchhing",
      "count": 0,
    }
  ].obs;

  Future getAllProduct() async {
    showLoadingDialog();
    productList.value = List.empty();
    try {
      var response = await HttpHandler.getHttpMethod(
        url: APIString.banner,
      );
      if (response["error"] == null) {
        var getData = jsonDecode(
          response["body"],
        );
        productList.value = getData['data'];
        log("productList == $productList");
        getTopCategory();
        hideLoadingDialog();
      } else {
        hideLoadingDialog();
      }
    } catch (e) {
      log('Error --- $e');
      hideLoadingDialog();
    }
  }

  Future getTopCategory() async {
    // showLoadingDialog();
    topCategoryData.value = List.empty();
    try {
      var response = await HttpHandler.getHttpMethod(
        url: APIString.category,
      );
      if (response["error"] == null) {
        var getData = jsonDecode(
          response["body"],
        );
        topCategoryData.value = getData['data'];
        log("productList == $topCategoryData");
        // hideLoadingDialog();
      } else {
        // hideLoadingDialog();
      }
    } catch (e) {
      log('Error --- $e');
      // hideLoadingDialog();
    }
  }

/*  Future getProductById({String? id}) async {
    showLoadingDialog();
    productObj.value = {};
    try {
      var response = await HttpHandler.getHttpMethod(
        url: APIString.product + id!,
      );
      if (response["error"] == null) {
        var getData = jsonDecode(
          response["body"],
        );
        productObj.value = getData;

        log("productList == $productObj");
        hideLoadingDialog();
      } else {
        hideLoadingDialog();
      }
    } catch (e) {
      log('Error --- $e');
      hideLoadingDialog();
    }
  }*/
}
