import 'package:flutter/material.dart';
class OnboardingSliderWidget extends StatefulWidget {

  final String title;
  final String content;
  final IconData iconData;
  final Color iconColor;
  OnboardingSliderWidget({this.title, this.content, this.iconData, this.iconColor=Colors.teal});
  @override
  _OnboardingSliderWidgetState createState() => _OnboardingSliderWidgetState();
}
class _OnboardingSliderWidgetState extends State<OnboardingSliderWidget>  with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    animationController=AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animation=Tween(begin: -250.0, end: 0.0).animate(CurvedAnimation(parent: animationController,curve: Curves.easeIn));
    animation.addListener(() {
      setState(() {});
    });
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 2.0,
        animationDuration: Duration(milliseconds: 500),
        borderRadius: BorderRadius.circular(6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform(transform: Matrix4.translationValues(animation.value, 0, 0),child:   Text(widget.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black))),
            Transform(
      transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
      child: Text(
        widget.content,
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.black),
      ),
    ),
            Icon(widget.iconData, size: 100.0, color: widget.iconColor,)
          ],
        ),
      ),
    );
  }
}
