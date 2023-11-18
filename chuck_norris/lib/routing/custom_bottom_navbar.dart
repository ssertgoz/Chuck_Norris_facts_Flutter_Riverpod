import 'package:chuck_norris/routing/animated_icon_button.dart';
import 'package:flutter/material.dart';

import '../src/constants/colors.dart';

class CustomBottomNawBar extends StatefulWidget {
  final void Function(int index) callback;
  const CustomBottomNawBar({super.key, required this.callback});

  @override
  CustomBottomNawBarState createState() => CustomBottomNawBarState();
}

class CustomBottomNawBarState extends State<CustomBottomNawBar> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      widget.callback(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedIconButton(
                            icon: Icons.category,
                            iconColor:
                                currentIndex == 0 ? themColor : disabledColor,
                            onPressed: () {
                              setBottomBarIndex(0);
                            }),
                        SizedBox(
                          width: 50,
                        ),
                        AnimatedIconButton(
                            icon: Icons.favorite,
                            iconColor:
                                currentIndex == 2 ? themColor : disabledColor,
                            onPressed: () {
                              setBottomBarIndex(2);
                            }),
                      ],
                    ),
                  ),
                  Center(
                    heightFactor: 0.1,
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: FloatingActionButton(
                        backgroundColor:
                            currentIndex == 1 ? themColor : lightThemeColor,
                        shape: const CircleBorder(),
                        elevation: 2,
                        isExtended: true,
                        onPressed: () {},
                        child: AnimatedIconButton(
                            icon: Icons.search,
                            iconColor: currentIndex == 1
                                ? lightThemeColor
                                : disabledColor,
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = lightThemeColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 80);
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.13, 0);
    path.lineTo(size.width * 0.25, 0);
    path.quadraticBezierTo(size.width * 0.32, 0, size.width * 0.35, 10);
    // path.arcToPoint(Offset(size.width * 0.55, 30),
    //     radius: Radius.circular(50.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.45, 36, size.width * 0.5, 35);
    path.quadraticBezierTo(size.width * 0.55, 36, size.width * 0.65, 10);
    //path.lineTo(size.width * 0.65, 10);
    path.quadraticBezierTo(size.width * 0.68, 0, size.width * 0.75, 0);
    path.lineTo(size.width * 0.87, 0);
    path.quadraticBezierTo(size.width * 1.0, 0, size.width * 1, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    //path.lineTo(0, 20);
    canvas.drawShadow(path, darkThemeColor, 15, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
