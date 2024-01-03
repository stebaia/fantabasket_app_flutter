import 'package:fantabasket_app_flutter/utils/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:osm_nominatim/osm_nominatim.dart';

class EmailFormField extends StatelessWidget {
  final String label;
  final Color? textColor;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? formFieldValidator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Color? color;
  final TextCapitalization? textCapitalization;
  final IconData? iconCustom;

  const EmailFormField(this.label,
      {super.key,
      this.textEditingController,
      this.focusNode,
      this.textColor,
      this.formFieldValidator,
      this.onFieldSubmitted,
      this.textInputAction,
      this.color,
      this.textCapitalization,
      this.iconCustom});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextFormField(
        style: TextStyle(fontSize: 14, color: textColor ?? Colors.black),
        cursorColor: ThemeHelper.enabledPrimaryColor,
        textCapitalization: textCapitalization != null
            ? textCapitalization!
            : TextCapitalization.none,
        controller: textEditingController,
        focusNode: focusNode,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          focusColor: ThemeHelper.disabledActionColor,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ThemeHelper.textSecondaryColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ThemeHelper.textSecondaryColor),
          ),
          labelText: label,
          labelStyle: const TextStyle(
              color: ThemeHelper.textSecondaryColor, fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
      ),
    );
  }
}

class PasswordFormField extends StatefulWidget {
  final String label;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? formFieldValidator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool enalbed;
  final Color? color;
  final Color? textColor;

  const PasswordFormField(this.label,
      {super.key,
      this.textEditingController,
      this.focusNode,
      this.textColor,
      this.formFieldValidator,
      this.onFieldSubmitted,
      this.textInputAction,
      this.enalbed = true,
      this.color});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style:
              TextStyle(fontSize: 14, color: widget.textColor ?? Colors.black),
          cursorColor: ThemeHelper.enabledPrimaryColor,
          enabled: widget.enalbed,
          controller: widget.textEditingController,
          focusNode: widget.focusNode,
          obscureText: _obscureText,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: widget.label,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            focusColor: ThemeHelper.disabledActionColor,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemeHelper.textSecondaryColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemeHelper.textSecondaryColor),
            ),
            labelStyle: const TextStyle(
                color: ThemeHelper.textSecondaryColor, fontSize: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                _obscureText = !_obscureText;
              }),
              child: Icon(
                _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                size: 18,
                color: Colors.grey,
              ),
            ),
          ),
          validator: widget.formFieldValidator,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction,
        ));
  }
}

class TextEditCarFormField extends StatelessWidget {
  final String label;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? formFieldValidator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Color? colorLabel;
  final Color? colorBackground;
  final TextCapitalization? textCapitalization;
  final IconData? iconCustom;
  final double? heightBox;

  TextEditCarFormField(this.label,
      {super.key,
      this.textEditingController,
      this.focusNode,
      this.formFieldValidator,
      this.onFieldSubmitted,
      this.textInputAction,
      this.keyboardType,
      this.colorLabel,
      this.colorBackground,
      this.textCapitalization,
      this.heightBox,
      this.iconCustom});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightBox ?? 40,
      child: CupertinoTextField.borderless(
        controller: textEditingController,
        cursorColor: ThemeHelper.enabledPrimaryColor,
        keyboardType: keyboardType,
        padding:
            const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        style: TextStyle(color: colorLabel),
        prefix: Text(
          label,
          style: TextStyle(color: colorLabel),
        ),
        onChanged: onFieldSubmitted,
      ),
    );
  }
}

class DateFormField extends StatelessWidget {
  final String label;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? formFieldValidator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Color? color;
  final IconData? iconCustom;
  final GestureTapCallback? gestureTapCallback;

  const DateFormField(this.label,
      {super.key,
      this.textEditingController,
      this.focusNode,
      this.formFieldValidator,
      this.onFieldSubmitted,
      this.textInputAction,
      this.color,
      this.gestureTapCallback,
      this.iconCustom});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: TextFormField(
          readOnly: true,
          style: const TextStyle(fontSize: 14),
          cursorColor: Colors.grey,
          controller: textEditingController,
          focusNode: focusNode,
          onTap: gestureTapCallback,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemeHelper.textSecondaryColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemeHelper.textSecondaryColor),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemeHelper.textSecondaryColor),
            ),
            hintText: label,
            prefixIcon: Icon(
              iconCustom ?? CupertinoIcons.person,
              size: 18,
              color: Colors.grey,
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: textInputAction,
        )));
  }
}
