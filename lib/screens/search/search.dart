import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/fullScreen/view/fullscreen.dart';
import 'package:walpapper_app/screens/search/provider/search_provider.dart';

class SearchWalpapper extends StatelessWidget {
  const SearchWalpapper({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: RefreshIndicator(
                    onRefresh: () =>
                        context.read<SearchProvider>().toSearch(context,context.watch<SearchProvider>().searchController.text),
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
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
                                    title.toUpperCase(),
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
                      Expanded(child: Consumer<SearchProvider>(
                          builder: (context, value, child) {
                        final item = value.searchData;
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
                                    2.2 / 3,
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
