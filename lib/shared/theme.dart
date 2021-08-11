part of 'shared.dart';

Color greyColor = "8D92A3".toColor();
Color mainColor = "FDD736".toColor();
Color blackColor = "020202".toColor();
Color yellowColor = "FFC700".toColor();
Color greenColor = "1ABC9C".toColor();
Color redColor = "D9435E".toColor();
Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);
TextStyle greyLightFontStyle = GoogleFonts.poppins()
    .copyWith(color: greyColor, fontWeight: FontWeight.w300);
TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackMediumFontStyle = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500);
TextStyle blackFontStyle = GoogleFonts.poppins().copyWith(color: blackColor);
TextStyle greenMediumFontStyle = GoogleFonts.poppins()
    .copyWith(color: greenColor, fontWeight: FontWeight.w500);
TextStyle redFontStyle =
    GoogleFonts.poppins().copyWith(color: redColor, fontSize: 10);
TextStyle greenFontStyle = GoogleFonts.poppins().copyWith(color: greenColor);
const double defaultMargin = 24;
