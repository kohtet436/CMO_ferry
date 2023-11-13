import 'package:flutter/material.dart';


class ColorManager {
  static Color textFieldGrey = HexColor.fromHex('#d9d9d9');
  static Color primaryColor = HexColor.fromHex('#F7941D');
  static Color primaryDarkColor = HexColor.fromHex('#ec7a19');
  static Color primaryLightColor = HexColor.fromHex('#fbca84');
  static Color secondaryColor = HexColor.fromHex('#592C8A');
  static Color secondaryDarkColor = HexColor.fromHex('#3d2378');
  static Color secondaryLightColor = HexColor.fromHex('#9853b2');
  static Color tertiaryColor = HexColor.fromHex('#30E368');
  static Color textOnPrimary = HexColor.fromHex('#ffffff');
  static Color textColorVariant = HexColor.fromHex('#A2A2A2');
  static Color cardColor = HexColor.fromHex('#F7941D').withOpacity(0.09);
  static Color darkGrey = HexColor.fromHex("#584E4F");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34"); // red color
  static Color black = HexColor.fromHex("#000000"); // black color
  static Color defaultLightBackground = HexColor.fromHex("#fffafafa");
  static Color containerBackground=const Color.fromRGBO(217, 217, 217, 1);  
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

