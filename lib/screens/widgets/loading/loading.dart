
import 'package:flutter/material.dart';

class Loading {
  BuildContext context;
  Loading(this.context);
  void progressbar(bool show) {
    if (show == true) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Center(
                child: AlertDialog(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    content: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 30,),
                        Text("Loading pleas wait..",style: TextStyle(color: Colors.cyan),),
                        
                      ],
                    ),),
                    ),
              ),
                  
            );
          });
    } else {
      return
      Navigator.pop(context);
    }
  }
}
