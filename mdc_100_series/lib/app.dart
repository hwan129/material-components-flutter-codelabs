import 'package:flutter/material.dart';
import 'package:shrine/search.dart';

import 'home.dart';
import 'login.dart';
import 'signup.dart';
import 'search.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => const HomePage(),
        '/signup': (BuildContext context) => const SignupPage(),
        '/home': (BuildContext context) => const SignupPage(),
        '/search': (BuildContext context) => const SearchPage(),
        '/favoritehotels': (BuildContext context) => const SignupPage(),
        '/mypage': (BuildContext context) => const SignupPage(),
        // '/detail': (BuildContext context) {
        //   final Product product =
        //       ModalRoute.of(context)!.settings.arguments as Product;
        //   return DetailPage(product: product);
        // },

        // TODO: Make currentCategory field take _currentCategory (104)
        // TODO: Pass _currentCategory for frontLayer (104)
        // TODO: Change backLayer field value to CategoryMenuPage (104)
      },
      // TODO: Customize the theme (103)
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}

// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)
