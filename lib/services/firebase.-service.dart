import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/models/exercice.dart';
import 'package:coachini/models/mesure.dart';
import 'package:coachini/models/muscle.dart';
import 'package:coachini/models/muscle.dart';
import 'package:coachini/models/muscle.dart';
import 'package:coachini/models/muscle.dart';
import 'package:coachini/models/muscle.dart';
import 'package:coachini/models/muscle.dart';
import 'package:coachini/models/muscle.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FirebaseService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<User> _user = Rx<User>();

  String? get userId => _user.value?.uid;

  Adherant? user;
  final userCollection = FirebaseFirestore.instance.collection("users");
  final objectifCollection=FirebaseFirestore.instance.collection("objectifs");
  final muscleCollection=FirebaseFirestore.instance.collection("muscles");
  final exerciceCollection=FirebaseFirestore.instance.collection("exercices");
  final mesureCollection=FirebaseFirestore.instance.collection("mesures");
  final rmCollection=FirebaseFirestore.instance.collection("rms");
  final suivieNutritionnelCollection=FirebaseFirestore.instance.collection("suiviesNurtitionneles");




  @override
  void onInit() {
    // TODO: implement onInit

    _user.bindStream(_auth.authStateChanges());
    _user.listen((user) async {
      if (user != null) {
        getUserFromId(id: user.uid).asStream().take(1).listen((adherant) {
          this.user = adherant;
        });
      } else {
        this.user = null;
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<User?> login({required String email, required String password}) async {
    final authResult = (await _auth.signInWithEmailAndPassword(
        email: email, password: password));
    User? user = authResult.user;
    return user;
  }

  Future<Adherant?> register(String email, String password, String firstName,
      String lastName, String phone) async {
    try {
      final UserCredential result = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password));
      Adherant? user = new Adherant(
          email: email,
          phone: phone,
          sexe: "SEXE",
          birthday: DateTime.now(),
          id: (result.user)?.uid,
          firstName: firstName,
          lastName: lastName);
      await setNewUser(user);
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  Future<void> setNewUser(Adherant user) async {
    await userCollection.doc(user.id).set(user.toMap());
  }

  Future<Adherant?> getUserFromId({required String? id}) async {
    final DocumentSnapshot documentSnapshot =
        (await userCollection.doc(id).get());
    if (documentSnapshot.data == null) return null;
    dynamic? map = documentSnapshot.data();
    List<dynamic> exercices = map['exercices'];
    print(exercices.length);
    // exercices.forEach((element) async {
    //   var doc=await element.get();
    //   print(doc.data());
    // });
    return Adherant.fromMap(documentSnapshot.data());
  }

  Future<void> logout() async {
    return _auth.signOut();
  }


  //#region Exercice Functions

  Future<Exercice> addExercice(Exercice exercice){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds=await transaction.get(exerciceCollection.doc());
      exercice.id=ds.id;
      transaction.set(exerciceCollection.doc(exercice.id), exercice.toMap());
      return exercice;
    });
  }


  Future<QuerySnapshot> getExercices() async {
    return exerciceCollection.get();
  }


  Future<Exercice> updateExercice(Exercice exercice){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(exerciceCollection.doc(exercice.id), exercice.toMap());
      return exercice;
    });
  }

  //#endregion

  //#region Mesure Functions

  Future<Mesure> addMesure(Mesure mesure){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds=await transaction.get(mesureCollection.doc());
      mesure.id=ds.id;
      transaction.set(exerciceCollection.doc(mesure.id), mesure.toMap());
      return mesure;
    });
  }


  Future<QuerySnapshot> getMesures() async {
    return mesureCollection.get();
  }


  Future<Mesure> updateMesure(Mesure mesure){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(mesureCollection.doc(mesure.id), mesure.toMap());
    return mesure;
    });
  }

//#endregion

  //#region Muscle Functions

  Future<Muscle> addMuscle(Muscle muscle){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds=await transaction.get(muscleCollection.doc());
      muscle.id=ds.id;
      transaction.set(muscleCollection.doc(muscle.id), muscle.toMap());
      return muscle;
    });
  }


  Future<QuerySnapshot> getMuscles() async {
    return muscleCollection.get();
  }


  Future<Muscle> updateMuscle(Muscle muscle){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(muscleCollection.doc(muscle.id), muscle.toMap());
      return muscle;
    });
  }

//#endregion

  //#region RM Functions

  Future<RM> addRM(RM rm){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds=await transaction.get(rmCollection.doc());
      rm.id=ds.id;
      transaction.set(rmCollection.doc(rm.id), rm.toMap());
      return rm;
    });
  }


  Future<QuerySnapshot> getRMs() async {
    return rmCollection.get();
  }


  Future<RM> updateRM(RM rm){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(rmCollection.doc(rm.id), rm.toMap());
      return rm;
    });
  }

//#endregion

  //#region Objectif Functions

  Future<Objectif> addObjectif(Objectif objectif){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds=await transaction.get(objectifCollection.doc());
      objectif.id=ds.id;
      transaction.set(objectifCollection.doc(objectif.id), objectif.toMap());
      return objectif;
    });
  }


  Future<QuerySnapshot> getObjectifs() async {
    return objectifCollection.get();
  }


  Future<Objectif> updateObjectif(Objectif objectif){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(objectifCollection.doc(objectif.id), objectif.toMap());
      return objectif;
    });
  }

  //#endregion

  //#region SuivieNutritionnel Functions

  Future<SuivieNutritionnel> addSuivieNutritionnel(SuivieNutritionnel suivieNutritionnel){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds=await transaction.get(suivieNutritionnelCollection.doc());
      suivieNutritionnel.id=ds.id;
      transaction.set(suivieNutritionnelCollection.doc(suivieNutritionnel.id), suivieNutritionnel.toMap());
      return suivieNutritionnel;
    });
  }


  Future<QuerySnapshot> getSuivieNutritionnels() async {
    return suivieNutritionnelCollection.get();
  }


  Future<SuivieNutritionnel> updateSuivieNutritionnel(SuivieNutritionnel suivieNutritionnel){
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(suivieNutritionnelCollection.doc(suivieNutritionnel.id), suivieNutritionnel.toMap());
      return suivieNutritionnel;
    });
  }

//#endregion


}
