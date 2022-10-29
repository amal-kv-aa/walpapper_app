import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/collection/provider/provider.dart';
import 'package:walpapper_app/screens/fullScreen/view/fullscreen.dart';
import 'package:walpapper_app/screens/services/api/api_images.dart';
import 'package:walpapper_app/screens/widgets/color/color_from_api.dart';

class Collection extends StatelessWidget {
  const Collection({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: RefreshIndicator(
                    onRefresh: () => ApiWalpapper().getCollections(),
                    child: Column(children: [
                      Expanded(child: Consumer<CollectionProvider>(
                          builder: (context, value, child) {
                        final item = value.curtedData;
                        if (item == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return GridView.custom(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 0,
                                pattern: [
                                  const WovenGridTile(1),
                                  const WovenGridTile(
                                    4 / 3.3,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                                    builder: (ctx) =>
                                                        FullScreen(color: colorFromImage,
                                                            url: item
                                                                .photos[index]
                                                                .src)));
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
                              }));
                        }
                      }))
                    ])))));
  }
}
