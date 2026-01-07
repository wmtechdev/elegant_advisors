import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:elegant_advisors/core/utils/app_colors/app_colors.dart';
import 'package:elegant_advisors/core/utils/app_texts/app_texts.dart';
import 'package:elegant_advisors/core/utils/app_responsive/app_responsive.dart';
import 'package:elegant_advisors/presentation/admin/controllers/dashboard/admin_dashboard_controller.dart';
import 'package:elegant_advisors/presentation/admin/widgets/layout/admin_layout.dart';
import 'package:elegant_advisors/presentation/admin/widgets/dashboard/admin_dashboard_stat_card.dart';

/// Reusable dashboard views widget containing both mobile and desktop views
class AdminDashboardViews extends GetView<AdminDashboardController> {
  const AdminDashboardViews({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppResponsive.isMobile(context);

    return AdminLayout(
      title: AppTexts.adminDashboardTitle,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(
          AppResponsive.scaleSize(context, isMobile ? 16 : 24, min: 12, max: 32),
        ),
        child: Obx(
          () => isMobile
              ? _buildMobileContent(context)
              : _buildDesktopContent(context),
        ),
      ),
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    final spacing = AppResponsive.scaleSize(context, 16, min: 12, max: 24);
    final childAspectRatio = 2.2;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      childAspectRatio: childAspectRatio,
      children: [
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardTodayVisitors,
          value: controller.todayVisitors.value.toString(),
          icon: Iconsax.people,
        ),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardYesterdayVisitors,
          value: controller.yesterdayVisitors.value.toString(),
          icon: Iconsax.profile_2user,
        ),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardTotalProperties,
          value: controller.propertiesCount.value.toString(),
          icon: Iconsax.home,
        ),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardPublishedProperties,
          value: controller.publishedPropertiesCount.value.toString(),
          icon: Iconsax.building,
        ),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardTeamMembers,
          value: controller.teamCount.value.toString(),
          icon: Iconsax.people,
        ),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardNewInquiries,
          value: controller.newInquiriesCount.value.toString(),
          icon: Iconsax.sms,
          iconColor: AppColors.warning,
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    final spacing = AppResponsive.scaleSize(context, 12, min: 8, max: 16);

    return Column(
      children: [
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardTodayVisitors,
          value: controller.todayVisitors.value.toString(),
          icon: Iconsax.people,
        ),
        SizedBox(height: spacing),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardYesterdayVisitors,
          value: controller.yesterdayVisitors.value.toString(),
          icon: Iconsax.profile_2user,
        ),
        SizedBox(height: spacing),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardTotalProperties,
          value: controller.propertiesCount.value.toString(),
          icon: Iconsax.home,
        ),
        SizedBox(height: spacing),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardPublishedProperties,
          value: controller.publishedPropertiesCount.value.toString(),
          icon: Iconsax.building,
        ),
        SizedBox(height: spacing),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardTeamMembers,
          value: controller.teamCount.value.toString(),
          icon: Iconsax.people,
        ),
        SizedBox(height: spacing),
        AdminDashboardStatCard(
          title: AppTexts.adminDashboardNewInquiries,
          value: controller.newInquiriesCount.value.toString(),
          icon: Iconsax.sms,
          iconColor: AppColors.warning,
        ),
      ],
    );
  }
}
