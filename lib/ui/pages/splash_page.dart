part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInPage())));
  }

  // startSplashScreen() {
  //   var duration = const Duration(seconds: 3);
  //   return Timer(duration, () {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) {
  //         return SignInPage();
  //       }),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFD84F),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 200),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
