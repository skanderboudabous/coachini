import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/constants/app_routes.dart';
import 'package:coachini/models/adherant.dart';
import 'package:coachini/models/exercice.dart';
import 'package:coachini/models/mesure.dart';
import 'package:coachini/models/objectif.dart';
import 'package:coachini/models/rm.dart';
import 'package:coachini/models/suivie-nutritionnel.dart';
import 'package:coachini/utils/toast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FirebaseController extends GetxController {
  static FirebaseController to = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final Rx<User> firebaseUser = Rx<User>();
  final Rx<Adherant> firestoreUser = Rx<Adherant>();
  final RxBool admin = false.obs;
  final userCollection = FirebaseFirestore.instance.collection("users");
  final objectifCollection = FirebaseFirestore.instance.collection("objectifs");
  final muscleCollection = FirebaseFirestore.instance.collection("muscles");
  final exerciceCollection = FirebaseFirestore.instance.collection("exercices");
  final mesureCollection = FirebaseFirestore.instance.collection("mesures");
  final rmCollection = FirebaseFirestore.instance.collection("rms");
  final suivieNutritionnelCollection =
      FirebaseFirestore.instance.collection("suiviesNurtitionneles");

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
        showLongToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showLongToast('Wrong password provided for that user.');
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
      await setNewUser(user);
      hideLoadingIndicator(context);
      return user;
    } on FirebaseAuthException catch (e) {
      hideLoadingIndicator(context);

      if (e.code == 'weak-password') {
        showLongToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showLongToast('The account already exists for that email.');
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

  Future<Exercice> addExercice(Exercice exercice) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds =
          await transaction.get(exerciceCollection.doc());
      exercice.id = ds.id;
      transaction.set(exerciceCollection.doc(exercice.id), exercice.toMap());
      return exercice;
    });
  }

  Future<QuerySnapshot> getExercices() async {
    return exerciceCollection.get();
  }

  Future<Exercice> updateExercice(Exercice exercice) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(exerciceCollection.doc(exercice.id), exercice.toMap());
      return exercice;
    });
  }

  //#endregion

  //#region Mesure Functions

  Future<Mesure> addMesure(Mesure mesure) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction.get(mesureCollection.doc());
      mesure.id = ds.id;
      transaction.set(exerciceCollection.doc(mesure.id), mesure.toMap());
      return mesure;
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

//#endregion



  //#region RM Functions

  Future<RM> addRM(RM rm) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds = await transaction.get(rmCollection.doc());
      rm.id = ds.id;
      transaction.set(rmCollection.doc(rm.id), rm.toMap());
      return rm;
    });
  }

  Future<QuerySnapshot> getRMs() async {
    return rmCollection.get();
  }

  Future<RM> updateRM(RM rm) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(rmCollection.doc(rm.id), rm.toMap());
      return rm;
    });
  }

//#endregion

  //#region Objectif Functions

  Future<Objectif> addObjectif(Objectif objectif) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds =
          await transaction.get(objectifCollection.doc());
      objectif.id = ds.id;
      transaction.set(objectifCollection.doc(objectif.id), objectif.toMap());
      return objectif;
    });
  }

  Future<QuerySnapshot> getObjectifs() async {
    return objectifCollection.get();
  }

  Future<Objectif> updateObjectif(Objectif objectif) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(objectifCollection.doc(objectif.id), objectif.toMap());
      return objectif;
    });
  }

  //#endregion

  //#region SuivieNutritionnel Functions

  Future<SuivieNutritionnel> addSuivieNutritionnel(
      SuivieNutritionnel suivieNutritionnel) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot ds =
          await transaction.get(suivieNutritionnelCollection.doc());
      suivieNutritionnel.id = ds.id;
      transaction.set(suivieNutritionnelCollection.doc(suivieNutritionnel.id),
          suivieNutritionnel.toMap());
      return suivieNutritionnel;
    });
  }

  Future<QuerySnapshot> getSuivieNutritionnels() async {
    return suivieNutritionnelCollection.get();
  }

  Future<SuivieNutritionnel> updateSuivieNutritionnel(
      SuivieNutritionnel suivieNutritionnel) {
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
          suivieNutritionnelCollection.doc(suivieNutritionnel.id),
          suivieNutritionnel.toMap());
      return suivieNutritionnel;
    });
  }

//#endregion

//#region Users Functions

  Future<QuerySnapshot> getUsers() async {
    return userCollection.get();
  }

  Future<QuerySnapshot> getUsersSubscribed() async {
    return userCollection.where("isSubscribed",isEqualTo: true).get();
  }
  Future<QuerySnapshot> getUsersUnSubscribed() async {
    return userCollection.where("isSubscribed",isEqualTo: false).get();
  }


  Future<Adherant?> getUserFromId({required String? id}) async {
    final DocumentSnapshot documentSnapshot =
    (await userCollection.doc(id).get());
    if (documentSnapshot.data == null) return null;
    return Adherant.fromMap(documentSnapshot.data());
  }


//#endregion

}
