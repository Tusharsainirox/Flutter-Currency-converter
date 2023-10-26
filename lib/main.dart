import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/pages/homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => CartProvider(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            titleLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          useMaterial3: true,
        ),
        title: 'shopping app',
        home:const HomePage(),
      ),
    );
  }
}
