import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:get/get.dart';
class ObjectifPage extends StatefulWidget {
  @override
  _ObjectifPageState createState() => _ObjectifPageState();
}

class _ObjectifPageState extends State<ObjectifPage> {
  List<String> _objectifs = ["Perte de poids", "Prise de masse", "Remise en forme", "Renforcement musculaire",
    "Tonification musculaire", "Musculation", "TRX", "Cuisses abdos fessiers", "Ventre plat", "Cross training",
    "Cardio training", "Travail postural", "Stretching", "Art martial", "Gym senior", "Femmes enceintes",
    "Post accouchement", "Gym enfant", "Gym handicap", "Gym et pathologie", "Préparation physique",
    "Réathlétisation", "Préparation mentale", "Gym a domicile", "Coaching individuel et/ou groupes", "Soin énergétique"];


  bool? isAdmin;
  @override
  void initState() {
    isAdmin=Get.find<FirebaseController>().admin.value;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
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
                                        onTap: (){
                                          if(isAdmin== false)
                                            {
                                              showLongToast("Please contact the administrator");
                                            }
                                        },
                                        child: AbsorbPointer(
                                          child: DirectSelectList<String>(
                                              values: _objectifs,
                                              defaultItemIndex: 3,
                                              itemBuilder: (String value) => getDropDownMenuItem(value),
                                              focusedItemDecoration: _getDslDecoration(),
                                              onUserTappedListener: ()=>{
                                                showLongToast("aaaaa")
                                              },
                                              onItemSelectedListener: (item, index, context) {
                                                showLongToast(item);
                                              }),
                                          absorbing: isAdmin==false,
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
        ),
      ),
    );;
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
