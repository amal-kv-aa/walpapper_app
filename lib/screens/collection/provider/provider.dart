
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:walpapper_app/screens/collection/model/curted_models.dart';
import 'package:walpapper_app/screens/services/api/api_images.dart';

class CollectionProvider with ChangeNotifier{
 CollectionProvider(){
  getImages();
 }
 CurtedModel? curtedData;

  getImages(){
    ApiWalpapper().getCollections().then((value) => {
      if(value != null){
        curtedData = value,
        log(curtedData!.photos[0].src.original),
        notifyListeners()
      }
    });
  }
}