import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_first_app/utilities/widgets/Button.dart';
import 'package:news_first_app/views/dashboard/home.dart';

import '../../utilities/AppColors.dart';
import '../../utilities/CustomTextStyle.dart';
import '../../utilities/DeviceType.dart';
import '../../utilities/HexColor.dart';
import 'userRegistraionScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loaderVisible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool validEmail = false, validPass = false;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var textViewHeight = DeviceType(width: width).getType() == Device.Mobile
        ? width * 0.16
        : width * 0.1;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
                padding: EdgeInsets.all(height * .05),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fitHeight,
                          height: height * 0.15,
                          width: double.infinity,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: textViewHeight,
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, top: 20),
                            child: TextFormField(
                              autofocus: false,
                              autofillHints: const [AutofillHints.email],
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: "Enter Email...",
                                errorText: validateEmail(email),
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              onChanged: (value) {
                                email = value.trim();
                                if (validateEmail(email) == '') {
                                  setState(() {
                                    validEmail = true;
                                  });
                                } else {
                                  setState(() {
                                    validEmail = false;
                                  });
                                }
                              },
                              style: CustomTextStyle(context)
                                  .body2Small()
                                  .copyWith(
                                    color: HexColor(AppColors.primaryColor),
                                  ),
                            ),
                          ),
                          Container(
                            height: textViewHeight,
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, top: 20, bottom: 30),
                            child: TextFormField(
                              autofillHints: const [AutofillHints.password],
                              autofocus: false,
                              decoration: InputDecoration(
                                focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: "Enter password...",
                                errorText: validatePassword(password),
                                errorStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              obscureText: true,
                              onChanged: (value) {
                                password = value.trim();
                                if (validatePassword(value) == '') {
                                  setState(() {
                                    validPass = true;
                                  });
                                } else {
                                  setState(() {
                                    validPass = false;
                                  });
                                }
                              },
                              style: CustomTextStyle(context)
                                  .body2Small()
                                  .copyWith(
                                    color: HexColor(AppColors.primaryColor),
                                  ),
                            ),
                          ),
                          Button(
                            name: '  Sign In  ',
                            itemClick: validateFields()
                                ? () {
                                    login();
                                  }
                                : null,
                            textStyle: null,
                          ),
                          SizedBox(
                            height: width * 0.14,
                          ),
                          Container(
                            height: 2,
                            width: double.maxFinite,
                            color: Colors.grey[300],
                            margin: const EdgeInsets.only(top: 40, bottom: 40),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Don’t Have an Account?',
                                  style: CustomTextStyle(context)
                                      .title()
                                      .copyWith(
                                          color:
                                              HexColor(AppColors.primaryColor)),
                                ),
                                Text(
                                  '  Sign Up',
                                  style: CustomTextStyle(context)
                                      .title()
                                      .copyWith(
                                          color: HexColor(AppColors.mainColor)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: width * 0.09,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget progressView(bool show) {
    if (loaderVisible) {
      return const CircularProgressIndicator();
    } else {
      return Container();
    }
  }

  bool validateFields() {
    return (validPass && validEmail);
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Provide an Email';
    } else {
      return '';
    }
  }

  String validatePassword(String text) {
    if (text.isEmpty) {
      return 'Provide a password';
    } else if (text.length < 7) {
      return 'Invalid Password';
    } else {
      return '';
    }
  }

  login() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
  }
}
