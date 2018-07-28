import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_gank/common/http/net_api.dart';

abstract class GirlListViewContract {
  showSuccessView(dynamic data);

  showErrorView();

  showLoadingView();
}

class GirlListModel {
  var netApi = NetApi.instance as NetApi;

  Future<Response> getGirlInfo(int pageNo, {int limit = 10}) {
    return netApi.getGirlInfo(pageNo);
  }
}

class GirlListPresenter {
  GirlListViewContract view;
  GirlListModel model = GirlListModel();

  GirlListPresenter(this.view);

  getGirlInfo(int pageNo, {int limit = 10}) async {
    view.showLoadingView();
    print("开始");
    try {
      var response = await model.getGirlInfo(pageNo);
      view.showSuccessView(response.data["results"]);
    } catch (e) {
      print(e);
      view.showErrorView();
    }
  }
}
