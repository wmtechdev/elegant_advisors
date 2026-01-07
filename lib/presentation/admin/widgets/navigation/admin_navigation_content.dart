import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:elegant_advisors/core/utils/app_colors/app_colors.dart';
import 'package:elegant_advisors/core/utils/app_texts/app_texts.dart';
import 'package:elegant_advisors/core/utils/app_styles/app_text_styles.dart';
import 'package:elegant_advisors/core/utils/app_responsive/app_responsive.dart';
import 'package:elegant_advisors/core/widgets/app_logo.dart';
import 'package:elegant_advisors/core/constants/admin_constants.dart';
import 'package:elegant_advisors/presentation/admin/widgets/navigation/admin_navigation_item.dart';
import 'package:elegant_advisors/presentation/admin/widgets/navigation/admin_navigation_logout_button.dart';

/// Content widget for admin navigation panel
class AdminNavigationContent extends StatelessWidget {
  final String currentRoute;
  final String adminName;
  final VoidCallback onLogout;

  const AdminNavigationContent({
    super.key,
    required this.currentRoute,
    required this.adminName,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = AppResponsive.isMobile(context);
    final sidePadding = isMobile
        ? AppResponsive.scaleSize(context, 16, min: 12, max: 20)
        : AppResponsive.scaleSize(context, 12, min: 8, max: 16);

    return Column(
      children: [
        // Logo
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sidePadding,
            vertical: AppResponsive.scaleSize(context, 24, min: 16, max: 32),
          ),
          child: const AppLogo(color: AppColors.primary),
        ),

        // Navigation Items
        Expanded(
          child: ListView(
            clipBehavior: Clip.none,
            padding: EdgeInsets.symmetric(
              horizontal: sidePadding * 0.5,
              vertical: AppResponsive.scaleSize(context, 8, min: 4, max: 12),
            ).copyWith(right: 0),
            children: [
              AdminNavigationItem(
                icon: Iconsax.element_4,
                label: AppTexts.adminNavDashboard,
                route: AdminConstants.routeAdminDashboard,
                currentRoute: currentRoute,
              ),
              AdminNavigationItem(
                icon: Iconsax.home,
                label: AppTexts.adminNavProperties,
                route: AdminConstants.routeAdminProperties,
                currentRoute: currentRoute,
              ),
              AdminNavigationItem(
                icon: Iconsax.sms,
                label: AppTexts.adminNavInquiries,
                route: AdminConstants.routeAdminInquiries,
                currentRoute: currentRoute,
              ),
              AdminNavigationItem(
                icon: Iconsax.profile_2user,
                label: AppTexts.adminNavManageAdmins,
                route: '',
                currentRoute: currentRoute,
                onTap: () {
                  // TODO: Navigate to manage admins screen when implemented
                  Get.snackbar(
                    'Coming Soon',
                    'Manage Admins feature will be available soon',
                  );
                },
              ),
            ],
          ),
        ),

        // Divider
        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.grey.withValues(alpha: 0.2),
        ),

        // Admin Name and Logout
        Padding(
          padding: EdgeInsets.all(sidePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                adminName,
                style: AppTextStyles.bodyText(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: AppResponsive.scaleSize(context, 8, min: 4, max: 12),
              ),
              AdminNavigationLogoutButton(onLogout: onLogout),
            ],
          ),
        ),
      ],
    );
  }
}
