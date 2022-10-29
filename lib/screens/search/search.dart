import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/fullScreen/view/fullscreen.dart';
import 'package:walpapper_app/screens/search/provider/search_provider.dart';
import 'package:walpapper_app/screens/widgets/color/color_from_api.dart';

class SearchWalpapper extends StatelessWidget {
  const SearchWalpapper({Key? key, required this.title, this.color}) : super(key: key);
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color ?? Theme.of(context).backgroundColor,
        body: SafeArea(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: Center(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 20.h,
                              ),
                              Text(
                                title.toUpperCase(),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Text("36 walpappers availble"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Consumer<SearchProvider>(
                      builder: (context, value, child) {
                    final item = value.searchData;
                    if (item == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: GridView.custom(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: SliverWovenGridDelegate.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              pattern: [
                                const WovenGridTile(1),
                                const WovenGridTile(
                                  3 / 3.5,
                                  crossAxisRatio: 1,
                                ),
                              ],
                            ),
                            childrenDelegate: SliverChildBuilderDelegate(
                                childCount: item.photos.length,
                                (context, index) {
                              final color = item.photos[index].avgColor
                                  .replaceFirst('#', '');
                              Color colorFromImage = HexColor(color);
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    height: 50.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: colorFromImage,
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) => FullScreen(
                                                    color: colorFromImage,
                                                      url: item
                                                          .photos[index].src)));
                                        },
                                        child: FadeInImage(
                                          placeholder: NetworkImage(
                                            item.photos[index].src.portrait,
                                          ),
                                          image: NetworkImage(
                                            item.photos[index].src.original,
                                          ),
                                          fit: BoxFit.cover,
                                        ))),
                              );
                            })),
                      );
                    }
                  }))
                ]))));
  }
}
