import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  AppBackground(this.child);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/wood_pallet_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
