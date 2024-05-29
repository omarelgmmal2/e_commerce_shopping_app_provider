import 'package:e_commerce_shopping_app_provider/provider/cart.dart';
import 'package:e_commerce_shopping_app_provider/provider/product.dart';
import 'package:e_commerce_shopping_app_provider/screens/view.dart';
import 'package:e_commerce_shopping_app_provider/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductProvider(),),
          ChangeNotifierProvider(create: (context) => CartProvider(),),
        ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce Shopping App",
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      themeMode: ThemeMode.light,
      home: const MainScreen(),

    );
  }
}
