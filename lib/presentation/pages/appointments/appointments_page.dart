import 'package:core/core.dart';
import 'package:flutter/material.dart';

part 'appointments_page_mixin.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage>
    with AppointmentsPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Padding get _buildBody {
    return Padding(
      padding: context.ext.padding.all.lg,
      child: Center(
        child: Text(
          'Appointments Page',
          style: context.ext.theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
