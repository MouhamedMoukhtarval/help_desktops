import 'package:flutter/material.dart';

import 'package:help_desktops/core/widgets/ticket_container_details.dart';

class TechnicianHomeScreenBody extends StatelessWidget {
  const TechnicianHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => const TicketContainerDetails(),
    );
  }
}
