import 'package:coachini/utils/functions.dart';
import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.only(top:20.0,left: 20,right: 20,bottom: 35),
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
                Text("Cette application a pour objectif d'un coaching professionnel personnel présentiel ou à distance pour toute "
                    "les catégories d'âge même en présence des maladies chroniques ou aigues développé "
                    "par Skander Boudabous et Mohamed Mseddi appartient à",
                style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ilyes MOALLA      ",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("(+216) 21 531 283",textAlign: TextAlign.right,style: TextStyle(color:Colors.white),),
                    IconButton(onPressed: ()=>{
                          phoneCall("+21621531283")
                    }, icon: Icon(Icons.phone),color: Colors.green,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Achraf OUANADA",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    Text("(+216) 29 216 159", textAlign: TextAlign.right,style: TextStyle(color:Colors.white),),
                    IconButton(onPressed: ()=>{
                      phoneCall("+21629216159")
                    }, icon: Icon(Icons.phone),color: Colors.green,)
                  ],
                ),
                Text("Experts en sciences du sport",style: TextStyle(color:Colors.white),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("service.coachini@gmail.com",style: TextStyle(color:Colors.white),),
                    IconButton(onPressed: ()=>{
                      sendEmail("service.coachini@gmail.com")
                    }, icon: Icon(Icons.email_outlined,color: Colors.red,))
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("©Coachini-2021",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
        ],
      ),
    );

  }
}
