import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
       this.controller,
       this.maxLines,
       this.hintText
       });
  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller,
      maxLines: maxLines,
    
      style: const TextStyle(
        color: CustomColor.scaffoldbg,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColor.hintDark,
        ),
        fillColor: CustomColor.whiteSecondary,
        focusedBorder: getInputBorder,
        enabledBorder: getInputBorder,
        border: getInputBorder,
      ),
    );
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
  }
}
