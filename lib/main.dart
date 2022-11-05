import 'package:catalogue_app/utils/routes.dart';
import 'package:catalogue_app/utils/theme.dart';
import 'package:catalogue_app/views/cart_view.dart';
// import 'package:catalogue_app/views/detail_view.dart';
import 'package:catalogue_app/views/login_view.dart';
import 'package:catalogue_app/views/home.dart';
import 'package:catalogue_app/views/widgets/vx_store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(VxState(store: MyVxStore(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Home(),
        Routes.loginRoutes: (context) => const LoginView(),
        Routes.mainUi: (context) => const Home(),
        Routes.cartView: (context) => const CartView(),
      },
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.system,
      // darkTheme: MyTheme.darkTheme,
      // darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Catalogue App'),
//       ),
//       body: TextButton(
//         onPressed: () {},
//         child: const Text('Nothing'),
//       ),
//       drawer: const Drawer(
//         backgroundColor: Colors.lightBlue,
//       ),
//     );
//   }
// }
