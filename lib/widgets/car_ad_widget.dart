import 'package:flutter/cupertino.dart';
import 'package:mti_app/models/ad/car_ad.dart';
import 'package:mti_app/providers/ads.dart';

class CarAdWidget extends StatelessWidget {
  final CarAd ad;
  final int index;
  final Ads adsProvider;

  CarAdWidget(this.ad, this.index, this.adsProvider);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('car ad'));
  }
}
