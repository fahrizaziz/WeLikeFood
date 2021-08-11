part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  // City selectedCity;
  // List<City> citys = [
  //   City("Bandung"),
  //   City("Jakarta"),
  //   City("Surabaya"),
  // ];
  // List<DropdownMenuItem> generateItems(List<City> citys) {
  //   List<DropdownMenuItem> items = [];
  //   for (var item in citys) {
  //     items.add(DropdownMenuItem(
  //       child: Text(item.name),
  //       value: item,
  //     ));
  //   }
  //   return items;
  // }

  // int _value = 1;
  TextEditingController housenoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // TextEditingController cityController = TextEditingController();
  String selectedCity;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign up',
      subtitle: 'Register and eat',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text('Phone No.'),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: blackColor),
            ),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your phone number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('Address'),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: blackColor),
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('House No.'),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: blackColor),
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: housenoController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your house number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('City'),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButtonFormField(
              hint: Text(
                'Pilih Kota',
                style: greyFontStyle,
              ),
              items: cities.map(
                (City city) {
                  return DropdownMenuItem(
                    child: Text(
                      city.name,
                      style: blackMediumFontStyle,
                    ),
                    value: city,
                  );
                },
              ).toList(),
              onChanged: (City city) {
                setState(() {
                  selectedCity = city.name;
                });
              },
              // DropdownButton(
              //   hint: Text('Pilih Kota'),
              //   isExpanded: true,
              //   underline: SizedBox(),
              //   value: _value,
              //   items: [
              //     DropdownMenuItem(
              //         child: Text('Bandung', style: blackMediumFontStyle),
              //         value: 1), //#008CFF
              //     DropdownMenuItem(
              //         child: Text('Jakarta', style: blackMediumFontStyle),
              //         value: 2), //#008CFF
              //     DropdownMenuItem(
              //       child: Text('Surabaya', style: blackMediumFontStyle),
              //       value: 3, //#008CFF
              //     )
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       _value = value;
              //     });
              //   },
              // ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? Center(
                    child: loadingIndicator,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          phoneNumber: phoneController.text,
                          address: addressController.text,
                          houseNumber: housenoController.text,
                          city: selectedCity);
                      setState(() {
                        isLoading = true;
                      });
                      await BlocProvider.of<UserCubit>(context).signUp(
                          user, widget.password,
                          pictureFile: widget.pictureFile);
                      UserState state =
                          BlocProvider.of<UserCubit>(context).state;
                      if (state is UserLoaded) {
                        BlocProvider.of<FoodCubit>(context).getFoods();
                        // context.bloc<FoodCubit>().getFoods();
                        // ignore: deprecated_mUserCubitember_use
                        // context.bloc<TransactionCubit>().getTransactions();
                        BlocProvider.of<TransactionCubit>(context)
                            .getTransactions();

                        Get.to(SuccesSignUpPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sign Up Failed !!!!!",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                                (state as UserLoadingFailed).message,
                                style:
                                    GoogleFonts.poppins(color: Colors.white)));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        primary: mainColor,
                        side: BorderSide(color: Color(0xffFCF9F9), width: 3),
                        shadowColor: Color(0x40020202)),
                    child: Text(
                      'Sign Up',
                      style: blackMediumFontStyle,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// class City {
//   String name;
//   City(this.name);
// }
