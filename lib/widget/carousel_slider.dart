import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    super.key,
    required this.items,
  });

  final List items;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

PageController _pageController = PageController();

class _CarouselSliderState extends State<CarouselSlider> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.22,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.items.length,
            onPageChanged: (int currentIndex) {
              newIndex = currentIndex;
            },
            itemBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Image.asset(
                  widget.items[index],
                  scale: 3,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 25),
        SmoothPageIndicator(
          controller: _pageController,
          effect: const WormEffect(
            dotColor: Colors.white,
            activeDotColor: Colors.deepOrange,
          ),
          count: widget.items.length,
        ),
      ],
    );
  }
}
