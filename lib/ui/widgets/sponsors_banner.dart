import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fantabasket_app_flutter/model/banner.dart';

class SponsorsBanner extends StatefulWidget {
  final List<BannerModel> banner;

  const SponsorsBanner({super.key, required this.banner});

  @override
  _SponsorsBannerState createState() => _SponsorsBannerState();
}

class _SponsorsBannerState extends State<SponsorsBanner> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < widget.banner.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height * 0.09);
    print(MediaQuery.of(context).size.width);
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.banner.length,
        itemBuilder: (context, index) {
          return Image.network(
            widget.banner[index].foto,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

class SponsorsBannerBlank extends StatelessWidget {
  const SponsorsBannerBlank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
