import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String category;
  final Function(String) onClick;

  const CategoryButton({
    required this.onClick,
    required this.category,
    super.key,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _selected
                ? Constants.categoryColors[widget.category]
                : Colors.grey,
            foregroundColor: Colors.white,
            splashFactory: NoSplash.splashFactory,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          onPressed: () {
            setState(() {
              _selected = !_selected;
            });
            widget.onClick(widget.category);
          },
          child: Text(widget.category)),
    );
  }
}
