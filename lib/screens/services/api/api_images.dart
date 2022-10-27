import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:walpapper_app/screens/collection/model/curted_models.dart';

class ApiWalpapper {
  Future<CurtedModel?> getCollections() async {
    Dio dio = Dio();
    try {
      log("enterd");
      dio.options.headers["Authorization"] =
          "563492ad6f91700001000001cd3a459c0cc24507af51c11d4251af07";
      final response = await dio.get(
        "https://api.pexels.com/v1/curated?per_page=80",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("success");
        return CurtedModel.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      log(e.message);
      return null;
    }
  }

  //==============search=======image=================//
  Future<CurtedModel?> getwalpapper(String name) async {
    Dio dio = Dio();
    try {
      log("enterd");
      dio.options.headers["Authorization"] =
          "563492ad6f91700001000001cd3a459c0cc24507af51c11d4251af07";
      final response = await dio.get(
        "https://api.pexels.com/v1/search?query=$name&per_page=15",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("success");
        final data = CurtedModel.fromJson(response.data);
        log(data.photos[0].src.large);
        return CurtedModel.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      log(e.message);
      return null;
    }
  }
}
