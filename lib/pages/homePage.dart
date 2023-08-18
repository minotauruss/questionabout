
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:questionabout/auth.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  Future<void> singOut() async {
    await Auth().singOut();
  }

  Widget _title() {
    return Text("flutter auth");
  }

  Widget _userUid() {
    return Text(user?.email ?? "email");
  }

  Widget singOutButton() {
    return ElevatedButton(onPressed: singOut, child: Text("Sing Out"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_userUid(), _title(),singOutButton()],
        ),
      ),
    );
  }
}
