part of 'widget.dart';

class RatingStar extends StatelessWidget {
  // Note: Code 5 dan 6 untuk rating
  final double rate;
  RatingStar(this.rate);
  @override
  Widget build(BuildContext context) {
    // Note: code 10 untuk memunculkan rating
    int numberOfStarts = rate.round();
    return Row(
      children: List<Widget>.generate(
              5,
              (index) => new Icon(
                    (index < numberOfStarts)
                        ? MdiIcons.star
                        : MdiIcons.starOutline,
                    size: 16,
                    color: yellowColor,
                  )) +
          [
            SizedBox(
              width: 4,
            ),
            Text(rate.toString(), style: greyFontStyle.copyWith(fontSize: 12))
          ],
    );
  }
}
