part of 'pages.dart';

class SuccesSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFD84F),
      body: IllustrationPage(
        buttonTap1: () {
          Get.to(MainPage());
        },
        buttonTittle1: 'Find Foods',
        picturePath: 'assets/signup_success.json',
        subtitle: 'Now you are able to order\nsome foods as a self-reward',
        title: 'Yeay! Completed',
      ),
    );
  }
}
