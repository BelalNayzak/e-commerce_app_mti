import 'package:flutter/material.dart';
import 'package:mti_app/providers/user.dart';
import 'package:provider/provider.dart';

class MyUserTypeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<User>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('I\'m a ...'),
        Row(
          children: [
            Checkbox(
              activeColor: Colors.grey[700],
              value: userDataProvider.isCustomer,
              onChanged: (value) {
                userDataProvider.toggleUserType();
              },
            ),
            Text('Customer'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              activeColor: Colors.grey[700],
              value: !userDataProvider.isCustomer,
              onChanged: (value) {
                userDataProvider.toggleUserType();
              },
            ),
            Text('Admin'),
          ],
        ),
      ],
    );
  }
}
