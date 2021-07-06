import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/regime-alimentaire.dart';
import 'package:coachini/pages/regime-alimentaire-detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegimeAlimentaireCard extends StatefulWidget {
  final RegimeAlimentaire regimeAlimentaire;
  final String? userId;
  final VoidCallback ? onPressed;
  RegimeAlimentaireCard(this.regimeAlimentaire, this.userId, {this.onPressed});

  @override
  _RegimeAlimentaireCardState createState() => _RegimeAlimentaireCardState();
}

class _RegimeAlimentaireCardState extends State<RegimeAlimentaireCard> {
  bool? isAdmin;

  @override
  void initState() {
    isAdmin = Get.find<FirebaseController>().admin.value;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(new RegimeAlimentaireDetailPage(widget.userId,
            regimeAlimentaire: this.widget.regimeAlimentaire));
      },
      onLongPress: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDate(
                    widget.regimeAlimentaire.date!, [dd, '-', MM, '-', yyyy]),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
