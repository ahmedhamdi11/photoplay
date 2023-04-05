import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';

abstract class Styles {
  static TextStyle text11 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 11);
  static TextStyle text12b =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 12);
  static TextStyle text12m =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 12);

  static TextStyle text14b =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
  static TextStyle text14m =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 14);

  static TextStyle text15 = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15,
    color: Color(0xffBFBFBF),
  );
  static TextStyle text16 = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 16, color: kPrimatyColor);

  static TextStyle text17 = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 17,
    color: Color(0xffA2A2A2),
  );
}
