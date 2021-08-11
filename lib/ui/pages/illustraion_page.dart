part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTittle1;
  final String buttonTittle2;
  final Function buttonTap1;
  final Function buttonTap2;

  IllustrationPage(
      {@required this.buttonTap1,
      this.buttonTap2,
      @required this.buttonTittle1,
      this.buttonTittle2,
      @required this.picturePath,
      @required this.subtitle,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(picturePath, height: 300),
          Text(
            title,
            style: blackFontStyle.copyWith(fontSize: 20),
          ),
          Text(
            subtitle,
            style: greyLightFontStyle,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: buttonTap1,
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  primary: Color(0xffFFC700),
                  side: BorderSide(color: Color(0xffFCF9F9), width: 3),
                  shadowColor: Color(0x40000000)),
              child: Text(
                buttonTittle1,
                style: blackMediumFontStyle,
              ),
            ),
          ),
          (buttonTap2 == null)
              ? SizedBox()
              : SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: buttonTap2,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        primary: greyColor,
                        side: BorderSide(color: Color(0xffFCF9F9), width: 3),
                        shadowColor: Color(0x40000000)),
                    child: Text(
                      buttonTittle2 ?? 'title',
                      style: blackMediumFontStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
