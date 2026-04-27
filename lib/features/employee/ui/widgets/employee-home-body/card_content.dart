import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class CardContent extends StatelessWidget {
  final String titre;
  final String description;
  final String? pieceJointe;

  const CardContent({
    super.key,
    required this.titre,
    required this.description,
    this.pieceJointe,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titre,
          style: AppTextStyles.font17Black87Bold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        Text(
          description,
          style: AppTextStyles.font14GrayShade700Height1_4,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (pieceJointe != null) ...[
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              'assets/images/printer-picture.png',
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ],
    );
  }
}
