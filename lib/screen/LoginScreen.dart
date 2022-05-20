import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newprojectbin/mainpage.dart';
import 'package:newprojectbin/utils/constants.dart';
import 'package:newprojectbin/makeid.dart';

import '../../components/login/IDInput.dart';
import '../../components/login/passwordInput.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  var _idTEC = TextEditingController();
  var _pwTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 24),
              ),
              IDInput(tec: _idTEC), //id 입력 컴포넌트
              PasswordInput(tec: _pwTEC), // pw 입력 컴포넌트
              //로그인 버튼
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 123),
                    child: ElevatedButton(
                      onPressed: () {
                        print(_idTEC.text + " " + _pwTEC.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Colors.deepPurple[400],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => makeid()),
                          );
                        },
                        child: Text('회원가입'),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black,
                      ),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

