import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mti_app/models/ad/ad.dart';
import 'package:mti_app/sheets/add_car_sheet.dart';

class CarAd extends Ad {
  CarAd(String id, AdType adType, String phone, String price,
      String description, String time)
      : super(
          id: id,
          time: time,
          adType: adType,
          phone: phone,
          price: price,
          description: description,
        );

  @override
  Future<void> updateAd(Ad ad) {
    // TODO: implement updateAd
  }

  @override
  void showAddToEdit(BuildContext context, Ad ad) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return AddCarSheet();
      },
    );
  }
}
