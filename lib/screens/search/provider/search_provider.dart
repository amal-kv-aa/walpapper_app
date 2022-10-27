import 'package:flutter/material.dart';
import 'package:walpapper_app/screens/widgets/loading/loading.dart';
import '../../collection/model/curted_models.dart';
import '../../services/api/api_images.dart';
import '../search.dart';

class SearchProvider with ChangeNotifier {
  List<String> temp = ["ocean", "nature", "wilde", "sky"];
  List<String> search = [];

  TextEditingController searchController = TextEditingController();
  bool isShow = false;
  CurtedModel? searchData;

//=================search====walpapper============//
  toSearch(BuildContext context, String name) {
    Loading(context).progressbar(true);
    ApiWalpapper().getwalpapper(name).then((value) => {
          if (value != null)
            {
              searchData = value,
              notifyListeners(),
              Loading(context).progressbar(false),
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (ctx) => SearchWalpapper(
                            title: name,
                          )))
                  .whenComplete(() => searchController.clear())
            }
        });
  }

  //=================filter======search==========//
  filter(String value) {
    if (value.isEmpty) {
      isShow = true;
      search.clear();
      search.addAll(temp);
      notifyListeners();
    } else {
      search.clear();
      isShow = true;
      notifyListeners();
      search = temp
          .where((song) => song.toLowerCase().startsWith(value.toLowerCase()))
          .toList();
      notifyListeners();
    }
  }
}
