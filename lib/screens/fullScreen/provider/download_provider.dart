import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';

class DownloadProvider with ChangeNotifier {
  Stream<String>? progressString;

  String? res;

  bool downloading = false;

  bool isDisable = false;

  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";

//=================set===Homescreen=========//
  void setHomeScreen(double height, double width) async {
    home = await Wallpaper.homeScreen(
        options: RequestSizeOptions.RESIZE_FIT, width: width, height: height);
    downloading = false;
    home = home;
    notifyListeners();
    log("Task Done");
  }

//=================lock==screen=============//
  void setLockScreen() async {
    lock = await Wallpaper.lockScreen();
    downloading = false;
    lock = lock;
    notifyListeners();
    log("Task Done");
  }

//=============both==screen================//
  Future setBothScreen() async {
    both = await Wallpaper.bothScreen();
    downloading = false;
    both = both;
    log("Task Done");
  }

//=============Downloaad====image==========//
  Future<void> dowloadImage(BuildContext context, imageUrl) async {
    progressString = Wallpaper.imageDownloadProgress(imageUrl);
    progressString!.listen((data) {
      res = data;
      notifyListeners();
      log("DataReceived: $data");
    }, onDone: () async {
      log("Task Done");
      setBothScreen().then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Theme.of(context).backgroundColor,
            behavior: SnackBarBehavior.floating,
            content: const Text(
              "walpapper seted",
              style: TextStyle(color: Colors.black),
            )));
      });
    }, onError: (error) {
      downloading = false;
      isDisable = true;
      notifyListeners();
      log("Some Error");
    });
  }
}
