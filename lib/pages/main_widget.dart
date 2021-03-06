import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  Image? image1;
  Image? image2;
  Image? image3;
  Image? image4;
  Image? image5;
  Image? image6;
  Image? image7;
  Image? image8;
  Image? image9;
  Image? image10;
  Image? image11;
  Image? image12;
  @override
  void initState() {
    image1=Image.asset("assets/images/img1.jpg");
    image2=Image.asset("assets/images/img2.png");
    image3=Image.asset("assets/images/img3.jpg");
    image4=Image.asset("assets/images/img4.jpg");
    image5=Image.asset("assets/images/img5.jpg");
    image6=Image.asset("assets/images/img6.jpg");
    image7=Image.asset("assets/images/img7.jpg");
    image8=Image.asset("assets/images/img8.jpg");
    image9=Image.asset("assets/images/img9.jpg");
    image10=Image.asset("assets/images/img10.jpg");
    image11=Image.asset("assets/images/img11.jpg");
    image12=Image.asset("assets/images/img12.jpg");
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(image1!.image,context);
    precacheImage(image2!.image,context);
    precacheImage(image3!.image,context);
    precacheImage(image4!.image,context);
    precacheImage(image5!.image,context);
    precacheImage(image6!.image,context);
    precacheImage(image7!.image,context);
    precacheImage(image8!.image,context);
    precacheImage(image9!.image,context);
    precacheImage(image10!.image,context);
    precacheImage(image11!.image,context);
    precacheImage(image12!.image,context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
           color: Colors.transparent,
            child: Column(
                children: <Widget>[ExpansionCard(
                  borderRadius: 20,
                  background: Image(image: image1!.image,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black38,
                  ),
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sport et sant??",
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
                      child: Text("La pratique d???activit??s physiques ou sportives contribue au maintien de la sant?? chez le sujet sain dans le cadre de la pr??vention primaire. Elle contribue aussi chez les personnes vivant avec une maladie chronique non transmissible ?? am??liorer l?????tat de sant?? et ?? pr??venir l???aggravation et/ou la r??cidive de ces maladies chroniques (pr??vention tertiaire).",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),

                  ],
                ),
                  ExpansionCard(
                    borderRadius: 20,
                      background: Image(image: image2!.image,
                      colorBlendMode: BlendMode.darken,
                        color: Colors.black38,
                      ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Entra??nement",
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
                        child: Text("L'entra??nement sportif est l'ensemble des m??thodes et exercices physiques visant l'entretien et l'am??lioration des performances sportives, chez le sportif amateur ou professionnel ; cet entra??nement comprend notamment la pr??paration physique, technique, tactique et mentale.",
                            style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.normal)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image:image3!.image,
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Sport et sant?? mentale",
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
                        child: Text("Quand on fait du sport, on est plus r??sistant au stress et on a moins tendance ?? basculer dans l'anxi??t?? et la d??pression. On ma??trise mieux les ??motions n??gatives et les ??checs. Le sport permet d'augmenter le niveau d'estime de soi, ce qui aide aussi ?? l'am??lioration de la sant?? mentale.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image4!.image,
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
                        child: Text("La liste des bienfaits du sport sur la sant?? est longue comme le bras : meilleur fonctionnement du coeur et de l???activit?? sanguine, augmentation de la masse musculaire, diminution de la masse graisseuse, am??lioration du sommeil??? ",
                            style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.normal)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image5!.image,
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Sport et bien ??tre",
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
                        child: Text("La pratique r??guli??re d???une activit?? sportive ou physique a un effet b??n??fique sur la vie sociale et la sant??. Non seulement elle a une incidence directe sur les aptitudes physiques, mais elle aide aussi les enfants et les jeunes ?? faire des choix sains, ?? rester actifs et ?? lutter contre les maladies non transmissibles.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image6!.image,
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
                        child: Text("Le Volume d???Oxyg??ne Maximum (VO2max) est la quantit?? maximale d???oxyg??ne que le corps consomme lors d???un effort intense par unit?? de temps.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image8!.image,
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
                        child: Text("La vitesse maximale a??robie est la vitesse maximale que l???on peut atteindre pendant l???effort en consommant le maximum d???oxyg??ne (VO2max). Au-del?? de cette vitesse, les muscles ne peuvent plus fonctionner avec de l???oxyg??ne.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image9!.image,
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black38,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Fr??quence cardiaque",
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
                        child: Text("correspond au nombre de battements du c??ur pendant un laps de temps donn??, une minute g??n??ralement. Elle varie sous l'impact de nombreux param??tres. On estime que chez l'adulte, au repos, une fr??quence cardiaque normale est comprise entre 60 et 100 battements par minute (bpm).",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image11!.image,
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
                        child: Text("Le stress est un ensemble de r??actions physiques et physiologiques de l'organisme, face ?? une situation particuli??re, que l'on dit stressante, et/ou des facteurs de stress. Il peut concerner tout le monde, le plus g??n??ralement sur une courte dur??e. Une situation de stress chronique est cependant pathologique.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ), ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image7!.image,
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
                        child: Text("La saturation en oxyg??ne du sang (SpO2) est le pourcentage d'h??moglobine dans le sang qui contient de l'oxyg??ne (HbO2). C'est un indicateur physiologique fondamental.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image10!.image,
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
                        child: Text("De mani??re g??n??rale, la composition corporelle est l???ensemble des ??l??ments qui compose le corps humain. Parmi les ??l??ments, on retrouve la masse grasse, la masse musculaire, la quantit?? d???eau, le squelette et les organes. Ensemble, ils composent le corps.",
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                      )
                    ],
                  ),
                  ExpansionCard(
                    borderRadius: 20,
                    background: Image(image: image12!.image,
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
                        child: Text("L???indice de masse corporelle (IMC) est le seul indice valid?? par l???Organisation mondiale de la sant?? pour ??valuer la corpulence d???un individu et donc les ??ventuels risques pour la sant??.",
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


