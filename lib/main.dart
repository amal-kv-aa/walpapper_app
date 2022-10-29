import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:walpapper_app/screens/collection/provider/provider.dart';
import 'package:walpapper_app/screens/fullScreen/provider/download_provider.dart';
import 'package:walpapper_app/screens/home/view/home.dart';
import 'package:walpapper_app/screens/search/provider/search_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CollectionProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),ChangeNotifierProvider(create: (_)=>DownloadProvider())
      ],
      child:  const MiApp(),
    ),
  );
}
class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, index) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: const Color.fromARGB(255, 216, 236, 229),
            primarySwatch: Colors.cyan,
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 40),
              titleMedium: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
          home: const Home(),
        );
      },
      designSize: const Size(375, 812),
    );
  }
}
