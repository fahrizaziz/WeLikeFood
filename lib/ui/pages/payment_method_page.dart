part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentURL;

  PaymentMethodPage(this.paymentURL);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFD84F),
      body: IllustrationPage(
        buttonTap1: () async {
          await launch(paymentURL);
        },
        buttonTittle1: 'Payment Method',
        picturePath: 'assets/payment.json',
        title: "Finish Your Payment",
        subtitle: "Please select your favourite\npayment method",
        buttonTap2: () {
          Get.to(SuccessOrderPage());
        },
        buttonTittle2: 'Continue',
      ),
    );
  }
}
