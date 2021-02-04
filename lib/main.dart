import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:protfolio/UI/impression/impression.dart';
import 'package:protfolio/global.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: primaryColor,
      ),
      home: MyHomePage(),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: Color(0xFFF5F5F5),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          titleWidget('About'),
          titleWidget('Portfolio'),
          titleWidget('Contact'),
          titleWidget('Get Started'),
        ],
      ),
      body: Swiper(
        itemCount: 3,
        pagination: SwiperPagination(),
        controller: SwiperController(),
        scrollDirection: Axis.vertical,
        loop: false,
        itemBuilder: (_, index){
          switch(index){
            case 0:
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Impression(),
                    ],
                  ),
                ),
              );
              break;
            case 1:
              return Container(height: MediaQuery.of(context).size.height, color: Colors.deepPurple,);
              break;
            default:
              return Container(height: MediaQuery.of(context).size.height, color: Colors.blue,);
              break;
          }
        },
      )
    );
  }

  Widget titleWidget(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Muli',
        fontSize: 16,
        color: const Color(0xff66667e),
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.left,
    ).moveUpOnHover;
  }
}
