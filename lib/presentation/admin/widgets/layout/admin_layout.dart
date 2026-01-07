import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:elegant_advisors/core/utils/app_colors/app_colors.dart';
import 'package:elegant_advisors/core/utils/app_styles/app_text_styles.dart';
import 'package:elegant_advisors/core/utils/app_responsive/app_responsive.dart';
import 'package:elegant_advisors/presentation/admin/widgets/layout/admin_background.dart';
import 'package:elegant_advisors/presentation/admin/widgets/navigation/admin_navigation_panel.dart';
import 'package:elegant_advisors/presentation/admin/widgets/layout/admin_header.dart';
import 'package:elegant_advisors/data/services/auth_service.dart';
import 'package:elegant_advisors/core/constants/admin_constants.dart';

/// Shared admin layout with fixed navigation panel for all admin screens
class AdminLayout extends StatefulWidget {
  final String title;
  final Widget child;
  final bool showHeader;

  const AdminLayout({
    super.key,
    required this.title,
    required this.child,
    this.showHeader = true,
  });

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout>
    with AutomaticKeepAliveClientMixin {
  final AuthService _authService = AuthService();
  final adminName = 'Admin'.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadAdminName();
  }

  Future<void> _loadAdminName() async {
    try {
      final adminUser = await _authService.getAdminUserData();
      if (adminUser != null) {
        adminName.value = adminUser.name.isNotEmpty
            ? adminUser.name
            : (adminUser.email.split('@').first);
      } else {
        final user = _authService.currentUser;
        if (user != null) {
          adminName.value = user.email?.split('@').first ?? 'Admin';
        }
      }
    } catch (e) {
      // Fallback to email if name loading fails
      final user = _authService.currentUser;
      if (user != null) {
        adminName.value = user.email?.split('@').first ?? 'Admin';
      }
    }
  }

  Future<void> _logout() async {
    await _authService.signOut();
    Get.offAllNamed(AdminConstants.routeAdminLogin);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    final isMobile = AppResponsive.isMobile(context);
    final spacing = AppResponsive.scaleSize(context, 16, min: 12, max: 20);

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          const AdminBackground(),
          Padding(
            padding: EdgeInsets.all(spacing),
            child: Row(
              children: [
                // Navigation Panel (Desktop) - Fixed and Reactive
                if (!isMobile)
                  Obx(
                    () => AdminNavigationPanel(
                      currentRoute: Get.currentRoute,
                      adminName: adminName.value,
                      onLogout: _logout,
                    ),
                  ),
                // Main Content - No white background, background image shows through
                Expanded(
                  child: Column(
                    children: [
                      // Header
                      if (widget.showHeader)
                        if (isMobile)
                          AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            leading: IconButton(
                              icon: Icon(
                                Iconsax.menu_1,
                                color: AppColors.white,
                                size: AppResponsive.scaleSize(
                                  context,
                                  24,
                                  min: 20,
                                  max: 28,
                                ),
                              ),
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                            ),
                            title: Text(
                              widget.title,
                              style: AppTextStyles.headline(context).copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        else
                          AdminHeader(title: widget.title),
                      // Content
                      Expanded(child: widget.child),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Mobile Drawer - Fixed and Reactive
      drawer: isMobile
          ? Obx(
              () => AdminNavigationPanel(
                currentRoute: Get.currentRoute,
                adminName: adminName.value,
                onLogout: _logout,
              ),
            )
          : null,
    );
  }
}
