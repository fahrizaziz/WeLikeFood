import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welikefood/cubit/cubit.dart';
import 'package:welikefood/cubit/user_cubit.dart';
import 'package:welikefood/ui/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => FoodCubit()),
        BlocProvider(create: (_) => TransactionCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            // PaymentPage(
            //   transaction: Transaction(
            //       food: mockFoods[0],
            //       user: mockUser,
            //       quantity: 2,
            //       total: (mockFoods[0].price * 2 * 1.1).toInt() + 50000),
            // )
            SplashPage(),
        // MainPage(),
        //     FoodDetailPage(
        //   transaction: Transaction(food: mockFoods[0]),
        // ),

        // SuccessOrderPage(),
        // SuccesSignUpPage(),
      ),
    );
  }
}
