import 'package:flutter/material.dart';
import 'package:mti_app/screens/home_screen.dart';
import 'package:mti_app/widgets/login_form/my_tab_bar.dart';

import 'file:///D:/flutter/max/apps/mti_app/lib/widgets/login_form/my_divider.dart';
import 'file:///D:/flutter/max/apps/mti_app/lib/widgets/login_form/my_log_in_form.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';

  void onTap(int index, var userDataProvider) {
    userDataProvider.setIsCustomer(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.05,
            child: Container(
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/shop_bkg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 40),
                  child: Text(
                    'Store App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 35,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                MyTabBar(onTap: onTap),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 12, right: 10, left: 10),
                  child: MyDivider(word: 'email'),
                ),
                MyLoginForm(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 12, right: 10, left: 10),
                  child: MyDivider(word: 'or'),
                ),
                FlatButton.icon(
                    minWidth: double.infinity,
                    onPressed: () {
                      // todo: login with gmail insteed
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    color: Colors.red,
                    icon: Icon(Icons.alternate_email, color: Colors.white),
                    label: Text(
                      'Sign in with gmail',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
