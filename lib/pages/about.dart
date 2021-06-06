import 'package:coachini/routes/app_routes.dart';
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
            padding: const EdgeInsets.only(top:30.0,left: 20,right: 20,bottom: 40),
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
                Text("Cette application à pour objectif d'un coaching professionnel personnel presentiel ou a distance pour toute "
                    "les catgories d'age meme en presence des maladies chroniques ou aigues developpé "
                    "par Skander Boudabous et Mohamed Mseddi appartient à",
                style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)

              ],
            ),
          ),
        ],
      ),
    );

  }
}
