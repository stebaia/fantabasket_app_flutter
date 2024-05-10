import 'package:fantabasket_app_flutter/bloc/cubit/remove_filters_cubit/remove_filters_cubit.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    _selected = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoveFiltersCubit, RemoveFiltersState>(
        listener: (context, state) => setState(() => _selected = false),
        builder: (context, snapshot) {
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
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onPressed: () {
                  setState(() {
                    _selected = !_selected;
                  });
                  widget.onClick(widget.category);
                },
                child: Text(widget.category)),
          );
        });
  }
}
