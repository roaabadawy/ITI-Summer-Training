import 'package:flutter/cupertino.dart';
import 'package:flutter_first/models/user_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_first/services/user_service.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<UserModel> user = [];
  bool isloading = true;

  getuser() async {
    user = await UserService().getUsers();
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getuser();
  }


  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(
      child: CircularProgressIndicator(),
    )
        : ListView.builder(
      itemCount: user.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(user[index].name ?? '--'),
          subtitle: Text(user[index].email ?? '--'),
          trailing: Icon(Icons.person),
          leading: Text("${index + 1}"),
        );
      },
    );
  }
}
