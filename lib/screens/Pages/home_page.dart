import 'package:flutter/material.dart';
import 'package:mti_app/models/ad/ad.dart';
import 'package:mti_app/providers/ads.dart';
import 'package:mti_app/widgets/car_ad_widget.dart';
import 'package:mti_app/widgets/estate_ad_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _needInit = true;

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    final _adsProvider = Provider.of<Ads>(context);
    // to load only once, not each time build is called
    if (_needInit && _adsProvider.ads.isEmpty) {
      _adsProvider.loadAds().then((_) {
        setState(() => _isLoading = false);
        _needInit = false;
      });
    } else {
      setState(() => _isLoading = false);
    }

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ))
        : Padding(
            padding:
                const EdgeInsets.only(bottom: 60, left: 10, right: 10, top: 10),
            child: ListView.builder(
                itemCount: _adsProvider.ads.length,
                itemBuilder: (_, index) {
                  Ad ad = _adsProvider.ads[index];
                  // print('${_adsList[index]['phone']}');
                  // print('${_adsList[index]['address']}');
                  // print('${_adsList[index]['description']}');
                  // print('${_adsList[index]['rooms']}');
                  // print('${_adsList[index]['bathrooms']}');
                  // print('${_adsList[index]['floor']}');
                  // print('${_adsList[index]['price']}');
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
          );
  }
}
