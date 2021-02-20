library flutter_onboarding_slider;
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/onboarding_slider.dart';

class OnBoardingSliderScreen extends StatefulWidget {

  List<OnboardingSliderWidget> children;
  MaterialPageRoute pageRoute;
  OnBoardingSliderScreen({this.children, this.pageRoute});

  @override
  _OnBoardingSliderScreenState createState() => _OnBoardingSliderScreenState();
}

class _OnBoardingSliderScreenState extends State<OnBoardingSliderScreen> {
  PageController pageController = PageController();
  int currentPage = 0;
  bool lastPage = true;
  void _onPageChanged(int position){
    pageController.addListener(() {
      setState(() {
        if(currentPage==widget.children.length-1){
          lastPage=true;
        }
        else{
          lastPage=false;
        }
      });
    });
  }
  void skipPage(BuildContext context){
    Navigator.of(context).push(widget.pageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: new Color(0xFFEEEEEE),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: PageView(
              children: widget.children,
              controller: pageController,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlatButton(onPressed: (){
                  lastPage?null:skipPage(context);
                },
                    child: Text(lastPage?"":"SKIP",style:  TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0))),
                FlatButton(
                  child: Text(
                    lastPage ? "GOT IT" : "NEXT",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  onPressed: (){
                    lastPage ? skipPage(context) : pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn
                    );
                  },
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
