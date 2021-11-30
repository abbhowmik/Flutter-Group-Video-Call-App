import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseServices {
  Future addUserInfo(String email, userInfoMap) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .set(userInfoMap)
        .catchError((e) =>
            print("addUserInfo Error is ------------>>> ${e.toString()}"));
  }
}
