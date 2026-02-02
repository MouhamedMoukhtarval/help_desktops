import 'package:flutter/material.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technicien_head.dart';
import 'package:help_desktops/features/technician/ui/widget/technician_home_screen_body.dart';
//import 'package:help_desktops/features/technician/ui/widget/technician_home_screen_body.dart';

class TechnicianHomeScreen extends StatelessWidget {
  const TechnicianHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsManager.white,
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTechnicienHead(
              technicianName: 'John Doe',
              pendingCount: 0,
              activeCount: 3,
              doneCount: 10,
              urgentCount: 0,
              overdueCount: 0,
              onMenuPressed: ()=> 'Menu Pressed',
            ),
            const Divider(
              thickness: 1.0,
              color: AppColorsManager.white,
              indent: 0.0,
              endIndent: 0.0,
            ),
            Expanded(
              child: const TechnicianHomeScreenBody()
            ),
          ],
        ),
      ),
    );
  }
}
