// The best way to handle network requests in Flutter
// Applications frequently need to perform POST and GET and other HTTP requests.
// Flutter provides an http package that supports making HTTP requests.

// HTTP methods: GET, POST, PATCH, PUT, DELETE

import 'dart:convert';
import 'dart:developer';
import 'package:demo_structure/config/api_string.dart';
import 'package:demo_structure/config/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  static String baseURL = APIString.baseURL;

  static Future<Map<String, String>> _getHeaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(
      LocalStorage.token,
    );
    if (token != null) {
      debugPrint("Token -- '$token'");
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      debugPrint("Token  null-- '$token'");
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static Future<Map<String, dynamic>> getHttpMethod({
    @required String? url,
    bool isMockUrl = false,
  }) async {
    var header = await _getHeaders();

    log("Get URL -- '$baseURL$url'");
    debugPrint("Get Data -- 'null'");
    http.Response response = await http.get(
      Uri.parse(
        isMockUrl ? "$url" : "$baseURL$url",
      ),
      headers: header,
    );
    debugPrint("Get Response Code -- '${response.statusCode}'");
    debugPrint("Get Response -- '${response.body}'");
    if (response.statusCode == 200) {
      debugPrint("In Get '200'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      debugPrint("In Get '400'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      debugPrint("In Get '401'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "401",
      };
      return data;
    } else if (response.statusCode == 403) {
      debugPrint("In Get '403'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      debugPrint("In Get '404'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      debugPrint("In Get '500'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "500",
      };
      return data;
    } else {
      debugPrint("In Get 'else'");
      return {
        'body': null,
        'headers': null,
        'error': "Something Went Wrong",
      };
    }
  }

  static Future<Map<String, dynamic>> postHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    debugPrint("Post URL -- '$baseURL$url'");
    debugPrint("Post Data -- '$data'");
    http.Response response = await http.post(
      Uri.parse(
        "$baseURL$url",
      ),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    debugPrint("Post Response Code -- '${response.statusCode}'");
    debugPrint("Post Response -- '${response.body}'");
    if (response.statusCode == 200) {
      debugPrint("In Post '200'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      debugPrint("In Post '400'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      debugPrint("In Post '401'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "401",
      };
      return data;
    } else if (response.statusCode == 403) {
      debugPrint("In Post '403'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      debugPrint("In Post '404'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      debugPrint("In Post '500'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "500",
      };
      return data;
    } else {
      debugPrint("In Post 'else'");
      return {
        'body': null,
        'headers': null,
        'error': "Something Went Wrong",
      };
    }
  }

  static Future<Map<String, dynamic>> patchHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    debugPrint("Patch URL -- '$baseURL$url'");
    debugPrint("Patch Data -- '$data'");
    http.Response response = await http.patch(
      Uri.parse(
        "$baseURL$url",
      ),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    debugPrint("Patch Response Code -- '${response.statusCode}'");
    debugPrint("Patch Response -- '${response.body}'");
    if (response.statusCode == 200) {
      debugPrint("In Patch '200'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      debugPrint("In Patch '400'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      debugPrint("In Patch '401'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "401",
      };
      return data;
    } else if (response.statusCode == 403) {
      debugPrint("In Patch '403'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      debugPrint("In Patch '404'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      debugPrint("In Patch '500'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "500",
      };
      return data;
    } else {
      debugPrint("In Patch 'else'");
      return {
        'body': null,
        'headers': null,
        'error': "Something Went Wrong",
      };
    }
  }

  static Future<Map<String, dynamic>> putHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    debugPrint("Put URL -- '$baseURL$url'");
    debugPrint("Put Data -- '$data'");
    http.Response response = await http.put(
      Uri.parse(
        "$baseURL$url",
      ),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );

    debugPrint("PUT Response code -- '${response.statusCode}'");
    debugPrint("PUT Response -- '${response.body}'");

    if (response.statusCode == 200) {
      debugPrint("In Put '200'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      debugPrint("In Put '400'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      debugPrint("In Put '401'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "401",
      };
      return data;
    } else if (response.statusCode == 403) {
      debugPrint("In Put '403'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      debugPrint("In Put '404'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      debugPrint("In Put '500'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "500",
      };
      return data;
    } else {
      debugPrint("In Put 'else'");
      return {
        'body': null,
        'headers': null,
        'error': "Something Went Wrong",
      };
    }
  }

  static Future<Map<String, dynamic>> deleteHttpMethod({
    @required String? url,
  }) async {
    var header = await _getHeaders();
    debugPrint("Delete URL -- '$baseURL$url'");
    debugPrint("Delete Data -- 'null'");
    http.Response response = await http.delete(
      Uri.parse(
        "$baseURL$url",
      ),
      headers: header,
    );
    debugPrint("Delete Response Code -- '${response.statusCode}'");
    debugPrint("Delete Response -- '${response.body}'");
    if (response.statusCode == 200) {
      debugPrint("In Delete '200'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else if (response.statusCode == 400) {
      debugPrint("In Delete '400'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "400",
      };
      return data;
    } else if (response.statusCode == 401) {
      debugPrint("In Delete '401'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "401",
      };
      return data;
    } else if (response.statusCode == 403) {
      debugPrint("In Delete '403'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "403",
      };
      return data;
    } else if (response.statusCode == 404) {
      debugPrint("In Delete '404'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "404",
      };
      return data;
    } else if (response.statusCode == 500) {
      debugPrint("In Delete '500'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': "500",
      };
      return data;
    } else {
      debugPrint("In Delete 'else'");
      return {
        'body': null,
        'headers': null,
        'error': "Something Went Wrong",
      };
    }
  }
}
