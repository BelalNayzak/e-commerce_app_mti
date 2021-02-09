import 'package:flutter/material.dart';
import 'package:mti_app/providers/ads.dart';
import 'package:mti_app/providers/user.dart';
import 'package:mti_app/screens/home_screen.dart';
import 'package:mti_app/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          // products (of product)
          // orders
          // cartItems
          // user
          ChangeNotifierProvider(create: (_) => User()),
          ChangeNotifierProvider(create: (_) => Ads()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LoginScreen.id,
          routes: {
            LoginScreen.id: (_) => LoginScreen(),
            HomeScreen.id: (_) => HomeScreen(),
          },
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[300],
            buttonColor: Colors.grey[700],
            // primarySwatch: Colors.grey[700],
          ),
        ),
      ),
    );
