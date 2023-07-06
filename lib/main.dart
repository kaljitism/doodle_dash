import 'package:doodle_part1/constants.dart';
import 'package:doodle_part1/provider/lineProvider.dart';
import 'package:doodle_part1/screens/lineGenerator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LineProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 6,
          child: Scaffold(
            backgroundColor: kBlackColor,
            appBar: AppBar(
              backgroundColor: kRoseGoldColor,
              bottom: TabBar(
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Tab(
                        icon: Icon(Icons.shape_line_outlined,
                            color: kBlackColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Tab(icon: Icon(Icons.circle, color: kBlackColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Tab(icon: Icon(Icons.rectangle, color: kBlackColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        Tab(icon: Icon(Icons.draw_rounded, color: kBlackColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Tab(icon: Icon(Icons.link, color: kBlackColor)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Tab(
                        icon:
                            Icon(Icons.animation_rounded, color: kBlackColor)),
                  ),
                ],
                physics: const AlwaysScrollableScrollPhysics(),
                overlayColor: MaterialStateProperty.all(kBlackColor),
                isScrollable: true,
                indicatorColor: kCottonMuslinColor,
              ),
            ),
            body: TabBarView(
              children: [
                const LineGenerator(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
