import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AdType {
  estate,
  car,
}

abstract class Ad {
  String id;
  String time;
  AdType adType;
  String phone;
  String price;
  String description;

  Ad({
    @required this.id,
    @required this.time,
    @required this.adType,
    @required this.phone,
    @required this.price,
    @required this.description,
  });

  Future<void> updateAd(Ad ad);

  void showAddToEdit(BuildContext context, Ad ad);
}
