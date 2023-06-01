import 'package:firebase_flutter_practical_exam/views/screens/chapScreen.dart';
import 'package:flutter/material.dart';

class GroupTile extends StatefulWidget {
  final String username;
  final String GroupName;
  final String GroupId;

  const GroupTile(
      {Key? key,
      required this.GroupId,
      required this.GroupName,
      required this.username})
      : super(key: key);

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatScreen(
              GroupId: widget.GroupId,
              GroupName: widget.GroupName,
              username: widget.username,
            ),
          ));
        },
        child: Card(
          color: Colors.orange.shade100,
          elevation: 5,
          child: ListTile(
            isThreeLine: true,
            title: Text(
              widget.GroupName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.amber.shade900,
                  size: 26,
                ),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Join for Conversation with Samarth Movaliya',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('ID :${widget.GroupId}'),
              ],
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.amber,
              child: Text(
                widget.GroupName.substring(0, 1).toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
