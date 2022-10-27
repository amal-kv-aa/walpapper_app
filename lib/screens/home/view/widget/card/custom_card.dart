import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../search/provider/search_provider.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.image,required this.title}) : super(key: key);
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() =>   context.read<SearchProvider>().toSearch(context,title)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child:  Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

