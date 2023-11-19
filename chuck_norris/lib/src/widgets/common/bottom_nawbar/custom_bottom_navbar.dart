import 'package:chuck_norris/src/widgets/common/bottom_nawbar/animated_icon_button.dart';
import 'package:chuck_norris/src/constants/colors.dart';
import 'package:flutter/material.dart';

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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height * 0.105,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              size: Size(width, height * 0.09),
              painter: BNBCustomPainter(),
            ),
          ),
          SizedBox(
            width: width,
            height: height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedIconButton(
                    icon: Icons.favorite,
                    iconColor: currentIndex == 0
                        ? CustomColors.themColor
                        : CustomColors.disabledColor,
                    onPressed: () {
                      setBottomBarIndex(0);
                    }),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                AnimatedIconButton(
                    icon: Icons.category,
                    iconColor: currentIndex == 2
                        ? CustomColors.themColor
                        : CustomColors.disabledColor,
                    onPressed: () {
                      setBottomBarIndex(2);
                    }),
              ],
            ),
          ),
          Center(
            heightFactor: 0.1,
            child: SizedBox(
              height: height * 0.09,
              width: height * 0.09,
              child: FloatingActionButton(
                backgroundColor: currentIndex == 1
                    ? CustomColors.themColor
                    : CustomColors.lightThemeColor,
                shape: const CircleBorder(),
                elevation: 2,
                isExtended: true,
                onPressed: () {},
                child: AnimatedIconButton(
                    icon: Icons.search,
                    iconColor: currentIndex == 1
                        ? CustomColors.lightThemeColor
                        : CustomColors.disabledColor,
                    onPressed: () {
                      setBottomBarIndex(1);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = CustomColors.lightThemeColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 80);
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.13, 0);
    path.lineTo(size.width * 0.25, 0);
    path.quadraticBezierTo(size.width * 0.32, 0, size.width * 0.35, 10);
    path.quadraticBezierTo(size.width * 0.45, 36, size.width * 0.5, 35);
    path.quadraticBezierTo(size.width * 0.55, 36, size.width * 0.65, 10);
    path.quadraticBezierTo(size.width * 0.68, 0, size.width * 0.75, 0);
    path.lineTo(size.width * 0.87, 0);
    path.quadraticBezierTo(size.width * 1.0, 0, size.width * 1, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, CustomColors.darkThemeColor, 15, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
