import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimalstore2/firebase_options.dart';
import 'package:minimalstore2/pages/inform_page.dart';
import 'package:minimalstore2/services/auth_provider.dart';
import 'package:minimalstore2/themes/theme_provider.dart';
import 'models/promo.dart';
import 'pages/cart_page.dart';
import 'pages/forgot_page.dart';
import 'pages/intro_page.dart';
import 'pages/register_page.dart';
import 'pages/shop_page.dart';
import "package:provider/provider.dart";
import "models/shop.dart";
import 'pages/login_page.dart';
import 'package:minimalstore2/pages/promo_page.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Shop()),
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    ),
     ChangeNotifierProvider(create: (context) => Promo(),
    ),
    ChangeNotifierProvider(create: (context) => UserProvider(),
    ),
    
  ], child: const MyApp()));
}
//AUTO STOP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
        routes: {
          '/intro_page': (context) => const IntroPage(),
          '/shop_page': (context) => const ShopPage(),
          '/cart_page': (context) => const CartPage(),
          '/inform_page':(context) => const InformPage(),
          '/login_page':(context) =>  Login(),
          '/promo_page':(context) => const PromoPage(),
          '/register_page':(context) => const RegisterPage(),
          '/forgot_page':(context) => const  ForgotPasswordPage()

        });
  }
}
