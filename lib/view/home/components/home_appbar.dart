
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom-app_theme.dart';
import '../../../utils/constants.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          'Discover',
          style: AppThemes.homeAppBar,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.search,
              size: 25, color: AppConstantsColor.darkTextColor),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bell_slash,
              size: 25, color: AppConstantsColor.darkTextColor),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(70);
}
