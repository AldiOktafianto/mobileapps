import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth;
  AuthServices(this._firebaseAuth);

  Future<bool> logIn({ String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.message ?? "Unknow error");
      return false;
    }
  }

  Future<bool> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.message ?? "Unknow error");
      return false;
    }
  }
}