import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class HomeTechnicienTopBar extends StatelessWidget {
  const HomeTechnicienTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Mes Taches', style: AppTextStyles.font24DarkBlueMedium),
          const Spacer(),
          CircleAvatar(
            backgroundColor: AppColorsManager.white,
            radius: 24.r,
            child: SvgPicture.asset(
              'assets/svgs/person-profile-image-icon.svg',
            ),
          ),
        ],
      ),
    );
  }
}
