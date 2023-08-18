import 'package:flutter/material.dart';
import 'package:questionabout/auth.dart';
import 'package:questionabout/pages/homePage.dart';
import 'package:questionabout/pages/loginPage.dart';


class WidgetTreePage extends StatefulWidget {
  const WidgetTreePage({super.key});

  @override
  State<WidgetTreePage> createState() => _WidgetTreePageState();
}

class _WidgetTreePageState extends State<WidgetTreePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context,snapshot){
     if(snapshot.hasData){
         return HomePage();
     }else{
      return LoginPage();
     }

    });
  }
}