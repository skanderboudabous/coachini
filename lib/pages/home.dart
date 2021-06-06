import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'main_widget.dart';
import 'menu_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<SliderMenuContainerState> _key =
  new GlobalKey<SliderMenuContainerState>();
  late String title;
  @override
  void initState() {
    title = "Coachini";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return Scaffold(
        body: WillPopScope(
          onWillPop: (){
            return Future.value(false);
          },
          child: SliderMenuContainer(
              appBarColor: Colors.white,
              key: _key,
              sliderMenuOpenSize: 200,
              title: Text(
                "Coachini",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              sliderMenu: MenuWidget(
                onItemClick: (title) {
                  _key.currentState!.closeDrawer();

                },
              ),
              sliderMain: MainWidget()
          ),
        ),
    );
  }
}
