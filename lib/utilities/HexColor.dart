
import 'dart:ui';

class HexColor extends Color{

  HexColor(String value) : super(getColorFromHex(value));

   static int getColorFromHex(String hexColor) {
     if(hexColor[0]!='#'){
       hexColor = '#ffffff';
     }
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

}