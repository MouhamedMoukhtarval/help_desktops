import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/features/technician/data/models/ticket_response.dart';

class TicketCardResolve extends StatelessWidget {
  final TicketResponse ticket;

  const TicketCardResolve({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 120.h,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColorsManager.lightBlue.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColorsManager.lighterGray.withValues(alpha: .5),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.title ?? '',
                  style: AppTextStyles.font16DarkBlueMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                spacingVertical(8.h),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      size: 14.r,
                      color: AppColorsManager.lighterGray,
                    ),
                    spacingHorizontal(4.w),
                    Expanded(
                      child: Text(
                        'Requested by: ${ticket.employee?.username ?? 'Unknown'}',
                        style: AppTextStyles.font14LighterGrayRegular,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          spacingHorizontal(20.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              'assets/images/printer-picture.png',
              width: 40.w,
              height: 40.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
