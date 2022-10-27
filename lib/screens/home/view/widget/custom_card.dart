import 'package:flutter/material.dart';
import 'package:walpapper_app/screens/collection/view/home.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Collection(),))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),
        child: const Center(
          child: Text(
            "Natural",
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

