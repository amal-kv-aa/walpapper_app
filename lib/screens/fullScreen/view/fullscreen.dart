import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walpapper_app/screens/fullScreen/view/widget/button.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover)),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  const [
                CustomButton(icon: Icons.info_outline,text: "info"),
                 CustomButton(icon:Icons.download,text: "download"),
                  CustomButton(icon:Icons.brush,text: "Apply",color: Colors.blue,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
