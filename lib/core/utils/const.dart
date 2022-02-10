import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color cPrimary = Color(0xff3355E9);
const Color cWhite = Colors.white;
const Color cBlack = Colors.black;
const Color cGrey = Colors.grey;

TextStyle get cardName {
  return GoogleFonts.poppins(
      fontSize: 18, color: cPrimary, fontWeight: FontWeight.bold);
}

TextStyle get cardPhone {
  return GoogleFonts.poppins(fontSize: 16, color: cPrimary);
}

TextStyle get nameProfile {
  return GoogleFonts.poppins(
      color: cPrimary, fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle get phoneProfie {
  return GoogleFonts.poppins(
      color: cPrimary, fontSize: 16, fontWeight: FontWeight.normal);
}
