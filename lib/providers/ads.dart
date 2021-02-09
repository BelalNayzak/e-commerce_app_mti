import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mti_app/models/ad/ad.dart';
import 'package:mti_app/models/ad/estate_ad.dart';

class Ads with ChangeNotifier {
  List<Ad> _ads = [];

  bool _isLoading = false;

  List<Ad> get ads => [..._ads];

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    // notifyListeners();
  }

  Future<void> loadAds() async {
    try {
      const url =
          'https://mtiapp-b4b07-default-rtdb.firebaseio.com/products.json';
      final response = await http.get(url);
      final Map<String, dynamic> extractedData = convert.json.decode(response
          .body); // Map<String, Map<String, String>> extractedData // will produce error! so let it dynamic
      extractedData.forEach((adId, adData) {
        _ads.add(
          EstateAd(
            id: adId,
            time: adData['time'],
            adType: adData['adType'].toString().contains('estate')
                ? AdType.estate
                : AdType.car,
            phone: adData['phone'],
            price: adData['price'],
            address: adData['address'],
            rooms: adData['rooms'],
            bathrooms: adData['bathrooms'],
            floor: adData['floor'],
            description: adData['description'],
          ),
        );
      });
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addAd(Ad ad) async {
    try {
      const url =
          'https://mtiapp-b4b07-default-rtdb.firebaseio.com/products.json';
      // final response = await http.post(
      await http.post(
        url,
        body: convert.json.encode({
          // id: todo: how to get the id of the added item in firebase once added to db ?
          'time': ad.time,
          'adType': ad.adType.toString(),
          'phone': ad.phone,
          'price': ad.price,
          'description': ad.description,
          'address': (ad as EstateAd).address,
          'rooms': (ad as EstateAd).rooms,
          'bathrooms': (ad as EstateAd).bathrooms,
          'floor': (ad as EstateAd).floor,
        }),
      );
      // i think no need for this if condition as try catch will detect if code!=200 automatically but test it first
      // tested > result: i was right
      // if (response.statusCode == 200) {
      _ads.add(ad);
      notifyListeners();
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  void removeAd(String productId) async {
    try {
      final url =
          'https://mtiapp-b4b07-default-rtdb.firebaseio.com/products/$productId.json';
      await http.delete(url);
      _ads.removeWhere((element) => element.id == productId);
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
