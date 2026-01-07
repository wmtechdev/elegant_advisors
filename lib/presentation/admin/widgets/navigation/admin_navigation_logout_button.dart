import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:elegant_advisors/core/utils/app_colors/app_colors.dart';
import 'package:elegant_advisors/core/utils/app_texts/app_texts.dart';
import 'package:elegant_advisors/core/utils/app_styles/app_text_styles.dart';
import 'package:elegant_advisors/core/utils/app_responsive/app_responsive.dart';

/// Logout button widget for admin navigation panel
class AdminNavigationLogoutButton extends StatelessWidget {
  final VoidCallback onLogout;

  const AdminNavigationLogoutButton({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = AppResponsive.scaleSize(context, 20, min: 18, max: 24);
    final spacing = AppResponsive.scaleSize(context, 12, min: 8, max: 16);
    final padding = AppResponsive.scaleSize(context, 12, min: 8, max: 16);

    return InkWell(
      onTap: onLogout,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: padding * 0.75,
        ),
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            Icon(Iconsax.logout, color: AppColors.error, size: iconSize),
            SizedBox(width: spacing),
            Flexible(
              child: Text(
                AppTexts.adminNavLogout,
                style: AppTextStyles.bodyText(context).copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
