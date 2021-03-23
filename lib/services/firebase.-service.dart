import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coachini/models/adherant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FirebaseService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<User> _user = Rx<User>();

  String? get userId => _user.value?.uid;

  // Future<Adherant?> get $user => getUserFromId(id: userId);
  Adherant? user;
  final usersCollection = FirebaseFirestore.instance.collection("users");

  @override
  void onInit() {
    // TODO: implement onInit

    _user.bindStream(_auth.authStateChanges());
    _user.listen((user) async {
      this.user = user == null ? null :  await getUserFromId(id: user.uid);
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
    await usersCollection.doc(user.id).set(user.toMap());
  }

  Future<Adherant?> getUserFromId({required String? id}) async {
    final DocumentSnapshot documentSnapshot =
        (await usersCollection.doc(id).get());
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
}
