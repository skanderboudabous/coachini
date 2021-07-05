import 'package:coachini/controller/firebase_controller.dart';
import 'package:coachini/models/exercice.dart';
import 'package:coachini/pages/exercices_detail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercicesCard extends StatefulWidget {
  final Exercice exercice;
  final String? userId;

  ExercicesCard(this.exercice, this.userId);

  @override
  _ExercicesCardState createState() => _ExercicesCardState();
}

class _ExercicesCardState extends State<ExercicesCard> {
  bool? isExpired;
  bool? isAdmin;

  @override
  void initState() {
    // TODO: implement initState
    isAdmin = Get.find<FirebaseController>().admin.value;
    this.isExpired = widget.exercice.dateLim!.compareTo(DateTime.now()) <= 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(15)),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(new ExerciceDetailPage(widget.userId,
                  exercice: this.widget.exercice));
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.exercice.nom!+" "+
                  formatDate(widget.exercice.dateLim!,
                      [dd, '-', MM, '-', yyyy]),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          AbsorbPointer(
            absorbing: (this.isExpired! && !this.isAdmin!) || this.isAdmin!,
            child: Checkbox(
              value: widget.exercice.isDone,
              onChanged: (bool? value) {
                setState(() {
                  widget.exercice.isDone = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
