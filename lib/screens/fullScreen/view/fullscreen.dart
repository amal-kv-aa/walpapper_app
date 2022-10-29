import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/collection/model/curted_models.dart';
import 'package:walpapper_app/screens/fullScreen/provider/download_provider.dart';
import 'package:walpapper_app/screens/fullScreen/view/widget/button.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key? key, required this.url,required this.color}) : super(key: key);
  final Src url;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: color,
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
              children: [
                const CustomButton(icon: Icons.info_outline, text: "info"),
                const CustomButton(icon: Icons.download, text: "download"),
                GestureDetector(
                  onTap: () {
                    context.read<DownloadProvider>().dowloadImage(context, url.original);
                  },
                  child: const CustomButton(
                    icon: Icons.brush,
                    text: "Apply",
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
