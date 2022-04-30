import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              // bottom: height/2,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
                height: height * 0.5,
                // width: double.infinity,
              ),
            ),
            Positioned(
              top: 15,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
            Positioned(
                bottom: 0,
                // bottom: height/2,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                    color: Colors.amber,
                  ),
                  height: height * 0.5,
                  width: width,
                )),
            Center(

                // bottom: height/2,
                child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey,
                ),
                height: 100,
                width: width * 0.8,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
