import 'package:flutter/material.dart';

class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Image.asset(
            "assets/images/logo.jpg",
            height: 170.0,
            width: 170.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Welcome to Hub 2.0',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
