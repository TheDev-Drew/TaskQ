// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? leading;
  final List<Widget>? actions;
  final Function? ontap;

  const CustomAppBar({
    super.key,
    this.leading,
    this.actions,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   ontap;
      // },
      child: AppBar(
        leading: leading != null ? Row(children: leading!) : null,
        actions: actions,
        backgroundColor: Theme.of(context)
            .colorScheme
            .background, // Customize the background color
        elevation: 0, // Remove shadow
        centerTitle: true, // Center the title
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
