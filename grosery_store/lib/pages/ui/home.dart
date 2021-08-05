import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:grosery_store/pages/constants.dart';
import 'package:grosery_store/pages/providers/home.dart';
import 'package:grosery_store/pages/ui/widgets/appBar.dart';

const double _CARD_BAR_HEIGHT = 100.0;

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  void _onVerticalGesture(BuildContext context, DragUpdateDetails details) {
    final homeProvider = context.read<HomeProvider>();
    if (details.primaryDelta < -7) {
      homeProvider.animationController.reverse();
      homeProvider.changeStateDetail();
    } else if (details.primaryDelta > 12) {
      homeProvider.animationController.forward();
      homeProvider.changeStateNormal();
    }
  }

  double _getTopForWithePanel(HomeProvider homeProvider, Size size) {
    final stateGrosery = homeProvider.stateGrosery;

    if (stateGrosery == GroseryState.normal) {
      return 0.0;
    }
    return -(size.height + _CARD_BAR_HEIGHT) / 1.8;
  }

  double _getTopForBlackPanel(HomeProvider homeProvider, Size size) {
    final stateGrosery = homeProvider.stateGrosery;

    if (stateGrosery == GroseryState.normal) {
      return (size.height - (_CARD_BAR_HEIGHT * 2.05));
    }
    return _CARD_BAR_HEIGHT;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarComponent(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            height: size.height - _CARD_BAR_HEIGHT,
            top: _getTopForWithePanel(homeProvider, size),
            duration: kThemeAnimationDuration,
            child: Container(
              margin: const EdgeInsets.only(bottom: 110),
              decoration: BoxDecoration(
                color: Constants.backgroudColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                itemCount: 100,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) => FlutterLogo(),
              ),
            ),
          ),
          AnimatedPositioned(
            left: 0,
            right: 0,
            duration: kThemeAnimationDuration,
            top: _getTopForBlackPanel(homeProvider, size),
            height: size.height,
            child: GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) =>
                  _onVerticalGesture(context, details),
              child: Container(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
