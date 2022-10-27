import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walpapper_app/screens/collection/model/curted_models.dart';
import 'package:walpapper_app/screens/fullScreen/view/widget/button.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key? key, required this.url}) : super(key: key);
  final Src url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: FadeInImage(
                placeholder: NetworkImage(
                  url.portrait,
                ),
                fadeInDuration: const Duration(milliseconds: 300),
                image: NetworkImage(
                  url.original,
                ),
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CustomButton(icon: Icons.info_outline, text: "info"),
                CustomButton(icon: Icons.download, text: "download"),
                CustomButton(
                  icon: Icons.brush,
                  text: "Apply",
                  color: Colors.blue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
