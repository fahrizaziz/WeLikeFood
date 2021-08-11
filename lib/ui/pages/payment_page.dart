part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;
  final Widget child;

  PaymentPage({this.transaction, this.child});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'You deserve better meal',
      onBackButtonPressed: () {},
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Ordered',
                  style: blackFontStyle,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.transaction.food.picturePath),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 189,
                              // 2 * defaultMargin -
                              // 60 -
                              // 12 -
                              // 78
                              child: Text(
                                widget.transaction.food.name,
                                style: blackFontStyle.copyWith(fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'id-ID',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(widget.transaction.food.price),
                              style: greyFontStyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        // Text(transaction.food.total),
                      ],
                    ),
                    Text(
                      '${widget.transaction.quantity} items',
                      style: greyFontStyle.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Details Transaction',
                    style: blackFontStyle,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin,
                        child: Text(
                          widget.transaction.food.name,
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.transaction.total),
                          style: blackFontStyle,
                          textAlign: TextAlign.right),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Driver',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(50000),
                          style: blackFontStyle,
                          textAlign: TextAlign.right),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Tax 10%',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.transaction.total * 0.1),
                          style: blackFontStyle,
                          textAlign: TextAlign.right),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Total Price',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                          NumberFormat.currency(
                                  locale: 'id-ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(widget.transaction.total * 1.1 + 50000),
                          style: greenMediumFontStyle,
                          textAlign: TextAlign.right),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 28,
            width: double.infinity,
            color: "FFD84F".toColor(),
          ),
          widget.child ?? SizedBox(),
          // Note Bagian Deliver to
          Container(
            margin: EdgeInsets.only(bottom: 16),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to:',
                  style: blackFontStyle,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 80,
                        child: Text(
                          'Name',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            80,
                        child: Text(
                          widget.transaction.user.name,
                          style: blackFontStyle,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone No.',
                      style: greyFontStyle,
                    ),
                    Text(
                      widget.transaction.user.phoneNumber,
                      style: blackFontStyle,
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 80,
                        child: Text(
                          'Address',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            80,
                        child: Text(
                          widget.transaction.user.address,
                          style: blackFontStyle,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'House No.',
                      style: greyFontStyle,
                    ),
                    Text(
                      widget.transaction.user.houseNumber,
                      style: blackFontStyle,
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'City',
                      style: greyFontStyle,
                    ),
                    Text(
                      widget.transaction.user.city,
                      style: blackFontStyle,
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: defaultMargin,
            width: double.infinity,
            color: "FFD84F".toColor(),
          ),

          widget.child ?? SizedBox(),
          // Note Button
          (isLoading)
              ? Container(
                  color: Color(0xffFFD84F),
                  child: Center(
                    child: SpinKitFadingCircle(
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(
                  color: mainColor,
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          setState(() {
                            isLoading = true;
                          });
                        });
                        String paymentUrl =
                            await BlocProvider.of<TransactionCubit>(context)
                                .submitTransaction(widget.transaction.copyWith(
                                    dateTime: DateTime.now(),
                                    total: (widget.transaction.total * 1.1)
                                            .toInt() +
                                        50000));
                        if (paymentUrl != null) {
                          Get.to(PaymentMethodPage(paymentUrl));
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          Get.snackbar("", "",
                              backgroundColor: "D9435E".toColor(),
                              icon: Icon(
                                MdiIcons.closeCircleOutline,
                                color: Colors.white,
                              ),
                              titleText: Text(
                                'Transaction Failed',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              messageText: Text(
                                'Please type again later.' +
                                    paymentUrl.toString(),
                                style: GoogleFonts.poppins(color: Colors.white),
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                          primary: mainColor,
                          side: BorderSide(color: Color(0xffFCF9F9), width: 3),
                          shadowColor: Color(0x40000000)),
                      child: Text(
                        'Checkout Now',
                        style: blackMediumFontStyle,
                      ),
                    ),
                  ),
                ),
          Container(
            height: 26,
            width: double.infinity,
            color: "FFD84F".toColor(),
          ),
        ],
      ),
    );
  }
}
