import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TButtonTile extends StatelessWidget {
  const TButtonTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.trailingIcon,
    this.onTap,
  });

  final IconData leadingIcon;
  final IconData trailingIcon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, size: 28, color: TColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      trailing: Icon(trailingIcon, size: 24, color: TColors.primary),
      onTap: onTap,
    );
  }
}
