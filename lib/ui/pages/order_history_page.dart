part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int quantity = 1;
  // Note code 11 buat tap halaman
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_, state) {
      if (state is TransactionLoaded) {
        if (state.transactions.length == 0) {
          return IllustrationPage(
            buttonTap1: () {},
            buttonTittle1: 'Find Foods',
            picturePath: 'assets/order_empty.json',
            subtitle: 'Seems like you have not\nordered any food yet',
            title: 'Ouch! Hungry',
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;
          return RefreshIndicator(
            onRefresh: () async {
              await BlocProvider.of<TransactionCubit>(context)
                  .getTransactions();
            },
            child: ListView(
              children: [
                Column(
                  children: [
                    // Note Header
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Orders',
                            style: blackMediumFontStyle.copyWith(
                              fontSize: 22,
                            ),
                          ),
                          Text('Wait for the best meal',
                              style: greyLightFontStyle),
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: ['In Progress', 'Past Orders'],
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            selectedIndex: selectedIndex,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Builder(builder: (_) {
                            List<Transaction> transactions =
                                (selectedIndex == 0)
                                    ? state.transactions
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.on_delivery ||
                                            element.status ==
                                                TransactionStatus.pending)
                                        .toList()
                                    : state.transactions
                                        .where((element) =>
                                            element.status ==
                                                TransactionStatus.delivered ||
                                            element.status ==
                                                TransactionStatus.cancelled)
                                        .toList();
                            return Column(
                              children: transactions
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: defaultMargin,
                                            left: defaultMargin,
                                            bottom: 16),
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (e.status ==
                                                TransactionStatus.pending) {
                                              await launch(e.paymentUrl);
                                            }
                                          },
                                          child: OrderListItem(
                                              transaction: e,
                                              itemWidth: listItemWidth),
                                        ),
                                      ))
                                  .toList(),
                            );
                          }),
                          SizedBox(
                            height: 65,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
