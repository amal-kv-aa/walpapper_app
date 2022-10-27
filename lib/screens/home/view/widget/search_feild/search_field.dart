import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/search/provider/search_provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextField(
            onChanged: (String title) {
              context.read<SearchProvider>().filter(title);
            },
            controller: context.watch<SearchProvider>().searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(15),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: "Find walpapper...",
              hintStyle: const TextStyle(fontSize: 20,color: Colors.black45),
              suffixIcon: IconButton(
                icon:  Icon(Icons.search,color:context.watch<SearchProvider>().isShow ? Colors.cyan : Colors.black45,),
                color: Colors.black45,
                onPressed: () {
                  context.read<SearchProvider>().toSearch(context,context.watch<SearchProvider>().searchController.text);
                },
              ),
            ),
          ),
        ),
        context.watch<SearchProvider>().isShow
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 160.h,
                  child: ListView.builder(
                    itemCount: context.watch<SearchProvider>().search.length,
                    itemBuilder: (context, index) {
                      final temp = context.watch<SearchProvider>().search;
                      return Column(
                        children: [
                          ListTile(
                            onTap: () { context
                                .read<SearchProvider>()
                                .searchController
                                .text = temp[index];
                                context.read<SearchProvider>().toSearch(context,context.read<SearchProvider>().searchController.text);
                                },
                            title: Text(
                              temp[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
