import 'package:flutter/material.dart';
import 'package:mti_app/models/ad/estate_ad.dart';
import 'package:mti_app/providers/ads.dart';

class EstateAdWidget extends StatelessWidget {
  final EstateAd ad;
  final int index;
  final Ads adsProvider;

  EstateAdWidget(this.ad, this.index, this.adsProvider);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                'Product #$index',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              FloatingActionButton(
                elevation: 1,
                mini: true,
                backgroundColor: Colors.white,
                child: Icon(Icons.edit, color: Colors.black),
                // child: Icon(Icons.edit, color: Colors.red[300]),
                onPressed: () {
                  adsProvider.ads[index].showAddToEdit(context, ad);
                },
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                elevation: 1,
                mini: true,
                backgroundColor: Colors.white,
                child: Icon(Icons.delete_forever_rounded, color: Colors.black),
                // child: Icon(Icons.delete_forever_rounded, color: Colors.red[300]),
                onPressed: () => adsProvider.removeAd(ad.id),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text('time :  '),
            Text('${ad.time}'),
          ],
        ),
        Row(
          children: [
            Text('phone :  '),
            Text('${ad.phone}'),
          ],
        ),
        Row(
          children: [
            Text('address :  '),
            Text('${ad.address}'),
          ],
        ),
        Row(
          children: [
            Text('description :  '),
            Text('${ad.description}'),
          ],
        ),
        Row(
          children: [
            Text('rooms :  '),
            Text('${ad.rooms}'),
          ],
        ),
        Row(
          children: [
            Text('bathrooms :  '),
            Text('${ad.bathrooms}'),
          ],
        ),
        Row(
          children: [
            Text('floor :  '),
            Text('${ad.floor}'),
          ],
        ),
        Row(
          children: [
            Text('price :  '),
            Text('${ad.price} LE'),
          ],
        ),
      ],
    );
  }
}
