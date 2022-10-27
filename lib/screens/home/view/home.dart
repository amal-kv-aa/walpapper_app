import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/collection/provider/provider.dart';
import 'package:walpapper_app/screens/fullScreen/view/fullscreen.dart';
import 'package:walpapper_app/screens/home/view/widget/custom_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List color = [
      const Color.fromARGB(255, 255, 125, 168),
      Colors.yellow,
      Colors.blue,
      Colors.orange,
      Colors.green,
      Colors.cyan,
      Colors.red,
      Colors.purple
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          if (value.curtedData == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Find walpapper...",
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Text(
                      "Best of month",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
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
                                  builder: (ctx) => FullScreen(
                                      url: value.curtedData!.photos[index + 15]
                                          .src.landscape))),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: NetworkImage(value.curtedData!
                                          .photos[index + 15].src.landscape),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Text(
                        "The Color Tone",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  SizedBox(
                    height: 60,
                    child: Consumer<HomeProvider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: color.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: color[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Text(
                      "Categories",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Consumer<HomeProvider>(
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: CustomCard(
                                                  image: value
                                                      .curtedData!
                                                      .photos[30]
                                                      .src
                                                      .landscape)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: CustomCard(
                                                  image: value
                                                      .curtedData!
                                                      .photos[30]
                                                      .src
                                                      .landscape))
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: CustomCard(
                                                  image: value
                                                      .curtedData!
                                                      .photos[30]
                                                      .src
                                                      .landscape)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: CustomCard(
                                                  image: value
                                                      .curtedData!
                                                      .photos[30]
                                                      .src
                                                      .landscape))
                                        ],
                                      ),
                                    )),
                              ],
                            )),
                      );
                    },
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
