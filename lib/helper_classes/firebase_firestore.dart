import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;

  DatabaseServices({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  Future updateUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      'name': fullName,
      'email': email,
      'groups': [],
      'uid': uid,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  getUserGroups() async {
    return userCollection.doc(uid).snapshots();
  }

  cretaingGroup(String username, String id, String groupname) async {
    DocumentReference documentReference = await groupCollection.add({
      'groupName': groupname,
      'groupIcon': "",
      'admin': '${id}_$username',
      'members': [],
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender': '',
    });

    documentReference.update({
      'members': FieldValue.arrayUnion(["${uid}_$username"]),
      'groupId': documentReference.id,
    });

    DocumentReference userDocumentReferencs = userCollection.doc(uid);
    return userDocumentReferencs.update({
      'groups': FieldValue.arrayUnion(["${documentReference.id}_$groupname"])
    });
  }

  getChats(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }

  Future getGroupAdmin(String groupId) async {
    DocumentReference documentReference = groupCollection.doc(groupId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    print('-----------------');
    print(documentSnapshot['admin']);
    print('-----------------');
    return documentSnapshot['admin'];
  }
}
