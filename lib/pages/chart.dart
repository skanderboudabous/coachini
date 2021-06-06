import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/controller/firebase_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  String? title;
  String? atr;
  String? collectionName;

  ChartPage(
      {required this.title, required this.atr, required this.collectionName});

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: FutureBuilder(
          future: FirebaseController.to
              .getChartData(widget.collectionName!, widget.atr!),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              final List<DocumentSnapshot> docs = snapshot.data!.docs;
              List<dynamic> dataList = [];

              docs.forEach((element) {
                final data = element.data();
                dataList.add(
                    {"date": data!['date'], widget.atr: data[widget.atr!]});
              });
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.title!),
                  Stack(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.7,
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: Color(0xff232d37)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 18.0, left: 12.0, top: 24, bottom: 12),
                            child: LineChart(
                              mainData(dataList),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        )),
      ),
    );
  }

  LineChartData mainData(List<dynamic> dataList) {
    print(dataList);
    List<FlSpot> spots = [];
    dataList.forEach((element) {
      spots.add(new FlSpot(dataList.indexOf(element).toDouble(),
          element[widget.atr].toDouble()));
    });
    final List<FlSpot> sortedSpots=spots;

    spots.sort((a,b){
      return a.y <=b.y ? 1 : -1;
    });

    print(spots);
    double max=spots[0].y;
    print(max);
    spots=spots.map((element) {
      return FlSpot(element.x,(element.y/max)*12);
    }).cast<FlSpot>().toList();
    spots.sort((a,b){
      return a.x >=b.x ? 1 : -1;
    });
    sortedSpots.sort((a,b){
      return a.y >=b.y ? 1 : -1;
    });
    print(spots);
    print(sortedSpots);
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          rotateAngle: -90,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.w900,
              fontSize: 12),
          getTitles: (value) {
            if (value.toInt() + 1 <= dataList.length) {
              final Timestamp date = dataList[value.toInt()]['date'];
              final String formatedDate =
                  formatDate(date.toDate(), [dd, "-", m, "-", yy]);
              return formatedDate;
            } else {
              return "";
            }
          },
          margin: 40,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            print(value.toInt() + 1 <= dataList.length);
            if (value.toInt() + 1 <= dataList.length) {
              print(value.toInt());
              print(sortedSpots[value.toInt()].y.toInt().toString());
              return  sortedSpots[value.toInt()].y.toInt().toString();
            } else {
              return "";
            }
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
