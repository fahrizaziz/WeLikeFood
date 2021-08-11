part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  MainPage({this.initialPage = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Note: code 10 untuk halaman mana yang di pilih
  int selectedPage;
  // Note: code 12 control halaman mana yang di pilih
  PageController pageController;
  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: Color(0xffFFD84F),
            ),
          ),
          // Note: code 27 - 41 untuk halaman
          SafeArea(
            child: PageView(
              // Note: Code 30 untuk mematikan swipe
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                  child: OrderHistoryPage(),
                ),
                Center(
                  child: ProfilePage(),
                ),
              ],
            ),
          ),
          // Note: Code 27 buat navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(
              // Note: code 53 - 60 untuk mengontroll bottom ke setiap halaman
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          )
        ],
      ),
    );
  }
}
