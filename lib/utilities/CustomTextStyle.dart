import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'AppColors.dart';
import 'DeviceType.dart';
import 'HexColor.dart';


class CustomTextStyle {
  late BuildContext context;
  late Device _device;

  CustomTextStyle( this.context){
    _device = DeviceType(width: MediaQuery.of(context).size.width).getType();
  }

  TextStyle headline() {
    return Theme.of(context).textTheme.headline5!.copyWith(
      color: Colors.white,
      fontSize: _device  == Device.Mobile ? 25 : 40,
      fontFamily: 'Nunito-Black',
    );
  }

  TextStyle subhead() {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
        color: Colors.white,
        fontSize: _device  == Device.Mobile ? 15 : 30,
        fontFamily: 'Brandon_reg'
    );
  }

  TextStyle body1() {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
        color: Colors.white,
        fontSize: _device  == Device.Mobile ? 20 : 30,
        fontFamily: 'Nunito-Black'
    );
  }


  TextStyle body2() {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
        color: Colors.black,
        fontSize: _device  == Device.Mobile ? 15 : 25,
        fontFamily: 'Nunito-SemiBold'
    );
  }

  TextStyle body2Small() {
    return Theme.of(context).textTheme.bodyText2!.copyWith(
        color: Colors.white,
        fontSize: _device  == Device.Mobile ? 12.5 : 17,
        fontFamily: 'Nunito-Light'
    );
  }

  TextStyle title() {
    return Theme.of(context).textTheme.headline6!.copyWith(
        color: Colors.white,
        fontSize: _device  == Device.Mobile ? 12 : 25,
        fontFamily: 'Nunito-Black'
    );
  }

  TextStyle smallButton() {
    return Theme.of(context).textTheme.button!.copyWith(
      color: Colors.white,
      fontSize: _device  == Device.Mobile ? 15 : 25,
      fontFamily: 'Nunito-Black',
    );
  }

  TextStyle button() {
    return Theme.of(context).textTheme.button!.copyWith(
        color: Colors.white,
        fontSize: _device  == Device.Mobile ? 20 : 30,
        fontFamily: 'Nunito-Black',
    );
  }

  IconThemeData iconTheme(){
    return Theme.of(context).iconTheme.copyWith(
      color: HexColor(AppColors.colorAccent),
      size: _device  == Device.Mobile ? 30 : 60,
    );
  }

  IconThemeData accentIconTheme(){
    return Theme.of(context).accentIconTheme.copyWith(
      size:  _device  == Device.Mobile ? 35 : 65,
    );
  }

  double btnHoriPadding(){
    return _device == Device.Mobile ? 30 : 40;
  }

  double btnVertiPadding(){
    return _device == Device.Mobile ? 5 : 10;
  }

  double btnBorderRadious(){
    return _device == Device.Mobile ? 25 : 35;
  }

  

 

}