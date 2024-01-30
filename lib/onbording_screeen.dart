import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ihateu/intopage/page1.dart';
import 'package:ihateu/intopage/page2.dart';
import 'package:ihateu/intopage/page3.dart';
import 'package:ihateu/commme/comme.dart';
import 'package:ihateu/screens/1.dart';

class onbordingScreen extends StatefulWidget {
  const onbordingScreen({super.key});

  @override
  State<onbordingScreen> createState() => _onbordingScreenState();
}

class _onbordingScreenState extends State<onbordingScreen> {
  final PageController _controller = PageController();
  bool onlaste = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onlaste = (index == 2);
              });
            },
            children: const [
              page1(),
              page2(),
              page3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Text(
                      'skip',
                      style: Common().mediumThemeblack,
                    ),
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  onlaste
                      ? GestureDetector(
                          child: Text(
                            'doon',
                            style: Common().mediumThemeblack,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const home(),
                                ));
                          },
                        )
                      : GestureDetector(
                          child: Text(
                            'next',
                            style: Common().mediumThemeblack,
                          ),
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
