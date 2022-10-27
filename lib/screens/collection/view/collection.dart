import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/collection/provider/provider.dart';
import 'package:walpapper_app/screens/fullScreen/view/fullscreen.dart';
import 'package:walpapper_app/screens/services/api/api_images.dart';

class Collection extends StatelessWidget {
  const Collection({Key? key,}) : super(key: key);
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
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 30.h),
                        child: Center(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                   SizedBox(
                                    width: 20.h,
                                  ),
                                  Text(
                                    "Nature",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const Text("36 walpappers availble"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(child:
                       Consumer<CollectionProvider>(

                          builder: (context, value, child) {
                            
                        final item = value.curtedData;
                        if (item == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return GridView.custom(
                              physics:  const BouncingScrollPhysics(),
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0,
                                crossAxisSpacing: 0,
                                pattern: [
                                  const WovenGridTile(1),
                                   const WovenGridTile(
                                    2.2 /3 ,
                                    crossAxisRatio: 1,
                                  ),
                                ],
                              ),
                              childrenDelegate: SliverChildBuilderDelegate(
                                  childCount: item.photos.length,
                                  (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      height: 50.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) => FullScreen(
                                                      url: item.photos[index]
                                                          .src.original)));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    item.photos[index].src
                                                        .original,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                      )),
                                );
                              }));
                        }
                      }))
                    ])))));
  }
}
