import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mti_app/providers/user.dart';
import 'package:mti_app/sheets/add_car_sheet.dart';
import 'package:mti_app/sheets/my_orders_sheet.dart';
import 'package:mti_app/sheets/my_wish_list_sheet.dart';
import 'package:mti_app/widgets/login_form/my_text_form_field.dart';
import 'package:provider/provider.dart';

import 'file:///D:/flutter/max/apps/mti_app/lib/sheets/add_estate_sheet.dart';
import 'file:///D:/flutter/max/apps/mti_app/lib/sheets/my_ads_sheet.dart';

class ProfilePage extends StatelessWidget {
  void _showSheet(BuildContext context, Widget sheetBody) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return sheetBody;
      },
    );
  }

  Widget _getUserProfileWidget(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: ListTile(
            leading: Icon(Icons.directions_car_rounded),
            title: Text('Add Car'),
            trailing: Icon(
              Icons.add,
              // color: Colors.red[300],
            ),
            onTap: () => _showSheet(context, AddCarSheet()),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text('Add Estate'),
            trailing: Icon(
              Icons.add,
              // color: Colors.red[300],
            ),
            onTap: () => _showSheet(context, AddEstateSheet()),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: ListTile(
            leading: Icon(Icons.widgets),
            title: Text('My Ads'),
            onTap: () => _showSheet(context, MyAdsSheet()),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: ListTile(
            leading: Icon(Icons.receipt),
            title: Text('My Orders'),
            onTap: () => _showSheet(context, MyOrdersSheet()),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text('My Wish List'),
            onTap: () => MyWishListSheet(),
          ),
        ),
      ],
    );
  }

  Widget _getAdminProfileWidget(context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    MyTextFormField(
                      text: 'Name',
                      validate: (inputText) {},
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 14),
                    MyTextFormField(
                      text: 'Price',
                      validate: (inputText) {},
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      textInputAction: TextInputAction.next,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 20,
                        bottom: 6,
                      ),
                      child: Text(
                        'Description',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    MyTextFormField(
                      maxLines: 3,
                      validate: (inputText) {},
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      child: FlatButton.icon(
                        label: Text(
                          'Add Product',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(Icons.add, color: Colors.white),
                        color: Colors.grey[800],
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<User>(context, listen: false);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  width: double.infinity,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(250, 50),
                        bottomRight: Radius.elliptical(250, 50),
                      ),
                    ),
                    child: Opacity(
                      opacity: 0.05,
                      child: Image.asset(
                        'assets/images/shop_bkg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 20,
                  child: Text(
                    'Your Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[200],
                      // color: Colors.red[200],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    child: FloatingActionButton(
                      elevation: 10,
                      backgroundColor: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      onPressed: () {},
                      child: userDataProvider.isCustomer
                          ? Image.asset('assets/images/person.jpg')
                          : Icon(
                              Icons.admin_panel_settings_sharp,
                              color: Colors.grey[700],
                              size: 40,
                            ),
                    ),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.16,
                  bottom: 30,
                  child: FloatingActionButton(
                    elevation: 10,
                    mini: true,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      color: Colors.black87,
                      // color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.16,
                  bottom: 30,
                  child: FloatingActionButton(
                    elevation: 10,
                    mini: true,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.logout,
                      color: Colors.black87,
                      // color: Colors.red,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              userDataProvider.isCustomer ? 'User Name' : 'Admin',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
                // color: Colors.red[600],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.52,
            child: userDataProvider.isCustomer
                ? _getUserProfileWidget(context)
                : _getAdminProfileWidget(context),
          ),
        ],
      ),
    );
  }
}

// Container(
// width: 80,
// height: 80,
// decoration: BoxDecoration(
// border: Border.all(color: Colors.grey[100], width: 4),
// color: Colors.grey[200],
// shape: BoxShape.circle,
// image: DecorationImage(
// image: AssetImage('assets/images/profile.jpg'),
// fit: BoxFit.contain,
// ),
// ),
// )
