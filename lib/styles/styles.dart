import 'package:flutter/material.dart';

class Styles {
  static Color c1 = const Color(0xFFDDE6ED);
  static Color c2 = const Color(0xFF9DB2BF);
  static Color c3 = const Color.fromARGB(80, 0, 0, 0); // inactive text
  static Color c4 = const Color(0xFF000000); // active text

  // 0xFFDDE6ED
  // 0xFF9DB2BF

  // static Color c1 = const Color(0xFF0B2447);
  // static Color c2 = const Color(0xFF19376D);
  // static Color c3 = const Color(0xFF576CBC);
  // static Color c4 = const Color(0xFFA5D7E8);

  static TextStyle h5 = TextStyle(
    fontFamily: 'helvetica',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );

  static TextStyle h4 = TextStyle(
    fontFamily: 'helvetica',
    fontSize: 25,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );

  static TextStyle h3 = TextStyle(
    fontFamily: 'helvetica',
    fontSize: 30,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );

  static TextStyle h2 = TextStyle(
    fontFamily: 'helvetica',
    fontSize: 35,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );

  static TextStyle h1 = TextStyle(
    fontFamily: 'helvetica',
    fontSize: 40,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );

  static TextStyle p5 = TextStyle(
    fontFamily: 'Arial',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );
  static TextStyle p4 = TextStyle(
    fontFamily: 'Arial',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );
  static TextStyle p3 = TextStyle(
    fontFamily: 'Arial',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );
  static TextStyle p2 = TextStyle(
    fontFamily: 'Arial',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );
  static TextStyle p1 = TextStyle(
    fontFamily: 'Arial',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    color: c4,
  );

  static TextStyle tfts = Styles.p5.copyWith(
    color: Styles.c4.withAlpha(200),
    fontWeight: FontWeight.normal,
  );
  static InputDecoration id = InputDecoration(
    hintStyle: Styles.p5,
    labelStyle: p3.copyWith(
      color: p3.color!.withAlpha(150),
      fontWeight: FontWeight.normal,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Styles.c3),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Styles.c4.withAlpha(125),
      ),
    ),
  );

  static EdgeInsetsGeometry hpad = const EdgeInsets.symmetric(horizontal: 25);
  static EdgeInsetsGeometry vpad = const EdgeInsets.symmetric(vertical: 15);
  static ButtonStyle bstyle1 = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Styles.c3.withAlpha(125)),
    iconColor: WidgetStatePropertyAll(Styles.c4.withAlpha(125)),
    foregroundColor: WidgetStatePropertyAll(Styles.c4.withAlpha(125)),
  );
}
