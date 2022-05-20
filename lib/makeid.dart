import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newprojectbin/components/makeid/make_id.dart';
import 'package:newprojectbin/components/makeid/make_name.dart';
import 'package:newprojectbin/components/makeid/make_password.dart';
import 'package:newprojectbin/components/makeid/make_passwordcheck.dart';
import 'package:newprojectbin/screen/LoginScreen.dart';
import 'postclass.dart';

class makeid extends StatefulWidget {
  const makeid({Key? key}) : super(key: key);

  @override
  State<makeid> createState() => _makeidState();
}

// postdata() async{
//   final response = await http.post(Uri.parse("http://107.21.122.192:8000/api/users"),);
//   if(response.statusCode == 200){
//     print('성공');
//     return User.fromJson(json.decode(response.body));
//   }
//   else{
//     print("failed to post");
//   }
// }
Future postdata(User user) async{
  print(user.toJson());
  var url = Uri.parse("http://107.21.122.192:8000/api/users/");
  var response = await http.post(url,body: jsonEncode(user.toJson()),headers:{"Content-Type": "application/json"},);
  print(response.statusCode);
  print(response.body);
}
final url = "http://107.21.122.192:8000/api/users/";
getdata() async{
  final response = await http.get(Uri.parse(url));
  final jsondata = jsonDecode(response.body);
  print(jsondata);
  print(response.body);

}

class _makeidState extends State<makeid> {
  var _makeidTEC = TextEditingController();
  var _makepasswordTEC = TextEditingController();
  var _makepwcheckTEC = TextEditingController();
  var _makenameTEC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 150, 60, 100),
          child: Column(
            children: [
              Text('회원가입',
                  style: TextStyle(fontSize: 25)),
              make_id(tec: _makeidTEC),
              make_password(tec: _makepasswordTEC),
              make_passwordcheck(tec: _makepwcheckTEC),
              make_name(tec: _makenameTEC),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:125,top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        postdata(User(_makeidTEC.text, _makepasswordTEC.text, _makenameTEC.text));
                        // getdata();
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>LoginScreen())
                        );
                      },
                      child: Text('가입'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Colors.deepPurple[400],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
      ),
    );

  }
}
