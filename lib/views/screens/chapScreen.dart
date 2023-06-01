import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_practical_exam/helper_classes/firebase_firestore.dart';
import 'package:flutter/material.dart';

import 'group_info_page.dart';

class ChatScreen extends StatefulWidget {
  final String username;
  final String GroupName;
  final String GroupId;

  const ChatScreen(
      {Key? key,
      required this.GroupId,
      required this.GroupName,
      required this.username})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Stream<QuerySnapshot>? myChats;
  String admin = '';

  @override
  void initState() {
    super.initState();
    getChatandAdmin();
  }

  getChatandAdmin() {
    DatabaseServices().getChats(widget.GroupId).then((val) {
      myChats = val;
    });
    DatabaseServices().getGroupAdmin(widget.GroupId).then((value) {
      admin = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.orange.shade200,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GroupInfoScreen(
                  GroupId: widget.GroupId,
                  GroupName: widget.GroupName,
                  admin: admin,
                ),
              ));
            },
            child: const Icon(Icons.info_outline),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: Text(
          widget.GroupName,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
      ),
    );
  }
}
