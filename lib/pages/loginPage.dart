import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:questionabout/auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = "";
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> singhInWithEmailAndPassword() async {
    try {
      await Auth().singInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  //

  Future<void> createWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return Text("Login Page");
  }

  Widget _textForm(String text, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: text),
    );
  }

  Widget _errorMessage(){
    return Text(errorMessage?? "");
  }

  Widget _submitButton(){
    return ElevatedButton(onPressed: isLogin ? singhInWithEmailAndPassword : createWithEmailAndPassword, child: Text(isLogin? "login":"register"));

 }

  
 Widget _loginOrRegister(){

  return TextButton(onPressed: (){
    setState(() {
      isLogin = !isLogin;
    });
  }, child: Text(isLogin?"register":"login"));
  
} 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textForm("email", _controllerEmail),
              _textForm("password", _controllerPassword),
              _errorMessage(),
              _submitButton(),
              _loginOrRegister(),
             
      
      
            ],
          ),
        ),
      ),
    );
  }
}
