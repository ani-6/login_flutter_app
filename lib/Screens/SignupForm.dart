import 'package:flutter/material.dart';
import 'package:login_flutter/Screens/LoginForm.dart';
import 'package:login_flutter/common/comHelper.dart';
import 'package:login_flutter/common/genLoginSignupHeader.dart';
import 'package:toast/toast.dart';
import '../common/genTextFormField.dart';
import '../DatabaseHandler/DbHelper.dart';
import '../Model/UserModel.dart';

class SignupForm extends StatefulWidget {
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();
  final _conUserId = TextEditingController();
  final _conUsername = TextEditingController();
  final _conPassword = TextEditingController();
  final _conConfirmPassword = TextEditingController();
  final _conEmail = TextEditingController();

  signup() async {
    String uid = _conUserId.text;
    String uname = _conUsername.text;
    String email = _conEmail.text;
    String passwd = _conPassword.text;
    String cpasswd = _conConfirmPassword.text;

    if (_formKey.currentState!.validate()) {
      if (passwd != cpasswd) {
        alartDialog(context, 'Password Mismatch');
      } else {
        _formKey.currentState!.save();

        UserModel uModel = UserModel(uid, uname, email, passwd);
        await DbHelper.saveData(uModel).then((userData) {
          alartDialog(context, "Successfully Saved");

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginForm()));
        }).catchError((error) {
          print(error);
          alartDialog(context, "Error: Data Save Fail");
        });
      }
    }

    if (uid.isEmpty) {
      alartDialog(context, "Please Enter UserID");
    } else if (uname.isEmpty) {
      alartDialog(context, "Please Enter User Name");
    } else if (email.isEmpty) {
      alartDialog(context, "Please Enter Email");
    } else if (passwd.isEmpty) {
      alartDialog(context, "Please Enter Password");
    } else if (cpasswd.isEmpty) {
      alartDialog(context, "Please Comfirm Password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ashoka\'s App'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLoginSignupHeader('Signup'),
                  getTextFormField(
                    controller: _conUserId,
                    icon: Icons.person,
                    hintName: 'User Id',
                    isobscureText: false,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  getTextFormField(
                    controller: _conUsername,
                    icon: Icons.key,
                    inputType: TextInputType.name,
                    hintName: 'User Name',
                    isobscureText: true,
                  ),
                  getTextFormField(
                    controller: _conEmail,
                    icon: Icons.email,
                    inputType: TextInputType.emailAddress,
                    hintName: 'Email',
                    isobscureText: false,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  getTextFormField(
                    controller: _conPassword,
                    icon: Icons.key,
                    hintName: 'Password',
                    isobscureText: true,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  getTextFormField(
                    controller: _conConfirmPassword,
                    icon: Icons.key,
                    hintName: 'Confirm Password',
                    isobscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    height: 40.0,
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: signup(),
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
                        Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                                (Route<dynamic> rout) => false);
                          },
                          style: TextButton.styleFrom(
                            primary: Colors.blueGrey, // Text Color
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
