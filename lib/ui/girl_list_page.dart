import 'package:flutter/material.dart';
import 'package:flutter_gank/common/entity/entity.dart';
import 'package:flutter_gank/mvp/girl_list_page_contract.dart';

class GirlListPage extends StatefulWidget {
  GirlListPage(String title);

  @override
  _GirlListPageState createState() => _GirlListPageState();
}

class _GirlListPageState extends State<GirlListPage>
    with GirlListViewContract, SingleTickerProviderStateMixin {
  int currentState = 0;
  List<GirlEntity> list = [];
  AnimationController animationController;
  Animation animation;
  GirlListPresenter presenter;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 1), vsync: this);
    var curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.linear);
    animation = Tween(begin: 20.0, end: 100.0).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        // ignore: missing_enum_constant_in_switch
        switch (status) {
          case AnimationStatus.completed:
            animationController.reverse();
            break;
          case AnimationStatus.dismissed:
            animationController.forward();
            break;
        }
      });
    animationController.forward();

    presenter = GirlListPresenter(this);
    presenter.getGirlInfo(1);
  }

  @override
  Widget build(BuildContext context) {
    return setupPage();
  }

  setupPage() {
    switch (currentState) {
      case 0:
        return Center(
          child: FlutterLogo(size: animation.value),
        );

        break;
      case 1:
        return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 10.0,
            children: list.map((it) => Image.network(it.url)).toList());

        break;
      case 2:
        return Center(
            child: Icon(
          Icons.error,
          size: 50.0,
        ));
        break;
    }
  }

  @override
  showErrorView() {
    setState(() {
      currentState = 2;
    });
  }

  @override
  showLoadingView() {
    setState(() {
      currentState = 0;
    });
  }

  @override
  showSuccessView(dynamic data) {
    setState(() {
      currentState = 1;
      list.add(GirlEntity(data[0]["url"]));
      list.add(GirlEntity(data[1]["url"]));
      list.add(GirlEntity(data[2]["url"]));
      list.add(GirlEntity(data[3]["url"]));
      list.add(GirlEntity(data[4]["url"]));
      list.add(GirlEntity(data[5]["url"]));
      list.add(GirlEntity(data[6]["url"]));
      list.add(GirlEntity(data[7]["url"]));
      list.add(GirlEntity(data[8]["url"]));
      list.add(GirlEntity(data[9]["url"]));
    });
  }
}
