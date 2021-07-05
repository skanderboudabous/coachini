import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[ExpansionCard(
                borderRadius: 20,
                background: Image(image: AssetImage("assets/images/img1.jpg"),
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black38,
                ),
                title: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Sport-Santé",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Text("La pratique d’activités physiques ou sportives contribue au maintien de la santé chez le sujet sain dans le cadre de la prévention primaire. Elle contribue aussi chez les personnes vivant avec une maladie chronique non transmissible à améliorer l’état de santé et à prévenir l’aggravation et/ou la récidive de ces maladies chroniques (prévention tertiaire).",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),

                ],
              ),
                ExpansionCard(
                  borderRadius: 20,
                    background: Image(image: AssetImage("assets/images/img2.png"),
                    colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Entraînement",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Text("L'entraînement sportif est l'ensemble des méthodes et exercices physiques visant l'entretien et l'amélioration des performances sportives, chez le sportif amateur ou professionnel ; cet entraînement comprend notamment la préparation physique, technique, tactique et mentale.",
                          style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
                ExpansionCard(
                  borderRadius: 20,
                  background: Image(image: AssetImage("assets/images/img3.jpg"),
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black38,
                  ),
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sport et santé mentale",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Text("Quand on fait du sport, on est plus résistant au stress et on a moins tendance à basculer dans l'anxiété et la dépression. On maîtrise mieux les émotions négatives et les échecsLe sport permet d'augmenter le niveau d'estime de soi, ce qui aide aussi à l'amélioration de la santé mentale.",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    )
                  ],
                ),
                ExpansionCard(
                  borderRadius: 20,
                  background: Image(image: AssetImage("assets/images/img4.jpg"),
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black38,
                  ),
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sport et objectif",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Text("La liste des bienfaits du sport sur la santé est longue comme le bras : meilleur fonctionnement du coeur et de l’activité sanguine, augmentation de la masse musculaire, diminution de la masse graisseuse, amélioration du sommeil… ",
                          style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
                ExpansionCard(
                  borderRadius: 20,
                  background: Image(image: AssetImage("assets/images/img5.jpg"),
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black38,
                  ),
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sport et bien être",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0),
                      child: Text("La pratique régulière d’une activité sportive ou physique a un effet bénéfique sur la vie sociale et la santé. Non seulement elle a une incidence directe sur les aptitudes physiques, mais elle aide aussi les enfants et les jeunes à faire des choix sains, à rester actifs et à lutter contre les maladies non transmissibles",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    )
                  ],
                ),
              ]
          ),
        ),
    );
  }
}


