import 'package:daxbier_app/utility/app_constant.dart';
import 'package:daxbier_app/utility/color_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingEnterAnimation {
  OnBoardingEnterAnimation(this.controller)
      : colorAnimation = new ColorTween(
          begin: Color(getColorHexFromStr(BemVindoColor)),
          end: Color(getColorHexFromStr(BemVindoColor)),
        ).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.2,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<Color> colorAnimation;
}
