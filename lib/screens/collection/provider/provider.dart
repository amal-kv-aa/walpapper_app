import 'package:flutter/material.dart';
import 'package:walpapper_app/screens/collection/model/curted_models.dart';
import 'package:walpapper_app/screens/services/api/api_images.dart';

class CollectionProvider with ChangeNotifier {
  CurtedModel? curtedData;

  getImages(BuildContext context) {
    ApiWalpapper().getCollections().then((value) => {
          if (value != null && value.err == null)
            {
              curtedData = value,
              notifyListeners()
            }
          else if (value != null && value.err == "SocketException")
            {
              curtedData = value,
              notifyListeners(),
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("check your internet connection")))
            }
          else
            {
              curtedData = value,
              notifyListeners(),
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("somthing went wrong..")))
            }
        });
  }
}
