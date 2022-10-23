import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

Color purpleColor = Color(0xff5843BE);
Color orangeColor = Color(0xffFF9376);
Color blackColor = Color(0xff000000);
Color redColor = Color.fromARGB(255, 213, 49, 49);
Color blueColor = Color.fromARGB(255, 83, 198, 221);
Color whiteColor = Color.fromARGB(255, 255, 255, 255);
Color greyColor = Color(0xff82868E);
Color softpurpleColor = Color(0xff9FAEFB);

double edge = 24;

TextStyle regularTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  color: blackColor,
);
TextStyle regularTextStyle3 = GoogleFonts.roboto(
    fontWeight: FontWeight.bold, color: blackColor, fontSize: 16);
TextStyle regularTextStyle4 = GoogleFonts.roboto(
    color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle regularTextStyle5 = GoogleFonts.roboto(
    color: redColor, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle regularTextStyle6 = GoogleFonts.aclonica(
  color: blueColor,
  fontSize: 18,
);
TextStyle regularTextStyle7 = GoogleFonts.roboto(
    fontWeight: FontWeight.bold, color: blackColor, fontSize: 25);
TextStyle regularTextStyle8 = GoogleFonts.roboto(
    color: whiteColor, fontSize: 25, fontWeight: FontWeight.bold);
TextStyle regularTextStyle2 =
    GoogleFonts.roboto(color: greyColor, fontSize: 15);

TextStyle orangeTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  color: orangeColor,
);

TextStyle softpurpleColorTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  color: softpurpleColor,
);

TextStyle blackTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w300,
  color: greyColor,
);

TextStyle purpleTextStyle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  color: purpleColor,
);
