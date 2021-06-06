import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/models/composition-corporelle.dart';
import 'package:coachini/models/exercice.dart';
import 'package:coachini/models/mesure.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/regime-alimentaire.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/suivi-entrainement.dart';
import 'package:coachini/models/suivie-mentale.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/models/type-morphologie.dart';
import 'package:coachini/utils/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FirebaseController extends GetxController {
  static FirebaseController to = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _fs = FirebaseStorage.instance;
  final Rx<User> firebaseUser = Rx<User>();
  final Rx<Adherant> firestoreUser = Rx<Adherant>();
  final RxBool admin = false.obs;
  static String? currentId;
  final userCollection = FirebaseFirestore.instance.collection("users");
  final objectifCollection = FirebaseFirestore.instance.collection("objectifs");
  final muscleCollection = FirebaseFirestore.instance.collection("muscles");
  final exerciceCollection = FirebaseFirestore.instance.collection("exercices");
  final mesureCollection = FirebaseFirestore.instance.collection("mesures");
  final rmCollection = FirebaseFirestore.instance.collection("rms");
  final rmImagesCollection = FirebaseFirestore.instance.collection("rm-images");
  final exerciceImagesCollection = FirebaseFirestore.instance.collection("exercice-images");
  final suivieNutritionnelCollection =
  FirebaseFirestore.instance.collection("suiviesNurtitionneles");
  final suiviEntrainementsCollection =
  FirebaseFirestore.instance.collection("suiviEntrainements");
  final compositionCorporelleCollection =
  FirebaseFirestore.instance.collection("compositionCorporelles");
  final regimeAlimentaireCollection =
  FirebaseFirestore.instance.collection("regimeAlimentaires");

  @override
  void onReady() {
    // TODO: implement onReady
    print("Hello");
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.bindStream(user);
    super.onReady();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      currentId = _firebaseUser.uid;
      firestoreUser.bindStream(streamFirestoreUser());
      await isAdmin();
    }

    if (_firebaseUser == null) {
      print('Send to signin');
      Get.offAllNamed(AppRoutes.SIGNIN);
    } else {
      if (admin.value == false)
        Get.offAllNamed(AppRoutes.HOME);
      else {
        Get.offAllNamed(AppRoutes.ADMIN);
      }
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Stream<Adherant> streamFirestoreUser() {
    print('streamFirestoreUser()');

    return _db
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => Adherant.fromMap(snapshot.data()!));
  }

  //get the firestore user from the firestore collection
  Future<Adherant> getFirestoreUser() {
    return _db
        .doc('/users/${firebaseUser.value!.uid}')
        .get()
        .then((documentSnapshot) => Adherant.fromMap(documentSnapshot.data()!));
  }

  isAdmin() async {
    var adherant = await getFirestoreUser();
    admin.value = adherant.isAdmin;
    update();
  }

  Future<User?> login(
      {required String email,
        required String password,
        required BuildContext context}) async {
    showLoadingIndicator(context);
    try {
      final authResult = (await _auth.signInWithEmailAndPassword(
          email: email, password: password));
      User? user = authResult.user;
      hideLoadingIndicator(context);
      return user;
    } on FirebaseAuthException catch (e) {
      hideLoadingIndicator(context);
      if (e.code == 'user-not-found') {
        showShortToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showShortToast('Wrong password provided for that user.');
      }
    }
  }

  Future<Adherant?> register(
      {required String email,
        required String password,
        required BuildContext context}) async {
    showLoadingIndicator(context);

    try {
      final UserCredential result = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password));
      Adherant? user = new Adherant(
        email: email,
        id: (result.user)?.uid,
      );
      user.isAdmin=false;
      await setNewUser(user);
      hideLoadingIndicator(context);
      return user;
    } on FirebaseAuthException catch (e) {
      hideLoadingIndicator(context);

      if (e.code == 'weak-password') {
        showShortToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showShortToast('The account already exists for that email.');
      }
    }
  }

  showLoadingIndicator(BuildContext context) {
    context.loaderOverlay.show();
  }

  hideLoadingIndicator(BuildContext context) {
    context.loaderOverlay.hide();
  }

  Future<void> setNewUser(Adherant user) async {
    await userCollection.doc(user.id).set(user.toMap());
  }

  Future<void> logout() async {
    return _auth.signOut();
  }

  //#region Exercice Functions

  Future<Exercice> addExercice(Exercice exercice, String? userId) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction
          .get(userCollection.doc(userId).collection("exercices").doc());
      print(ds.id);
      exercice.id = ds.id;
      await transaction.set(
          userCollection.doc(userId).collection("exercices").doc(exercice.id),
          exercice.toMap());
      return exercice;
    });
  }

  Future<QuerySnapshot> getExercicesImages() async {
    return exerciceImagesCollection.get();

  }
  Future<QuerySnapshot> getRMsImages() async {
    return rmImagesCollection.get();

  }

  Future<Exercice> updateExercice(Exercice exercice) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(exerciceCollection.doc(exercice.id), exercice.toMap());
      return exercice;
    });
  }

  //#endregion

  //#region Mesure Functions

  Future<Mesure> addMesure(Mesure mesure, String? userId) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction
          .get(userCollection.doc(userId).collection("mesures").doc());
      print(ds.id);
      mesure.id = ds.id;
      await transaction.set(
          userCollection.doc(userId).collection("mesures").doc(mesure.id),
          mesure.toMap());
      return mesure;
    });
  }  Future<RM> addRM(RM rm, String? userId) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction
          .get(userCollection.doc(userId).collection("rms").doc());
      print(ds.id);
      rm.id = ds.id;
      await transaction.set(
          userCollection.doc(userId).collection("rms").doc(rm.id),
          rm.toMap());
      return rm;
    });
  }

  Future<QuerySnapshot> getMesures() async {
    return mesureCollection.get();
  }

  Future<Mesure> updateMesure(Mesure mesure) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(mesureCollection.doc(mesure.id), mesure.toMap());
      return mesure;
    });
  }

  //#region Objectif Functions

  Future<Objectif> addObjectif(Objectif objectif, String? userId) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction
          .get(userCollection.doc(userId).collection("objectives").doc());
      print(ds.id);
      objectif.id = ds.id;
      await transaction.set(
          userCollection.doc(userId).collection("objectives").doc(objectif.id),
          objectif.toMap());
      return objectif;
    });
  }

  Future<QuerySnapshot> getLastObjectif(String? userId) {
    return userCollection
        .doc(userId)
        .collection("objectives")
        .orderBy("date", descending: true)
        .limit(1)
        .get();
  }

  //#endregion

  //#region TypeMorphologie Functions
  Future<TypeMorphologie> addTypeMorphologie(
      TypeMorphologie typeMorphologie, String? userId) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction
          .get(userCollection.doc(userId).collection("typeMorphologies").doc());
      print(ds.id);
      typeMorphologie.id = ds.id;
      transaction.set(
          userCollection
              .doc(userId)
              .collection("typeMorphologies")
              .doc(typeMorphologie.id),
          typeMorphologie.toMap());
      return typeMorphologie;
    });
  }

  Future<QuerySnapshot> getLastTypeMorphologie(String? userId) {
    return userCollection
        .doc(userId)
        .collection("typeMorphologies")
        .orderBy("date", descending: true)
        .limit(1)
        .get();
  }

  //#endregion

  //#region SuivieNutritionnel Functions

  Future<SuivieNutritionnel> addSuivieNutritionnel(
      SuivieNutritionnel suivieNutritionnel, String id) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction
          .get(userCollection.doc(id).collection("suivieNutritionnels").doc());
      print(ds.id);
      suivieNutritionnel.id = ds.id;
      await transaction.set(
          userCollection
              .doc(id)
              .collection("suivieNutritionnels")
              .doc(suivieNutritionnel.id),
          suivieNutritionnel.toMap());
      return suivieNutritionnel;
    });
  }

  Future<SuiviEntrainement> addSuivieEntrainement(
      SuiviEntrainement suiviEntrainement, String id) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction
          .get(userCollection.doc(id).collection("suiviEntrainements").doc());
      print(ds.id);
      suiviEntrainement.id = ds.id;
      await transaction.set(
          userCollection
              .doc(id)
              .collection("suiviEntrainements")
              .doc(suiviEntrainement.id),
          suiviEntrainement.toMap());
      return suiviEntrainement;
    });
  }

  Future<CompositionCorporelle> addCompositionCorporelle(
      CompositionCorporelle compositionCorporelle, String id) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction.get(
          userCollection.doc(id).collection("compositionCorporelles").doc());
      print(ds.id);
      compositionCorporelle.id = ds.id;
      transaction.set(
          userCollection
              .doc(id)
              .collection("compositionCorporelles")
              .doc(compositionCorporelle.id),
          compositionCorporelle.toMap());
      return compositionCorporelle;
    });
  }

//#endregion

  //#region Users Functions

  Future<QuerySnapshot> getUsers() async {
    return userCollection.get();
  }

  Stream<QuerySnapshot> getUsersSubscribed() {
    return userCollection.where("isSubscribed", isEqualTo: true).snapshots();
  }

  Stream<QuerySnapshot> getUsersUnSubscribed() {
    return userCollection.where("isSubscribed", isEqualTo: false).snapshots();
  }

  Future<Adherant?> getUserFromId({required String? id}) async {
    final DocumentSnapshot documentSnapshot =
    (await userCollection.doc(id).get());
    return Adherant.fromMap(documentSnapshot.data());
  }

  Future<QuerySnapshot> getUserSuivieNutritionnels({required String? id}) {
    return userCollection
        .doc(id)
        .collection("suivieNutritionnels")
        .orderBy('date', descending: true)
        .get();
  }

  Future<QuerySnapshot> getUserMesures({required String? id}) {
    return userCollection
        .doc(id)
        .collection("mesures")
        .orderBy('date', descending: true)
        .get();
  }

  Future<void> setUserSubscribed({required String? userId}) async {
    return userCollection.doc(userId).update({"isSubscribed": true});
  }

  Future<void> setUserUnSubscribed({required String? userId}) async {
    return userCollection.doc(userId).update({"isSubscribed": false});
  }

  Future<QuerySnapshot> getUserSuiviEntrainements({required String? id}) {
    return userCollection
        .doc(id)
        .collection("suiviEntrainements")
        .orderBy('date', descending: true)
        .get();
  }

  Future<QuerySnapshot> getUserCompositionCorporelle({required String? id}) {
    return userCollection
        .doc(id)
        .collection("compositionCorporelles")
        .orderBy('date', descending: true)
        .get();
  }

  Future<QuerySnapshot> getUserExercices({required String? id}) {
    return userCollection
        .doc(id)
        .collection("exercices")
        .orderBy('dateLim', descending: true)
        .get();
  }

  Future<QuerySnapshot> getUserRms({required String? id}) {
    return userCollection
        .doc(id)
        .collection("rms")
        .orderBy('date', descending: true)
        .get();
  }

  Future<void> updateProfile(
      {required Map<String, dynamic>? data, File? image}) async {
    Map<String, dynamic> updatedData = Map.from(data!);
    print(Timestamp.fromDate(updatedData['birthday']!));
    updatedData['birthday'] = Timestamp.fromDate(updatedData['birthday']!);
    if (image != null) {
      String? extension = ((image.path.split("/").last).split(".").last);
      Reference ref = _fs.ref("users/${currentId!}.$extension");
      var bytes = await image.readAsBytes();
      await ref.putData(bytes);
      var url = await ref.getDownloadURL();
      updatedData.putIfAbsent("pictureUrl", () => url);
    }
    await userCollection.doc(currentId).update(updatedData);
  }

  Future<void> addRmImage(
      {required Map<String, dynamic>? data, File? image}) async {
    var name = data?['name'];
    Map<String, dynamic> updatedData = Map.from(data!);
    String? extension = ((image!.path.split("/").last).split(".").last);
    Reference ref = _fs.ref("rms/${name}.$extension");
    var bytes = await image.readAsBytes();
    await ref.putData(bytes);
    var url = await ref.getDownloadURL();
    updatedData.putIfAbsent("pictureUrl", () => url);
    await rmImagesCollection.doc().set(updatedData);
  }
  Future<void> addExerciceImage(
      {required Map<String, dynamic>? data, File? image}) async {
    var name = data?['name'];
    Map<String, dynamic> updatedData = Map.from(data!);
    String? extension = ((image!.path.split("/").last).split(".").last);
    Reference ref = _fs.ref("exercices/${name!}.$extension");
    var bytes = await image.readAsBytes();
    await ref.putData(bytes);
    var url = await ref.getDownloadURL();
    updatedData.putIfAbsent("pictureUrl", () => url);
    await exerciceImagesCollection.doc().set(updatedData);
  }

  Future<QuerySnapshot> getUserRegimeAlimentaire({String? id}) {
    return userCollection
        .doc(id)
        .collection("regimeAlimentaires")
        .orderBy('date', descending: true)
        .get();
  }

  Future<RegimeAlimentaire> addRegimeAlimentaire(RegimeAlimentaire regimeAlimentaire, String? userId) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction
          .get(userCollection.doc(userId).collection("regimeAlimentaires").doc());
      print(ds.id);
      regimeAlimentaire.id = ds.id;
      transaction.set(
          userCollection
              .doc(userId)
              .collection("regimeAlimentaires")
              .doc(regimeAlimentaire.id),
          regimeAlimentaire.toMap());
      return regimeAlimentaire;
    });
  }

  Future<QuerySnapshot> getChartData(String collectionName,String atr){
    return userCollection.doc(firestoreUser.value!.id).collection(collectionName).orderBy('date', descending: true).limit(12).get();

  }

  addSuivieMentale(SuivieMentale suivieMentale, String s) {

  }
//#endregion
}
