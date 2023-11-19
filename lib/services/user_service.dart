import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//acesso ao banco

class UserService {
  final _userFirestore = FirebaseFirestore.instance.collection('user');

  createUser() async {
    try {
      await _userFirestore.doc().set({
        'nameteste': 'nameteste'
        // 'name': user['name'],
        // 'email': user['email'],
        // 'password': user['password'],
        // 'date': user['date'],
        // 'about_me': user['about_me'],
        // 'education': user['education'],
        // 'profession': user['profession'],
      });
    } on FirebaseException catch (error) {
      print(error.message);
    }
  }

  // deleteuser(String iduser) async {
  //   await _userFirestore.doc(iduser).delete();
  // }
}
