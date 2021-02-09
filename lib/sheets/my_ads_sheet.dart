import 'package:flutter/material.dart';
import 'package:mti_app/models/ad/ad.dart';
import 'package:mti_app/providers/ads.dart';
import 'package:mti_app/widgets/car_ad_widget.dart';
import 'package:mti_app/widgets/estate_ad_widget.dart';
import 'package:provider/provider.dart';

class MyAdsSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _adsProvider = Provider.of<Ads>(context);
    if (_adsProvider.ads.isEmpty) {
      // need the 1st initialization (load ads)
      _adsProvider.isLoading = true;
      _adsProvider.loadAds().then((_) => _adsProvider.isLoading = false);
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 60, left: 10, right: 10, top: 10),
              child: ListView.builder(
                  itemCount: _adsProvider.ads.length,
                  itemBuilder: (_, index) {
                    Ad ad = _adsProvider.ads[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ad.adType == AdType.car
                              ? CarAdWidget(ad, index, _adsProvider)
                              : EstateAdWidget(ad, index, _adsProvider),
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: FloatingActionButton(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                backgroundColor: Colors.grey[700],
                elevation: 10,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            if (_adsProvider.isLoading)
              Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              )),
          ],
        ),
      ),
    );
  }
}
