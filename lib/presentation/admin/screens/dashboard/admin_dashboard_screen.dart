import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elegant_advisors/presentation/admin/controllers/dashboard/admin_dashboard_controller.dart';
import 'package:elegant_advisors/presentation/admin/widgets/dashboard/admin_dashboard_views.dart';

/// Main admin dashboard screen
class AdminDashboardScreen extends GetView<AdminDashboardController> {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminDashboardViews();
  }
}
