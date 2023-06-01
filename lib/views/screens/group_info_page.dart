import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupInfoScreen extends StatefulWidget {
  final String admin;
  final String GroupName;
  final String GroupId;

  const GroupInfoScreen(
      {Key? key,
      required this.GroupId,
      required this.GroupName,
      required this.admin})
      : super(key: key);

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.admin),
      ),
    );
  }
}
