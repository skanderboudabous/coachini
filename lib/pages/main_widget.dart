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
                background: Image.asset(
                  "assets/images/img1.jpg",
                  fit: BoxFit.cover,
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
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),

                ],
              ),
                ExpansionCard(
                  borderRadius: 20,
                  background: Image.asset(
                    "assets/images/img2.png",
                    fit: BoxFit.cover,
//                    colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
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
                          style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                ExpansionCard(
                  borderRadius: 20,
                  background: Image.asset(
                    "assets/images/img3.jpg",
                    fit: BoxFit.cover,
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
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    )
                  ],
                ),
                ExpansionCard(
                  borderRadius: 20,
                  background: Image.asset(
                    "assets/images/img4.jpg",
                    fit: BoxFit.cover,
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
                      padding: const EdgeInsets.only(right: 130, left: 10),
                      child: Text("Le sport est une moyen qui va permettre d'atteindre plusieurs objectifs: perte de poid, renforcement muculaire, préparation physique, remise en forme",
                          style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                ExpansionCard(
                  borderRadius: 20,
                  background: Image.asset(
                    "assets/images/img5.jpg",
                    fit: BoxFit.cover,
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
                      child: Text("LE sport est une moyen qui va permettre d'atteindre plusieurs objectifs: perte de poid, renforcement muculaire, préparation physique, remise en forme",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    )
                  ],
                ),
              ]
          ),
        ),
    );
  }
}


