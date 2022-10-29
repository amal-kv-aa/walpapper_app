import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/collection/provider/provider.dart';
import 'package:walpapper_app/screens/collection/view/collection.dart';
import 'package:walpapper_app/screens/fullScreen/view/fullscreen.dart';
import 'package:walpapper_app/screens/home/view/widget/bottomnav/bottomnav.dart';
import 'package:walpapper_app/screens/home/view/widget/card/custom_card.dart';
import 'package:walpapper_app/screens/home/view/widget/search_feild/search_field.dart';
import 'package:walpapper_app/screens/search/provider/search_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Colors.brown,
      Colors.yellow,
      Colors.blue,
      Colors.orange,
      Colors.green,
      Colors.white,
      Colors.red,
      Colors.purple
    ];
    List<String> colorName = [
      "brown",
      "yellow",
      "blue",
      "orange",
      "green",
      "white",
      "red",
      "purple"
    ];
    context.read<CollectionProvider>().getImages(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer<CollectionProvider>(
        builder: (context, value, child) {
          if (value.curtedData == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.curtedData?.err != null) {
            return SafeArea(
              child: Center(
                child: RefreshIndicator(
                  onRefresh: (){
                    return
                    context.read<CollectionProvider>().getImages(context);
                  },
                      
                  child: ListView(
                    children: [
                      SizedBox(height: 100.h,),
                      Image.asset("assets/something-went-wrong-gif-7.gif"),
                      SizedBox(
                        height: 20.h,
                      ),
                       Center(child: Column(
                        children: const [
                          Text("check your internet connection"),
                          Text("and refresh !")
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.r),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  const SearchField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 20.w),
                        child: Text(
                          "Best of month",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      TextButton(
                          child: const Text("view all >"),
                          onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (ctx) => const Collection()),
                              )),
                    ],
                  ),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: color.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => FullScreen(color: color[index],
                                      url: value
                                          .curtedData!.photos[index].src))),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 160.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: NetworkImage(value.curtedData!
                                          .photos[index].src.landscape),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 20.w),
                      child: Text(
                        "The Color Tone",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  SizedBox(
                    height: 60,
                    child: Consumer<CollectionProvider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: color.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<SearchProvider>()
                                    .toSearchColorTune(
                                        context,
                                        colorName[index].toString(),
                                        color[index]);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10.r),
                                child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: color[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    child: Text(
                      "Categories",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Consumer<CollectionProvider>(
                    builder: (context, value, child) {
                      return SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                            flex: 3,
                                            child: CustomCard(
                                                title: 'Nature',
                                                image: "assets/th.jpg")),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        const Expanded(
                                            flex: 3,
                                            child: CustomCard(
                                                title: "Animals",
                                                image: "assets/th (2).jpg"))
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.r),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                            flex: 3,
                                            child: CustomCard(
                                                title: "Sky",
                                                image:
                                                    "assets/wp8092186.webp")),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        const Expanded(
                                            flex: 3,
                                            child: CustomCard(
                                                title: "Ocean",
                                                image: "assets/th (1).jpg"))
                                      ],
                                    ),
                                  )),
                            ],
                          ));
                    },
                  )
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const BottomNavItem(),
    );
  }
}
