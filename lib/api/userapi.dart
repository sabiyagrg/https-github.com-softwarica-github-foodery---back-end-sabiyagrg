//import 'package:batch28_api_starter/api/HttpServices.dart';
//import 'package:batch28_api_starter/response/loginresponse.dart';
//import 'package:batch28_api_starter/utils/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';

class UserAPI {
  Future<bool> registerUrl(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + registerURL;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(url, data: user.toJson());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login (String username, String password) async {
    bool isLogin = false;
    try{
      var url =baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      var response = await dio.post(
        url,
        data: {
          "username": username,
          "password":password,
        },
      );
      if (response.statusCode == 200) {
        Loginresponse loginresponse = Loginresponse.fromJson(response.data);
        token = loginresponse.token;
        isLogin = true;
      }
    }catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
}
