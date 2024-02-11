import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ihateu/intopage/page1.dart';
import 'package:ihateu/intopage/page2.dart';
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
                onlaste = (index == 1);
              });
            },
            children: const [Page1(), page2()],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 40), // Increase padding for SmoothPageIndicator
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 2,
                      effect: SwapEffect(
                        activeDotColor: Colors.white,
                        dotColor: Colors.white.withOpacity(0.5),
                        dotHeight: 20,
                        dotWidth: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20, // Adjust the bottom padding for the IconButton
                  right: 20, // Adjust the right padding for the IconButton
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      onlaste
                          ? IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const pagemain(),
                                    ));
                              },
                              icon: const Icon(Icons.check),
                              color: const Color.fromARGB(255, 94, 218, 209),
                              iconSize: 50)
                          : IconButton(
                              onPressed: () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                              color: Colors.white,
                              iconSize: 50,
                            ) // Adjust the width between IconButton and screen edge as needed
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
