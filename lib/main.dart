import 'package:catalogue_app/pages/authentication/forget_password.dart';
import 'package:catalogue_app/pages/authentication/login_page.dart';
import 'package:catalogue_app/pages/authentication/signup_page.dart';
import 'package:catalogue_app/pages/cart/cart_view.dart';
import 'package:catalogue_app/pages/home/home.dart';
import 'package:catalogue_app/utils/routes.dart';
import 'package:catalogue_app/utils/theme.dart';
import 'package:catalogue_app/velocityx/vx_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VxState(store: MyVxStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.loginRoutes: (context) => LogInPage(),
        Routes.mainUi: (context) => const Home(),
        Routes.cartView: (context) => const CartView(),
        Routes.signUp: (context) =>  SignUpPage(),
        Routes.forgetPassword: (context) => const ForgetPassword(),
      },
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.system,
      // darkTheme: MyTheme.darkTheme,
      // darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser != null
          ? const Home()
          : LogInPage(),
    );
  }
}
