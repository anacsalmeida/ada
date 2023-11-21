import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//acesso ao banco

class UserService {
  final _userFirestore = FirebaseFirestore.instance.collection('user');
  final _authFibase = FirebaseAuth.instance;

  createUser(dynamic user) async {
    try {
      await _userFirestore.doc().set({
        'name': user['name'],
        'email': user['email'],
        'password': user['password'],
        'date': user['date'],
        'about_me': user['about_me'],
        'education': user['education'],
        'profession': user['profession'],
      });
    } on FirebaseException catch (error) {
      print(error.message);
    }
  }

  dynamic login(String email, String password) async {
    try {
      UserCredential credential = await _authFibase.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      var userLoggad = user?.uid;
      DocumentSnapshot documentSnapshot =
          await _userFirestore.doc(userLoggad).get();
      var userData = documentSnapshot.data();
      return userData;
    } on FirebaseAuthException catch (e) {
      return e;
    }
  }

  // deleteuser(String iduser) async {
  //   await _userFirestore.doc(iduser).delete();
  // }
}
