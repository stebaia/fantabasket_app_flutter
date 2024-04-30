import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBaseBottomSheet extends StatelessWidget {
  const CustomBaseBottomSheet(
      {super.key, required this.title, required this.body, required this.height});

  final String title;
  final Widget body;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text(
                title.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GestureDetector(
                child: const Icon(Icons.close),
                onTap: () => context.popRoute(),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(child: body)
        ],
      ),
    );
  }
}
