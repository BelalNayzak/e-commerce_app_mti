import 'package:flutter/material.dart';
import 'package:mti_app/models/ad/ad.dart';
import 'package:mti_app/models/ad/estate_ad.dart';
import 'package:mti_app/providers/ads.dart';
import 'package:mti_app/widgets/login_form/my_text_form_field.dart';
import 'package:provider/provider.dart';

class AddEstateSheet extends StatelessWidget {
  final bool toEdit;
  final EstateAd ad;

  AddEstateSheet({this.toEdit = false, this.ad});

  final _formKey = new GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  // bool _needInit = true;

  Future<void> _saveForm(context, var adsProvider) async {
    // checks manually if data are valid at all fields
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      _formKey.currentState.save(); // triggers onSave() function for all fields

      adsProvider.isLoading = true;
      toEdit
          ? adsProvider.ads
              .firstWhere((element) => element.id == ad.id)
              .updateAd(ad)
              .then((_) {
              adsProvider.isLoading = false;
              Navigator.of(context).pop();
            })
          : adsProvider
              .addAd(
              EstateAd(
                id: null,
                // todo: how to get the id of the added item in firebase once added to db ?
                time: DateTime.now().toString(),
                phone: _formData['phone'],
                address: _formData['address'],
                description: _formData['description'],
                rooms: _formData['rooms'],
                bathrooms: _formData['bathrooms'],
                floor: _formData['floor'],
                price: _formData['price'],
                adType: AdType.estate,
              ),
            )
              .then((_) {
              adsProvider.isLoading = false;
              Navigator.of(context).pop();
            });
    }
  }

  // Future<http.Response> addEstate({
  //   @required String phone,
  //   @required String address,
  //   @required String description,
  //   @required String rooms,
  //   @required String bathrooms,
  //   @required String floor,
  //   @required String price,
  // }) async {
  //   const url =
  //       'https://mtiapp-b4b07-default-rtdb.firebaseio.com/products.json';
  //   final response = await http.post(url,
  //       body: convert.json.encode({
  //         'phone': phone.toString(),
  //         'address': address.toString(),
  //         'description': description.toString(),
  //         'rooms': rooms.toString(),
  //         'bathrooms': bathrooms.toString(),
  //         'floor': floor.toString(),
  //         'price': price.toString(),
  //       }));
  //   print(convert.json.decode(response.body));
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    // print('****** $_needInit');
    print('****** build');

    final _adsProvider = Provider.of<Ads>(context);
    // if (_needInit) {
    // need the 1st initialization (load ads)
    // _adsProvider.isLoading = true;
    // _adsProvider.loadAds().then((_) => _adsProvider.isLoading = false);
    // _needInit = false;
    // }

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
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 70),
                child: Column(
                  children: [
                    MyTextFormField(
                      text: 'Phone number',
                      initialTextValue: toEdit ? ad.phone : '',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validate: (String inputText) {
                        if (inputText.isEmpty) {
                          return 'Please enter your phone number *';
                        } else if (inputText.length < 10) {
                          return 'Please enter a valid number';
                        }
                      },
                      onSave: (value) {
                        _formData.addAll({'phone': '$value'});
                      },
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      text: 'Estate address',
                      initialTextValue: toEdit ? ad.address : '',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validate: (String inputText) {
                        if (inputText.isEmpty) {
                          return 'Please enter estate\'s address *';
                        } else if (inputText.length < 10) {
                          return 'Please enter a valid address';
                        }
                      },
                      onSave: (value) {
                        _formData.addAll({'address': '$value'});
                      },
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      text: 'Estate description',
                      initialTextValue: toEdit ? ad.description : '',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validate: (String inputText) {
                        if (inputText.isEmpty) {
                          return 'Please enter estate\'s description *';
                        } else if (inputText.length < 10) {
                          return 'Please enter a valid description';
                        }
                      },
                      onSave: (value) {
                        _formData.addAll({'description': '$value'});
                      },
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      text: 'No. of rooms',
                      initialTextValue: toEdit ? ad.rooms : '',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validate: (String inputText) {
                        if (inputText.isEmpty) {
                          return 'Please enter no. of rooms *';
                        } else if (inputText.length > 1) {
                          return 'Please enter a valid no. of rooms';
                        }
                      },
                      onSave: (value) {
                        _formData.addAll({'rooms': '$value'});
                      },
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      text: 'No. of bathrooms',
                      initialTextValue: toEdit ? ad.bathrooms : '',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validate: (String inputText) {
                        if (inputText.isEmpty) {
                          return 'Please enter no. of bathrooms *';
                        } else if (inputText.length > 1) {
                          return 'Please enter a valid no. of bathrooms';
                        }
                      },
                      onSave: (value) {
                        _formData.addAll({'bathrooms': '$value'});
                      },
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      text: 'Floor',
                      initialTextValue: toEdit ? ad.floor : '',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validate: (String inputText) {
                        if (inputText.isEmpty) {
                          return 'Please enter floor *';
                        } else if (inputText.length > 2) {
                          return 'Please enter a valid floor';
                        }
                      },
                      onSave: (value) {
                        _formData.addAll({'floor': '$value'});
                      },
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      text: 'Price',
                      initialTextValue: toEdit ? ad.price : '',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validate: (String inputText) {
                        if (inputText.isEmpty) {
                          return 'Please enter price *';
                        }
                      },
                      onSave: (value) {
                        _formData.addAll({'price': '$value'});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: FloatingActionButton(
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                backgroundColor: Colors.grey[700],
                elevation: 10,
                onPressed: () => _saveForm(context, _adsProvider),
              ),
            ),
            if (_adsProvider.isLoading)
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
