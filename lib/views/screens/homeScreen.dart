import 'package:firebase_flutter_practical_exam/helper_classes/helper_function_class.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? groups;

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await helperFunction.getUserLoggedinStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
        ],
        leading: Icon(Icons.menu),
        title: const Text(
          'My Chats',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
      ),
      body: groupList(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber.shade700,
        onPressed: popUpDialog(),
        label: const Text(
          'Add Friend',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        icon: Icon(Icons.add_box),
      ),
    );
  }

  popUpDialog() {}

  groupList() {
    return StreamBuilder(
      stream: groups,

    );
  }
}
