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

// //=================search====walpapper============//
//   toSearch(BuildContext context, String name) {
//     Loading(context).progressbar(true);
//     ApiWalpapper().getwalpapper(name).then((value) => {
//           if (value != null)
//             {
//               searchData = value,
//               notifyListeners(),
//               Loading(context).progressbar(false),
//               Navigator.of(context)
//                   .push(MaterialPageRoute(
//                       builder: (ctx) => SearchWalpapper(
//                             title: name,
//                           )))
//                   .whenComplete(() {
//                 searchController.clear();
//                 notifyListeners();
//               })
//             }
//           else
//             {
//               Loading(context).progressbar(false),
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   backgroundColor: Theme.of(context).backgroundColor,
//                   behavior: SnackBarBehavior.floating,
//                   content: const Text(
//                       "somthing went wrong\n (check your internet connection)",style: TextStyle(color: Colors.black45),)))
//             }
//         });
//   }

  //=================search====walpapper============//
  toSearch(BuildContext context,String?name) {
    Loading(context).progressbar(true);
    ApiWalpapper().getwalpapper(name ?? searchController.text.trim()).then((value){
          if (value != null && value.err == null)
            {
             searchData = value;
              notifyListeners();
              Loading(context).progressbar(false);
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (ctx) => SearchWalpapper(
                            title:name ?? searchController.text,
                          )))
                  .whenComplete(() {
                searchController.clear();
                notifyListeners();
              });
            }
          else if (value != null && value.err == "SocketException")
            {
              searchData = value;
              notifyListeners();
              Loading(context).progressbar(false);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("check your internet connection")));
            }
          else
            {
              searchData = value;
              notifyListeners();
              Loading(context).progressbar(false);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("somthing went wrong..")));
            }
        });
  }

  //=================filter======search==========//
  filter(String value) {
    if (value.isEmpty) {
      searchController.clear();
      notifyListeners();
      return;
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

 toSearchColorTune(BuildContext context,String colorname,Color color) {
    Loading(context).progressbar(true);
   //
   ApiWalpapper().getbyColorTune(colorname).then((value) {
     if (value != null && value.err == null)
            {
             searchData = value;
              notifyListeners();
              Loading(context).progressbar(false);
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (ctx) => SearchWalpapper(
                            title: colorname,
                            color:color
                          )))
                  .whenComplete(() {
                searchController.clear();
                notifyListeners();
              });
            }
          else if (value != null && value.err == "SocketException")
            {
              searchData = value;
              notifyListeners();
              Loading(context).progressbar(false);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("check your internet connection")));
            }
          else
            {
              searchData = value;
              notifyListeners();
              Loading(context).progressbar(false);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("somthing went wrong..")));
            }
   });
            //
   
 }
}
