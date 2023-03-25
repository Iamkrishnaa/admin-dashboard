import 'package:flutter/material.dart';

import '../../constants/app_constant.dart';

class CustomRoundedTextField extends StatefulWidget {
  const CustomRoundedTextField({
    super.key,
    this.inputDecoration,
    this.isPasswordField = false,
  });
  final InputDecoration? inputDecoration;
  final bool isPasswordField;

  @override
  State<CustomRoundedTextField> createState() => _CustomRoundedTextFieldState();
}

class _CustomRoundedTextFieldState extends State<CustomRoundedTextField> {
  late bool isPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (widget.isPasswordField && (!isPasswordVisible)),
      decoration: widget.inputDecoration ??
          InputDecoration(
            fillColor: Theme.of(context).drawerTheme.backgroundColor,
            filled: true,
            border: AppConstant.roundedInputBorder.copyWith(),
            hintText: "Search",
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          isPasswordVisible = !isPasswordVisible;
                        },
                      );
                    },
                  )
                : null,
          ),
    );
  }
}
