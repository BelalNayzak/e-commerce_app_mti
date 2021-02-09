import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mti_app/models/ad/ad.dart';
import 'package:mti_app/sheets/add_estate_sheet.dart';

class EstateAd extends Ad with ChangeNotifier {
  String address;
  String rooms;
  String bathrooms;
  String floor;

  EstateAd({
    @required String id,
    @required String time,
    @required AdType adType,
    @required String phone,
    @required String price,
    @required String description,
    @required this.address,
    @required this.rooms,
    @required this.bathrooms,
    @required this.floor,
  }) : super(
          id: id,
          time: time,
          adType: adType,
          phone: phone,
          price: price,
          description: description,
        );

  @override
  Future<void> updateAd(Ad ad) async {
    try {
      final url =
          'https://mtiapp-b4b07-default-rtdb.firebaseio.com/products/${ad.id}.json';
      await http.patch(
        url,
        body: convert.json.encode({
          'description': ad.description,
          'time': ad.time,
          'adType': ad.adType.toString(),
          'phone': ad.phone,
          'price': ad.price,
          'address': (ad as EstateAd).address,
          'rooms': (ad as EstateAd).rooms,
          'bathrooms': (ad as EstateAd).bathrooms,
          'floor': (ad as EstateAd).floor,
        }),
      );
      id = ad.id;
      adType = ad.adType;
      description = ad.description;
      phone = ad.phone;
      price = ad.price;
      address = (ad as EstateAd).address;
      rooms = (ad as EstateAd).rooms;
      bathrooms = (ad as EstateAd).bathrooms;
      floor = (ad as EstateAd).floor;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void showAddToEdit(BuildContext context, Ad ad) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return AddEstateSheet(toEdit: true, ad: ad);
      },
    );
  }
}
