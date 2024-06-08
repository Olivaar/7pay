import 'package:flutter/material.dart';
import 'colors.dart';


class ThemeHelper{

  InputDecoration textInputDecoration([String lableText="", String hintText = "", Color fillColor = Colors.white,]){
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      fillColor: fillColor,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.black)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.black)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: cinzaEscuro, width: 2.0)),

    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(30, 30)),
      maximumSize: MaterialStateProperty.all(const Size(120, 30)),
      backgroundColor: MaterialStateProperty.all(cinzaEscuro),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white
      )),
    );
  }

  TextStyle textStyleBold35() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 35,
      fontFamily: 'Scorno'
    );
  }

  TextStyle textStyleBlackBold() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  }

  TextStyle textStyleStandard() {
    return const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
  }

  TextStyle textStyleOrange() {
    return const TextStyle(
      color: laranja,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    );
  }

  TextStyle textStyleWhite() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  }

  Decoration containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: const [ BoxShadow(
        color: cinzaClaro,
        blurRadius: 10
      ),],
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: cinzaEscuro),
    );
  }

}

