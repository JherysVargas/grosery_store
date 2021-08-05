import 'package:flutter/material.dart';
import 'package:grosery_store/pages/constants.dart';
import 'package:provider/provider.dart';
import 'package:grosery_store/pages/providers/home.dart';

class AppBarComponent extends StatefulWidget implements PreferredSizeWidget {
  const AppBarComponent({
    Key key,
  }) : super(key: key);

  @override
  _AppBarComponentState createState() => _AppBarComponentState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarComponentState extends State<AppBarComponent>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    AnimationController controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 70),
      value: 1.0,
    );
    context.read<HomeProvider>().init(controller);
  }

  @override
  void dispose() {
    super.dispose();
    context.read<HomeProvider>().animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = context.watch<HomeProvider>().animationController;
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: -1.0,
      child: AppBar(
        backgroundColor: Constants.backgroudColor,
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: false,
        title: Text(
          'Fruits and vegetables',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
