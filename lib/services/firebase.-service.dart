import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/models/app-user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  final Rx<User> _user = Rx<User>();
  String? get userId => _user.value?.uid;
  Future<AppUser?> get $appUser => getUserFromId(id: userId);
  AppUser? appUser;
  final usersCollection = FirebaseFirestore.instance.collection("users");

  @override
  void onInit() {
    // TODO: implement onInit

    _user.bindStream(_auth.authStateChanges());

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


  Future<AppUser?> login({required String email,required String password}) async {
      final authResult = (await _auth.signInWithEmailAndPassword(
          email: email, password: password));
      User? user = authResult.user;
      if (user != null) {
        final AppUser? currentUser = (await getUserFromId(id: user.uid));
        this.appUser=currentUser;

        return currentUser;
      }
      return null;
  }

  Future<AppUser?> register(String email, String password, String firstName,
      String lastName, String phone) async {
    try {
      final UserCredential result = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password));
      AppUser? user = new AppUser(
          email: email,
          phone: phone,
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

  Future<void> setNewUser(AppUser user) async {
    await usersCollection.doc(user.userId).set(user.toMap());
  }

  Future<AppUser?> getUserFromId({required String? id}) async {
    final DocumentSnapshot documentSnapshot =
        (await usersCollection.doc(id).get());
    if (documentSnapshot.data == null) return null;
    return AppUser.fromMap(documentSnapshot.data());
  }

  Future<void> logout() async {
    return _auth.signOut();
  }
}
