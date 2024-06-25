import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TTabBar extends StatelessWidget implements PreferredSize{
  const TTabBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TabBar(tabs: tabs,
      isScrollable: true,
      indicatorColor: TColors.primary,
      labelColor: TColors.dark,
      unselectedLabelColor: TColors.darkGrey,

      ),
    );
  }

  @override
  Size get preferredSize =>const Size.fromHeight(0);
  
  @override
  Widget get child => throw UnimplementedError();
}