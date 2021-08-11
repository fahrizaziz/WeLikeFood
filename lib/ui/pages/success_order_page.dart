part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFD84F),
      body: IllustrationPage(
        buttonTap1: () {
          Get.offAll(MainPage());
        },
        buttonTittle1: 'Order Other Foods',
        picturePath: 'assets/success_order.json',
        subtitle: 'Just stay at home while we are\npreparing your best foods',
        title: 'You’ve Made Order',
        buttonTap2: () {
          Get.offAll(MainPage(
            initialPage: 1,
          ));
        },
        buttonTittle2: 'View My Order',
      ),
    );
  }
}
