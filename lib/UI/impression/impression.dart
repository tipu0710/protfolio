import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Impression extends StatefulWidget {
  @override
  _ImpressionState createState() => _ImpressionState();
}

class _ImpressionState extends State<Impression> {
  @override
  Widget build(BuildContext context) {
    return nameProfile();
  }

  Widget nameProfile() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: namePart()),
          Flexible(
            child: Container(
              child: Image.asset("assets/me.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget namePart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText('Hello, I am\n',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 41,
              color: const Color(0xff0E0C38),
              fontWeight: FontWeight.w300,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 300.0,
              minHeight: 30.0,
              maxHeight: MediaQuery.of(context).size.width/2.5,
            ),
            child: AutoSizeText(
              'Tipu\nSultan\n',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: const Color(0xff0E0C38),
                fontWeight: FontWeight.w700,
                fontSize: 120
              ),
              minFontSize: 10,
              maxFontSize: 120,
              maxLines: 2,
            ),
          ),
          AutoSizeText.rich(
            TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Color(0xff0E0C38)
              ),
              children: [
                TextSpan(
                  text: 'A young ',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: 'MOBILE APP',
                  style: TextStyle(
                    color: const Color(0xffff0513),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: ' developer expert in Flutter and Java',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ]
            ),

          ),
        ],
      );
  }
}
