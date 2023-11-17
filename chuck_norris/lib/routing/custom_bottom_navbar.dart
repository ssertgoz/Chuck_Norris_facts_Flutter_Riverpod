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
                        IconButton(
                          icon: Icon(
                            Icons.category,
                            color: currentIndex == 0
                                ? darkThemeColor
                                : Colors.grey.shade400,
                          ),
                          iconSize: size.width * 0.05,
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: currentIndex == 2
                                  ? darkThemeColor
                                  : Colors.grey.shade400,
                            ),
                            iconSize: size.width * 0.05,
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
                              currentIndex == 1 ? darkThemeColor : Colors.white,
                          shape: const CircleBorder(),
                          elevation: 5,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          isExtended: true,
                          onPressed: () {
                            setBottomBarIndex(1);
                          },
                          child: Icon(
                            Icons.search,
                            color: currentIndex == 1
                                ? themColor
                                : Colors.grey.shade400,
                            size: size.width * 0.05,
                          )),
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
      ..color = Colors.white
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
    canvas.drawShadow(path, Colors.black, 15, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
