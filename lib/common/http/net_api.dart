import 'dart:async';

import 'package:dio/dio.dart';

class NetApi {
  var _dio = Dio();
  var _option = Options(baseUrl: "http://gank.io");

  static var _instance = NetApi._internal();

  static get instance => _instance;

  NetApi._internal() {
    _dio.options = _option;
  }

  factory NetApi() {
    return _instance;
  }

  getAllInfo(int pageNo, {int limit = 10}) {
    return _dio.get("api/data/all/${limit}/${pageNo}");
  }

  getAndroidInfo(int pageNo, {int limit = 10}) {
    return _dio.get("api/data/Android/${limit}/${pageNo}");
  }

  getIosInfo(int pageNo, {int limit = 10}) {
    return _dio.get("api/data/IOS/${limit}/${pageNo}");
  }

  Future<Response> getGirlInfo(int pageNo, {int limit = 10}) {
    print("/api/data/福利/${limit}/${pageNo}");
    return _dio.get("/api/data/福利/${limit}/${pageNo}");
  }
}
