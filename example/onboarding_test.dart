import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_onboarding_slider/onboarding_slider.dart';
class OnboardingTest extends StatelessWidget {

  List<OnboardingSliderWidget> _list=[
    OnboardingSliderWidget(
      title: "Title 1",
      content: "Content 1",
      iconData: Icons.restaurant_menu,
    ),
    OnboardingSliderWidget(
      title: "Title 2",
      content: "Content 2",
      iconData: Icons.search,
    ),
    OnboardingSliderWidget(
      title: "Title 3",
      content: "Content 3",
      iconData: Icons.shopping_cart,
    ),
    OnboardingSliderWidget(
      title: "Title 4",
      content: "Content 4",
      iconData: Icons.verified_user,
    )
  ];


  @override
  Widget build(BuildContext context) {
    return OnBoardingSliderScreen(
     children: _list,
      pageRoute: MaterialPageRoute(builder: (context)=>OnboardingTest()),
    );
  }
}
