import 'package:flutter/material.dart';
import 'package:login_flutter/Screens/SignupForm.dart';
import 'package:login_flutter/common/genTextFormField.dart';
import 'package:login_flutter/common/genLoginSignupHeader.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _conUsername = TextEditingController();
  final _conPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ashoka\'s App')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Login'),
                getTextFormField(
                  controller: _conUsername,
                  icon: Icons.person,
                  hintName: 'User Name',
                  isobscureText: false,
                ),
                getTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Password',
                  isobscureText: true,
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  height: 40.0,
                  width: double.infinity,
                  child: TextButton(
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New user?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignupForm()));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.blueGrey, // Text Color
                        ),
                        child: const Text(
                          'Signup here',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
