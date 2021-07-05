import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'main_widget_admin.dart';
import 'menu_widget_admin.dart';

class HomeAdminPage extends StatefulWidget {
  @override
  _HomeAdminPageState createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  late String title;
  final GlobalKey<SliderMenuContainerState> key =
      new GlobalKey<SliderMenuContainerState>();

  @override
  void initState() {
    title = "Home Admin";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: SliderMenuContainer(
            appBarColor: Colors.white,
            sliderMenuOpenSize: 200,
            title: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            key: key,
            sliderMenu: MenuWidgetAdmin(
              onItemClick: (title) {
                Navigator.pop(context);
              },
            ),
            sliderMain: MainWidgetAdmin(key.currentState == null
                ? false
                : key.currentState!.isDrawerOpen)),
      ),
    );
  }
}
