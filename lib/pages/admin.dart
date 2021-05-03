import 'package:auto_animated/auto_animated.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
import 'package:get/get.dart';

import 'login.dart';
class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>  with SingleTickerProviderStateMixin{

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Admin"),
        actions: [
          IconButton(icon: Icon(Icons.cancel), onPressed: ()=>{
            Get.find<FirebaseController>().logout()
          })
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            ColorfulTabBar(
              controller: _tabController,
              tabs: [
                TabItem(
                    title: Row(children: [
                      Icon(Icons.favorite),
                      SizedBox(width: 8),
                      Text('Abonnés')
                    ]),
                    color: Colors.lightBlue.shade600),
                TabItem(
                    title: Row(children: [
                      Icon(Icons.cancel),
                      SizedBox(width: 8),
                      Text('Non abonnés')
                    ]),
                    color: Colors.lightBlue.shade600),
              ],
            ),
            Expanded(child: TabBarView(
              controller: _tabController,
              children: [
                userSubscribed(),
                userSubscribed(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget userSubscribed(){
    return LiveList(
      showItemInterval: Duration(milliseconds: 150),
      showItemDuration: Duration(milliseconds: 350),
      padding: EdgeInsets.all(16),
      reAnimateOnVisibility: true,
      scrollDirection: Axis.vertical,
      itemCount: 20,
      itemBuilder: animationItemBuilder(
            (index) =>Card(
          child: Text(
            index.toString(),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }


}
