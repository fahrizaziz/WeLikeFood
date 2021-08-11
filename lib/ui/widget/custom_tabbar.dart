part of 'widget.dart';

class CustomTabBar extends StatelessWidget {
  // Note: code 5 untuk index yang kepilih
  final int selectedIndex;
  // Note: code 7 untuk list judul
  final List<String> titles;
  // Note: code 9 untuk fungsi index yang sedang dipilih
  final Function(int) onTap;
  //  Note: code 11 constroctor untuk menampung code 5, 7, 9
  CustomTabBar({@required this.onTap, this.selectedIndex, this.titles});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: 'f2f2f2'.toColor(),
          ),
          Row(
            children: titles
                .map((e) => Padding(
                      padding: EdgeInsets.only(left: defaultMargin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (onTap != null) {
                                onTap(titles.indexOf(e));
                              }
                            },
                            child: Text(
                              e,
                              style: (titles.indexOf(e) == selectedIndex)
                                  ? blackMediumFontStyle
                                  : greyFontStyle,
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 3,
                            margin: EdgeInsets.only(top: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.5),
                                color: (titles.indexOf(e) == selectedIndex)
                                    ? '020202'.toColor()
                                    : Colors.transparent),
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
