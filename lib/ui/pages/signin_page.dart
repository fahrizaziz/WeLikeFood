part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign in',
      subtitle: 'Find your best ever meal',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text('Email Address'),
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
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your email address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text('Password'),
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
              controller: passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Type your password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      // if (!(emailController.text.trim() != "")) {
                      //   Get.snackbar("", "",
                      //       backgroundColor: "D9435E".toColor(),
                      //       icon: Icon(
                      //         MdiIcons.closeCircleOutline,
                      //         color: Colors.white,
                      //       ),
                      //       titleText: Text(
                      //         "Sign In Gagal!!!!!!!!",
                      //         style: GoogleFonts.poppins(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //       messageText: Text('Field Email Tidak Boleh Kosong',
                      //           style:
                      //               GoogleFonts.poppins(color: Colors.white)));
                      // } else if (!(passwordController.text.trim() != "")) {
                      //   Get.snackbar("", "",
                      //       backgroundColor: "D9435E".toColor(),
                      //       icon: Icon(
                      //         MdiIcons.closeCircleOutline,
                      //         color: Colors.white,
                      //       ),
                      //       titleText: Text(
                      //         "Sign In Gagal!!!!!!!!",
                      //         style: GoogleFonts.poppins(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //       messageText: Text(
                      //           'Field Password Tidak Boleh Kosong',
                      //           style:
                      //               GoogleFonts.poppins(color: Colors.white)));
                      // } else {
                      //   setState(() {
                      //     isLoading = true;
                      //   });
                      //   await BlocProvider.of<UserCubit>(context).signIn(
                      //       emailController.text, passwordController.text);
                      //   UserState state =
                      //       BlocProvider.of<UserCubit>(context).state;
                      //   if (state is UserLoaded) {
                      //     BlocProvider.of<FoodCubit>(context).getFoods();
                      //     // context.bloc<FoodCubit>().getFoods();
                      //     // ignore: deprecated_mUserCubitember_use
                      //     // context.bloc<TransactionCubit>().getTransactions();
                      //     BlocProvider.of<TransactionCubit>(context)
                      //         .getTransactions();

                      //     Get.to(MainPage());
                      //   } else {
                      //     Get.snackbar("", "",
                      //         backgroundColor: "D9435E".toColor(),
                      //         icon: Icon(
                      //           MdiIcons.closeCircleOutline,
                      //           color: Colors.white,
                      //         ),
                      //         titleText: Text(
                      //           "Sign In Failed !!!!!",
                      //           style: GoogleFonts.poppins(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w600),
                      //         ),
                      //         messageText: Text(
                      //             (state as UserLoadingFailed).message,
                      //             style: GoogleFonts.poppins(
                      //                 color: Colors.white)));
                      //     setState(() {
                      //       isLoading = false;
                      //     });
                      //   }
                      // }
                      setState(() {
                        isLoading = true;
                      });
                      await BlocProvider.of<UserCubit>(context).signIn(
                          emailController.text, passwordController.text);
                      UserState state =
                          BlocProvider.of<UserCubit>(context).state;
                      if (state is UserLoaded) {
                        BlocProvider.of<FoodCubit>(context).getFoods();
                        // context.bloc<FoodCubit>().getFoods();
                        // ignore: deprecated_mUserCubitember_use
                        // context.bloc<TransactionCubit>().getTransactions();
                        BlocProvider.of<TransactionCubit>(context)
                            .getTransactions();

                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sign In Failed !!!!!",
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
                        shadowColor: Color(0x400020202)),
                    child: Text(
                      'Sign In',
                      style: blackMediumFontStyle,
                    ),
                  ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 250, bottom: 10),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? loadingIndicator
                : InkWell(
                    onTap: () {
                      Get.to(SignUpPage(Auth()));
                    },
                    child: Center(
                      child: Text(
                        'Create New Account',
                        style: greyFontStyle,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
