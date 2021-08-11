part of 'widget.dart';

class CustomBottomNavBar extends StatelessWidget {
  // Note: code 5 untuk mengetahui icon mana yang di pilih
  final int selectedIndex;
  // Note: code 6 fungsi untuk memilih2 item
  final Function(int index) onTap;
  CustomBottomNavBar({this.selectedIndex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 0, 18, 10),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap(0);
                }
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/ic_home' +
                              ((selectedIndex == 0) ? '.png' : '_normal.png'),
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap(1);
                }
              },
              child: Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.symmetric(horizontal: 83),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/ic_order' +
                              ((selectedIndex == 1) ? '.png' : '_normal.png'),
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap(2);
                }
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/ic_profile' +
                              ((selectedIndex == 2) ? '.png' : '_normal.png'),
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
