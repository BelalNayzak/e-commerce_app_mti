import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final Function onTap;

  MyTabBar({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 20,
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
          indicatorWeight: 3,
          labelColor: Colors.grey[700],
          indicatorColor: Colors.grey[700],
          onTap: (_) => onTap(),
          tabs: [
            Tab(text: 'LOG IN'),
            Tab(text: 'SIGN UP'),
          ],
        ),
      ),
    );
  }
}
