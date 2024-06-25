import 'package:e_mart/common/widgets/customShapes/containers/circular_container.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({super.key, required this.text, required this.selected, this.onSelected, });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor=THelperFunctions.getColor(text)!=null;
    return ChoiceChip(
      label:isColor?const SizedBox():Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected?TColors.white:null),
      avatar: isColor? CircularContainer(width: 50,height: 50,backgroundColor: THelperFunctions.getColor(text)!,):null,
      shape: isColor? const CircleBorder():null,
      labelPadding: isColor? const EdgeInsets.all(0):null,
      padding: isColor? const EdgeInsets.all(0):null,
      backgroundColor: isColor?THelperFunctions.getColor(text)!:null,
      );
  }
}