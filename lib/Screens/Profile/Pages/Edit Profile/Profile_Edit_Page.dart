import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:secure_hops/Screens/Profile/components/changepass.dart';
import 'package:secure_hops/Widgets/AppBar.dart';
import 'package:secure_hops/Widgets/button.dart';
import 'package:secure_hops/Widgets/navigator.dart';
import 'package:secure_hops/constants.dart';
import 'package:secure_hops/model/loginResponseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String? email;

  InputBorder? focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  );

  @override
  void initState() {
    getuser().then((value) {
      email = value.email;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(context, title: 'Edit Profile'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[200],
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image.network(
                              demoAvatar,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 4, color: Colors.white),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF7D849A),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {},
                          )),
                    ],
                  ),
                ),
                box(),
                Text(
                  email.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter First Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "FIRST NAME",
                    ),
                    validator: (value) {}),
                box(),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter Last Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "LAST NAME",
                    ),
                    validator: (value) {}),
                box(),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: focusedBorder,
                      hintText: "Enter phone #",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "PHONE NUMBER",
                    ),
                    validator: (value) {}),
                box(),
                box(),
                MyButton(text: 'SAVE CHANGES', onPressed: () {}),
                box(),
                box(),
                MyButton(
                    text: 'CHANGE PASSWORD',
                    onPressed: () {
                      navigatorPush(context, false, ChangePass());
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget box() {
    return SizedBox(
      height: 25,
    );
  }

  Future<LoginResponseModel> getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString('Login').toString();
    var jsonMap = json.decode(res);
    return LoginResponseModel.fromJson(jsonMap);
  }
}
