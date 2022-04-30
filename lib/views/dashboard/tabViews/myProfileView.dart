import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/widgets/Button.dart';
import '../../loginScreens/loginScreen.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
                height: height * 0.3,
                // width: double.infinity,
              ),
              const SizedBox(
                height: 25,
              ),
              Button(
                name: '  Sign Out  ',
                itemClick: () {
                  logOut();
                },
                textStyle: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  logOut() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
