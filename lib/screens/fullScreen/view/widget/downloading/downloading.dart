import 'package:flutter/material.dart';

class DownLoading {
  BuildContext context;
  DownLoading(this.context, this.data);
  String data;
   progressbar() {
      showDialog(
          context: context,
          barrierDismissible : true,
          builder: (BuildContext context) {
            return AlertDialog(
                elevation: 0,
                backgroundColor: Colors.white,
                title: Center(
                  child: Text("Downloading.. $data",style: const TextStyle(fontSize: 20),),
                ));
          });
    
  }
}
