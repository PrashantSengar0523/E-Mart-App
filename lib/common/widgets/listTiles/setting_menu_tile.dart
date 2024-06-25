import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TSettingMenutile extends StatelessWidget {
  const TSettingMenutile({super.key, required this.title, required this.subtile, required this.icon, this.trailing, this.onTap});
  final String title,subtile;
  final IconData icon;
  final Widget?trailing;
  final VoidCallback?onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon( icon,size:28,color: TColors.primary,),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subtile,style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}