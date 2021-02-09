import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mti_app/providers/user.dart';
import 'package:mti_app/screens/home_screen.dart';
import 'package:mti_app/widgets/login_form/my_text_form_field.dart';
import 'package:provider/provider.dart';

import 'file:///D:/flutter/max/apps/mti_app/lib/widgets/login_form/my_user_type_selection.dart';

class MyLoginForm extends StatelessWidget {
  final _formKey = new GlobalKey<FormState>();

  Future<void> _saveForm(context, var userDataProvider) async {
    // checks manually if data are valid at all fields
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      userDataProvider.setIsLoading(true);
      _formKey.currentState.save(); // triggers onSave() function for all fields
      http.Response response;

      if (userDataProvider.isCustomer) {
        response = await userDataProvider.logIn(
            userDataProvider.formData['email'],
            userDataProvider.formData['password']);
      } else {
        response = await userDataProvider.signUp(
            userDataProvider.formData['name'],
            userDataProvider.formData['email'],
            userDataProvider.formData['password']);
      }
      userDataProvider.setIsLoading(false);

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, HomeScreen.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<User>(context);

    return userDataProvider.isLoading
        ? Center(
            child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ))
        : Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!userDataProvider.isCustomer)
                        MyTextFormField(
                          text: 'Full name',
                          icon: Icons.account_circle_outlined,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validate: (String inputText) {
                            if (inputText.isEmpty) {
                              return 'Please enter your name *';
                            } else if (inputText.length < 5 ||
                                !inputText.contains(' ')) {
                              return 'Please enter your full name';
                            }
                          },
                          onSave: (value) {
                            userDataProvider.addFormData({'name': '$value'});
                          },
                        ),
                      SizedBox(height: 15),
                      MyTextFormField(
                        text: 'user_name@example.com',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validate: (String inputText) {
                          if (inputText.isEmpty) {
                            return 'Please enter your email *';
                          } else if (inputText.length < 6 ||
                              inputText.contains(' ') ||
                              !inputText.contains('@') ||
                              !inputText.contains('.')) {
                            return 'Please enter a valid email';
                          }
                        },
                        onSave: (value) {
                          userDataProvider.addFormData({'email': '$value'});
                        },
                      ),
                      SizedBox(height: 15),
                      MyTextFormField(
                        text: 'Password',
                        icon: Icons.lock_outline,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                        validate: (String inputText) {
                          if (inputText.isEmpty) {
                            return 'Please enter your password *';
                          } else if (inputText.length < 6) {
                            return 'Password must be 6 digits at least';
                          }
                        },
                        onSave: (value) {
                          userDataProvider.addFormData({'password': '$value'});
                        },
                        onFieldSubmitted: (_) =>
                            _saveForm(context, userDataProvider),
                      ),
                      SizedBox(height: 15),
                      if (userDataProvider.isCustomer) MyUserTypeSelection(),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 5),
                        child: FlatButton(
                          onPressed: () => _saveForm(context, userDataProvider),
                          child: Text(
                            userDataProvider.isCustomer ? 'LOG IN' : 'SIGN UP',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.grey[700],
                          minWidth: double.infinity,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
