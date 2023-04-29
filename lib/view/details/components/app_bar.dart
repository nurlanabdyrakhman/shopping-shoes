
import 'package:flutter/material.dart';

import '../../../theme/custom-app_theme.dart';
import '../../../utils/constants.dart';

class CostomDetailviewAppBar extends StatelessWidget  with PreferredSizeWidget{
  const CostomDetailviewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: const Text(
        'Nike',
        style: AppThemes.detailsAppBar,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppConstantsColor.lightTextColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: (){
            
          },
         icon: const Icon(Icons.favorite_border),),
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(65);
}
