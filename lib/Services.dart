import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
//Adds data to firestore with a document name as FullName

  Future<void> addData(parsedUserData, documentName) async {
    return FirebaseFirestore.instance
        .collection("UserFormData")
        .doc(documentName)
        .set(parsedUserData);
    //.add(parsedUserData);
  }
}
