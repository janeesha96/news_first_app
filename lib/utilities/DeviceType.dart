import 'package:flutter/foundation.dart';

enum Device {
  Mobile,
  Tab
}

class DeviceType{
  double width;
  DeviceType({required this.width});
  Device getType(){
    if(width >= 600){
      return Device.Tab;
    }else{
      return Device.Mobile;
    }
  }
}