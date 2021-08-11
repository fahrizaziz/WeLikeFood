part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;
  FoodDetailPage({this.onBackButtonPressed, this.transaction});
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    // final panelHeightClosed = MediaQuery.of(context).size.height * 0.2;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: panelHeightOpen,
        // minHeight: panelHeightClosed,
        body: Stack(
          children: [
            SafeArea(
                child: Container(
              color: Colors.white,
            )),
            SafeArea(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.transaction.food.picturePath),
                      fit: BoxFit.cover)),
            )),
            SafeArea(
              child: ListView(
                children: [
                  Column(
                    // Note: Back Button
                    children: [
                      Container(
                        height: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.onBackButtonPressed != null) {
                                widget.onBackButtonPressed();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black12,
                              ),
                              child: Image.asset('assets/back_arrow_white.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        // parallaxEnabled: true,
        // parallaxOffset: .5,
        panelBuilder: (controller) => Container(
            child: Container(
          // margin: EdgeInsets.only(top: 26),
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 2,
              // ),
              Center(
                child: Container(
                  width: 24,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Color(0x8C000000),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:
                            MediaQuery.of(context).size.width - 134, //32 + 102
                        child: Text(
                          widget.transaction.food.name,
                          style: blackFontStyle.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RatingStar(widget.transaction.food.rate),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity = max(1, quantity - 1);
                          });
                        },
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1),
                              image: DecorationImage(
                                  image: AssetImage('assets/btn_min.png'))),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        child: Text(
                          quantity.toString(),
                          textAlign: TextAlign.center,
                          style: blackFontStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity = min(999, quantity + 1);
                          });
                        },
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1),
                              image: DecorationImage(
                                  image: AssetImage('assets/btn_add.png'))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 24, 0, 8),
                child: Text(
                  widget.transaction.food.description,
                  style: greyFontStyle,
                ),
              ),
              Text(
                'Ingredients:',
                style: blackFontStyle,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 15),
                child: Text(
                  widget.transaction.food.ingredients,
                  style: greyFontStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price:',
                        style: greyFontStyle.copyWith(fontSize: 13),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(quantity * widget.transaction.food.price),
                        style: blackFontStyle.copyWith(fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 163,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(PaymentPage(
                            transaction: widget.transaction.copyWith(
                                quantity: quantity,
                                total:
                                    quantity * widget.transaction.food.price),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            primary: mainColor,
                            side:
                                BorderSide(color: Color(0xffFCF9F9), width: 3),
                            shadowColor: Color(0x40000000)),
                        child: Text(
                          'Order Now',
                          style: blackMediumFontStyle,
                        )),
                  )
                ],
              )
            ],
          ),
        )

            // ListView(
            //   padding: EdgeInsets.zero,
            //   children: [
            //     SizedBox(
            //       height: 36,
            //     ),
            //     buildAboutText(),
            //     SizedBox(
            //       height: 24,
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }
}
