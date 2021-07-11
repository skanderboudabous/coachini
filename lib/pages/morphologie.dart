import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/type-morphologie.dart';
import 'package:coachini/routes/app_routes.dart';
import 'package:coachini/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_choices/search_choices.dart';

class MorphologiePage extends StatefulWidget {
  final String? userId;

  MorphologiePage(this.userId);

  @override
  _MorphologiePageState createState() => _MorphologiePageState();
}

class _MorphologiePageState extends State<MorphologiePage> {
  List<String> morphologies = ["Ectomorphe", "Mésomorphe", "Endomorphe"];
  List<DropdownMenuItem<String>> items = [];

  bool? isAdmin;
  int selectedIndex = 0;

  @override
  void initState() {
    items = morphologies
        .map((e) => DropdownMenuItem<String>(
              child: (Text(e)),
              value: e,
            ))
        .toList();
    isAdmin = Get.find<FirebaseController>().admin.value;
    FirebaseController.to.getLastTypeMorphologie(widget.userId).then((value) {
      setState(() {
        if (value.size == 0) {
          this.selectedIndex = 0;
        } else {
          TypeMorphologie typeMorphologie =
              TypeMorphologie.fromMap(value.docs[0].data());
          print(typeMorphologie.nom);
          this.selectedIndex = this.morphologies.indexOf(typeMorphologie.nom!);
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
        title: Text("Type de morphologie",
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
            image: AssetImage("assets/images/bg11.jpg"),
            fit: BoxFit.cover,
          ),
        ),
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
                                        child: SearchChoices.single(
                                          items: items,
                                          value:
                                              morphologies[this.selectedIndex],
                                          hint: "",
                                          searchHint: "",
                                          onChanged: (value) {
                                            setState(() {
                                              this.selectedIndex =
                                                  morphologies.indexOf(value);
                                            });
                                          },
                                          displayClearIcon: false,
                                          isExpanded: true,
                                        ),
                                        absorbing: isAdmin == false,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 12)
                                )
                            ),
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
      ),
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
                TypeMorphologie? typeMorphologie = new TypeMorphologie();
                typeMorphologie.nom = this.morphologies[this.selectedIndex];
                typeMorphologie.date = DateTime.now();
                FirebaseController.to
                    .addTypeMorphologie(typeMorphologie, widget.userId);
                Get.back();
              },
            )
          : SizedBox(),
    );
  }

}
