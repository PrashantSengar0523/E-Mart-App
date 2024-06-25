import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  final String dividerText;
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Divider(color: TColors.grey,indent: 60, thickness: 0.5,endIndent: 5,)),
        Text(dividerText),
        const Flexible(child: Divider(color: TColors.grey,indent: 5, thickness: 0.5,endIndent: 60,)),
      ],
    );
  }
}