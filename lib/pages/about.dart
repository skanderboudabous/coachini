import 'package:coachini/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: new Text("About",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/images/bg6.jpg"),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black45,
          ),
          Padding(
            padding: const EdgeInsets.only(top:30.0,left: 20,right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                Image(
                  image: new AssetImage("assets/images/logo.png"),
                  width: 150,
                ),
                SizedBox(
                  height: 60,
                ),
                Text("Coachini", style: TextStyle(color: Colors.white,fontSize: 20)),
                Text("1.0", style: TextStyle(color: Colors.white,fontSize: 16)),
                SizedBox(
                  height: 20,
                ),
                Text("Coachini est une application professionnel de coaching personnel présentiel ou à distance à pour objectif d'aider les adhérents à atteindre leurs objectifs.",
                  style: TextStyle(color: Colors.white,fontSize: 16),textAlign:
                  TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("developpé par",
                  style: TextStyle(color: Colors.white,fontSize: 16),textAlign:
                  TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("Mohamed MSEDDI", style: TextStyle(color: Colors.white,fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "mseddi.mohamed@iit.ens.tn",
                    style: TextStyle(color: Colors.white,fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Text("Skander BOUDABOUS", style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Text("skanderdeutschland@gmail.com",
                    style: TextStyle(color: Colors.white,fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Text("appartient à",
                  style: TextStyle(color: Colors.white,fontSize: 16),textAlign:
                  TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                Text("Ilyes MOALLA", style: TextStyle(color: Colors.white,fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Text("Achraf OUANADA", style: TextStyle(color: Colors.white,fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Text("Deux experts en sciences du sport",
                    style: TextStyle(color: Colors.white,fontSize: 16)),
                SizedBox(
                  height: 10,
                ),

              ],
            ),
          ),
        ],
      ),
    );

  }
}
