import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');

  // setting the userdata
  Future<void> setUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      'fullName': fullName,
      'email': email,
      'groups': [],
      'profilePic': '',
      'uid': uid,
    });
  }

  // getting the user data
  Future<QuerySnapshot<Object?>> getUserData(String email) async {
    return await userCollection.where('email', isEqualTo: email).get();
  }
}
