import 'package:flutter/material.dart';
import 'package:protfolio/global.dart';

class TextHover extends StatefulWidget {
  final Widget child;

  TextHover({Key key, this.child}) : super(key: key);

  @override
  _TextHoverState createState() => _TextHoverState();
}

class _TextHoverState extends State<TextHover> {
  bool _hovering = false;

  Text text;
  Widget child;

  @override
  void initState() {
    text = widget.child;
    child = widget.child;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: Transform.scale(
          scale: _hovering ? 1.05 : 1,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, ),
              child: Container(
                height: 30,
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _hovering ? fontColor : Colors.transparent,
                        width: _hovering ? 1 : 0),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(child: text),
              ),
            ),
          ),
        ),
        curve: Curves.bounceInOut,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      if (hover) {
        text = Text(
          text.data,
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: 16,
            color: fontColor,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.left,
        );
      }else{
        text = Text(
          text.data,
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: 16,
            color: const Color(0xff66667e),
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.left,
        );
      }
      _hovering = hover;
    });
  }
}
