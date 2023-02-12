import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signup_or_login_with_api/Home_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUp (String email, String password)async{
    try{
      http.Response response = await http.post(Uri.parse('https://reqres.in/api/login'),
          body:{
            'email': email,
            'password': password,
          }
      );
      if (response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
      }
      else{
        print("Login failed.");
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.purple.shade50,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Center(child: Text("Login", style: TextStyle(fontSize: 30),),),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefix: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefix: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    signUp(emailController.text.toString(), passwordController.text.toString(),);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    height: 50,
                    width: double.infinity,
                    child: const Center(child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
