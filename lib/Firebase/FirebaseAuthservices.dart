import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthservices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
      } else {
      }
    }
    return null;

  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      } else {
      }

    }
    return null;

  }
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  bool isUserSignedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser != null;
  }

  Future<String?> getUsername() async {
    User? user = _auth.currentUser;
    String? email = user?.email;
    String? username;
    final docRef = _db.collection("users").doc(email);

    final dataSnapshot = await docRef.get();

    print(dataSnapshot.data);
    if (dataSnapshot.data != null) {
      var data = dataSnapshot.data() as Map<String, dynamic>;
      var usern = data["username"];
      username = usern;
    } else {
      print("Data snapshot is null.");
    }

    print('username: $username');
    return username;
  }



}