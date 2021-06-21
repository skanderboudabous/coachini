import 'package:coachini/pages/users_subscribed.dart';
import 'package:coachini/pages/users_unsubscribed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';

class MainWidgetAdmin extends StatefulWidget {
  bool isDrawerOpen;
  MainWidgetAdmin(this.isDrawerOpen);
  @override
  _MainWidgetAdminState createState() => _MainWidgetAdminState();
}

class _MainWidgetAdminState extends State<MainWidgetAdmin>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          Expanded(
              child: TabBarView(
            physics:  widget.isDrawerOpen? NeverScrollableScrollPhysics() : PageScrollPhysics(),
            controller: _tabController,
            children: [
              UsersSubscribed(),
              UsersUnSubscribed(),
            ],
          ))
        ],
      ),
    );
  }
}
