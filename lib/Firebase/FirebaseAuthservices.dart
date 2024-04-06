import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthservices{
  FirebaseAuth _auth = FirebaseAuth.instance;

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
  Future<void> Signout() async {
    await FirebaseAuth.instance.signOut();
  }

  bool isUserSignedIn() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser != null;
  }

}