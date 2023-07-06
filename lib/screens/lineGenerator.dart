import 'package:doodle_part1/constants.dart';
import 'package:doodle_part1/provider/lineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LineGenerator extends StatefulWidget {
  const LineGenerator({super.key});

  @override
  State<LineGenerator> createState() => _LineGeneratorState();
}

class _LineGeneratorState extends State<LineGenerator> {
  int tapCounter = 0;
  bool drawn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              child: const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Mark any two points to generate a line in canvas, tapping after the line is formed will result in deletion!',
                  style: TextStyle(
                    color: kRoseGoldColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child:
                  Consumer<LineProvider>(builder: (context, provider, child) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    bottom: 10,
                    right: 10,
                  ),
                  color: kCottonMuslinColor,
                  width: double.maxFinite,
                  child: Consumer<LineProvider>(
                      builder: (context, provider, child) {
                    return CustomPaint(
                      foregroundPainter: LinePainter(
                        p1: provider.p1,
                        p2: provider.p2,
                        tapCounter: tapCounter,
                      ),
                      child: GestureDetector(
                        onTapDown: (details) {
                          if (drawn == true) {
                            provider.setP1(null);
                            provider.setP2(null);
                            setState(() {});
                            drawn = false;
                            return;
                          }
                          if (tapCounter == 0) {
                            var position = details.localPosition;
                            Offset p1 = Offset(position.dx, position.dy);
                            provider.setP1(p1);
                            setState(() {});
                            tapCounter++;
                            return;
                          }
                          if (tapCounter == 1) {
                            var position = details.localPosition;
                            Offset p2 = Offset(position.dx, position.dy);
                            provider.setP2(p2);
                            setState(() {});
                            tapCounter = 0;
                            drawn = true;
                            return;
                          }
                        },
                        onPanDown: (details) {},
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  LinePainter({required this.p1, required this.p2, required this.tapCounter});

  Offset? p1;
  Offset? p2;
  int tapCounter;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kBlackColor
      ..strokeWidth = 5;

    if (p1 != null) {
      canvas.drawCircle(p1!, 10, paint);
    }

    if (p1 != null && p2 != null) {
      canvas.drawCircle(p2!, 10, paint);
      canvas.drawLine(p1!, p2!, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
