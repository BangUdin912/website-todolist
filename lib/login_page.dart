import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todolist_kegiatan_kampus/colors.dart';
import 'package:todolist_kegiatan_kampus/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _pass = "";
  String _errorMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBlue,
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
                child: Container(
                    height: 250,
                    width: 250,
                    padding: EdgeInsets.only(top: 40),
                    child: Image.network(
                      'assets/images/todolist.jpg',
                      height: 250,
                      width: 250,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Masukkan Email',
              ),
              onChanged: (Text) {
                _email = Text;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Masukkan Password',
              ),
              onChanged: (Text) {
                _pass = Text;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: tdBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (_email == "bangudin@gmail.com" && _pass == "12345") {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  } else {
                    _errorMessage = "Email / Password Salah!";
                  }
                });
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
