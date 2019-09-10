import 'package:daxbier_app/Components/forward_button.dart';
import 'package:daxbier_app/Components/header_text.dart';
import 'package:daxbier_app/Components/trapozoid_cut_colored_image.dart';
import 'package:daxbier_app/Screens/welcome/welcome_animation.dart';
import 'package:daxbier_app/utility/app_constant.dart';
import 'package:daxbier_app/utility/color_utility.dart';
import 'package:flutter/material.dart';
abstract class GoToLoginListener {
  void onGoAheadTap();
}

class WelcomePage extends StatelessWidget {
  WelcomePage(
      {@required AnimationController controller,
      @required this.goTOLoginListener})
      : welcomeEnterAnimation = new WelcomeEnterAnimation(controller);

  final WelcomeEnterAnimation welcomeEnterAnimation;
  final GoToLoginListener goTOLoginListener;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Stack(
      children: <Widget>[
        _trapoziodView(size, textTheme),
        _buttonContainer(size),
      ],
    );
  }

  Widget _trapoziodView(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(
          0.0, -welcomeEnterAnimation.translation.value * size.height, 0.0),
      child: TrapozoidTopBar(
          child: Container(
        height: size.height * 0.7,
        color: Color(getColorHexFromStr('#E8F2F4')),
        child: Stack(
          children: <Widget>[
            _buildBackgroundImage(),
            _buildTextHeader(size, textTheme),
          ],
        ),
      )),
    );
  }

  Widget _buttonContainer(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.8),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Transform(
                  transform: Matrix4.translationValues(
                      -welcomeEnterAnimation.translation.value * 200, 0.0, 0.0),
                  child: HeaderText(
                    text: TextoWelcome,
                    imagePath: IMAGE_SLIPPER_PATH,
                  )),
            ),
            SizedBox(
              width: 16,
            ),
            Transform(
              transform: Matrix4.translationValues(
                  welcomeEnterAnimation.translation.value * 200, 0.0, 0.0),
              child: ForwardButton(
                onPressed: () {
                  goTOLoginListener.onGoAheadTap();
                },
                label: StartButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: new AssetImage(IMAGE_WELCOME_PATH),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _buildTextHeader(Size size, TextTheme textTheme) {
    return FadeTransition(
      opacity: welcomeEnterAnimation.titleLabelOpacity,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.15, left: 24, right: 24),
        child: Container(
          width: double.infinity,
          child: Text(
            TextoTelaIncial,
            style: textTheme.title.copyWith(
                color: Colors.orange[900],
                fontWeight: FontWeight.bold,
                wordSpacing: 1.2),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
