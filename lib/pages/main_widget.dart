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
          child: Container(
           color: Colors.transparent,
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
                          "Sport et Santé",
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
                        child: Text("Quand on fait du sport, on est plus résistant au stress et on a moins tendance à basculer dans l'anxiété et la dépression. On maîtrise mieux les émotions négatives et les échecs. Le sport permet d'augmenter le niveau d'estime de soi, ce qui aide aussi à l'amélioration de la santé mentale.",
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
                        child: Text("La pratique régulière d’une activité sportive ou physique a un effet bénéfique sur la vie sociale et la santé. Non seulement elle a une incidence directe sur les aptitudes physiques, mais elle aide aussi les enfants et les jeunes à faire des choix sains, à rester actifs et à lutter contre les maladies non transmissibles.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: AssetImage("assets/images/img6.jpg"),
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Vo2max",
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
                        child: Text("Le Volume d’Oxygène Maximum (VO2max) est la quantité maximale d’oxygène que le corps consomme lors d’un effort intense par unité de temps.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: AssetImage("assets/images/img8.jpg"),
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "VMA",
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
                        child: Text("La vitesse maximale aérobie est la vitesse maximale que l’on peut atteindre pendant l’effort en consommant le maximum d’oxygène (VO2max). Au-delà de cette vitesse, les muscles ne peuvent plus fonctionner avec de l’oxygène.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: AssetImage("assets/images/img9.jpg"),
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Fréquence cardiaque",
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
                        child: Text("correspond au nombre de battements du cœur pendant un laps de temps donné, une minute généralement. Elle varie sous l'impact de nombreux paramètres. On estime que chez l'adulte, au repos, une fréquence cardiaque normale est comprise entre 60 et 100 battements par minute (bpm).",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: AssetImage("assets/images/img11.jpg"),
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Stress",
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
                        child: Text("Le stress est un ensemble de réactions physiques et physiologiques de l'organisme, face à une situation particulière, que l'on dit stressante, et/ou des facteurs de stress. Il peut concerner tout le monde, le plus généralement sur une courte durée. Une situation de stress chronique est cependant pathologique.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ), ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: AssetImage("assets/images/img7.jpg"),
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "SpO2",
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
                        child: Text("La saturation en oxygène du sang (SpO2) est le pourcentage d'hémoglobine dans le sang qui contient de l'oxygène (HbO2). C'est un indicateur physiologique fondamental.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: AssetImage("assets/images/img10.jpg"),
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Composition corporelle",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Text("De manière générale, la composition corporelle est l’ensemble des éléments qui compose le corps humain. Parmi les éléments, on retrouve la masse grasse, la masse musculaire, la quantité d’eau, le squelette et les organes. Ensemble, ils composent le corps.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: AssetImage("assets/images/img12.jpg"),
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "IMC ",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Text("L’indice de masse corporelle (IMC) est le seul indice validé par l’Organisation mondiale de la santé pour évaluer la corpulence d’un individu et donc les éventuels risques pour la santé.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                ]
            ),
          ),
        ),
    );
  }
}


