import 'package:fantabasket_app_flutter/model/banner.dart';
import 'package:flutter/material.dart';

class SponsorsBannerBlank extends StatelessWidget {
  const SponsorsBannerBlank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: MediaQuery.of(context).size.height * 0.09,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
    );
  }
}

class SponsorsBanner extends StatelessWidget {
  const SponsorsBanner({super.key, required this.banner});
  final BannerModel banner;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: MediaQuery.of(context).size.height * 0.09,
      
      width: MediaQuery.of(context).size.width,
      child: Image.network(banner.foto, fit: BoxFit.cover,),
    );
  }
}
