import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:get/get.dart';

class ObjectifPage extends StatefulWidget {
  final String? userId;

  ObjectifPage(this.userId);

  @override
  _ObjectifPageState createState() => _ObjectifPageState();
}

class _ObjectifPageState extends State<ObjectifPage> {
  List<String> _objectifs = [
    "Art martial",
    "Cardio training",
    "Coaching individuel et/ou groupes",
    "Cross training",
    "Cuisses abdos fessiers",
    "Femmes enceintes",
    "Gym a domicile",
    "Gym et pathologie",
    "Gym enfant",
    "Gym handicap",
    "Gym senior",
    "Musculation",
    "Perte de poids",
    "Post accouchement",
    "Préparation mentale",
    "Préparation physique",
    "Prise de masse",
    "Réathlétisation",
    "Remise en forme",
    "Renforcement musculaire",
    "Stretching",
    "Soin énergétique",
    "Tonification musculaire",
    "TRX",
    "Travail postural",
    "Ventre plat",
  ];

  bool? isAdmin;
  int? selectedIndex = 0;

  @override
  void initState() {
    isAdmin = Get.find<FirebaseController>().admin.value;
    FirebaseController.to.getLastObjectif(widget.userId).then((value) {
      setState(() {
        if (value.size == 0) {
          this.selectedIndex = 0;
        } else {
          Objectif objectif = Objectif.fromMap(value.docs[0].data());
          print(objectif.date);
          this.selectedIndex = this._objectifs.indexOf(objectif.nom!);
        }
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Objectif",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              isAdmin == true
                  ? Get.toNamed(AppRoutes.USER_PROFILE + "?id=" + widget.userId!)
                  : Get.toNamed(AppRoutes.HOME);
            },
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: DirectSelectContainer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    SizedBox(height: 150.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Card(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (isAdmin == false) {
                                                showShortToast(
                                                    "Please contact the administrator");
                                              }
                                            },
                                            child: AbsorbPointer(
                                              child: DirectSelectList<String>(
                                                values: _objectifs,
                                                defaultItemIndex:
                                                    this.selectedIndex ?? 0,
                                                itemBuilder: (String value) =>
                                                    getDropDownMenuItem(value),
                                                focusedItemDecoration:
                                                    _getDslDecoration(),
                                                onItemSelectedListener:
                                                    (item, index, context) {
                                                  setState(() {
                                                    this.selectedIndex = index;
                                                    print(this.selectedIndex);
                                                  });
                                                },
                                              ),
                                              absorbing: isAdmin == false,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(left: 12))),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.unfold_more,
                                      color: Colors.black38,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        floatingActionButton: isAdmin == true
            ? ElevatedButton(
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Colors.blue, // <-- Button color
                ),
                onPressed: () {
                  Objectif? objectif = new Objectif();
                  objectif.nom = this._objectifs[this.selectedIndex!];
                  objectif.date = DateTime.now();
                  FirebaseController.to.addObjectif(objectif, widget.userId);
                  Get.back();
                },
              )
            : SizedBox());
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }
}
