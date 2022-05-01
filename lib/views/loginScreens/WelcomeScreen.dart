import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_first_app/utilities/SessionManager.dart';

import '../dashboard/home.dart';
import 'loginScreen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
    @override
  void initState() {
    SessionManager().getUser().then((value) {
              if (value) {

                Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
                
              } else {

                Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));

              }
            });
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator()
        ),
      ),
    );
  }
}