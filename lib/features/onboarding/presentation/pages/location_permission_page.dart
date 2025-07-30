import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app_settings/app_settings.dart';
import 'package:panda/core/presentation/l10n/app_localizations.dart';
import '../../../../core/presentation/utils/app_colors.dart';
import '../../../../core/presentation/utils/app_images.dart';
import '../../../../core/presentation/utils/app_text_styles.dart';
import '../../../../core/presentation/widgets/panda_button.dart';
import '../../../../core/presentation/router/app_router.dart';

class LocationPermissionPage extends StatefulWidget {
  const LocationPermissionPage({super.key});

  @override
  State<LocationPermissionPage> createState() => _LocationPermissionPageState();
}

class _LocationPermissionPageState extends State<LocationPermissionPage> {
  bool _isLoading = false;
  bool _permissionDenied = false;

  Future<void> _requestLocationPermission() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled
        setState(() {
          _permissionDenied = true;
          _isLoading = false;
        });
        return;
      }

      // Check current permission status
      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.denied) {
        // Request permission
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse || 
          permission == LocationPermission.always) {
        // Permission granted, navigate to next page
        if (mounted) {
          context.push(AppRoutes.login);
        }
      } else {
        // Permission denied
        setState(() {
          _permissionDenied = true;
        });
      }
    } catch (e) {
      // Handle any errors
      setState(() {
        _permissionDenied = true;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _openSettings() {
    AppSettings.openAppSettings().then((v)async{
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        // Permission granted, navigate to next page
        if (mounted) {
          context.push(AppRoutes.login);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, v) async {
        // Dismiss keyboard before popping
        FocusScope.of(context).unfocus();

      },
      child: GestureDetector(
        onTap: () {
          // Unfocus when tapping outside
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundPrimary,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  Image.asset(AppImages.geo, width: 383.w, height: 383.h),

                  const Spacer(),
                  
                  // Location Permission Content
                  Column(
                    children: [
                      // Title
                      Text(
                        l10n.allowLocationAccess,
                        style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.w600, fontSize: 22.sp),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 16.h),

                      // Description
                      Text(
                        l10n.locationDescription,
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 18.sp),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),
                  
                  // Action Buttons
                  Column(
                    children: [
                      // Allow Access Button
                      PandaButton(
                        width: 1.sw,
                        text: _isLoading 
                            ? l10n.loading 
                            : (_permissionDenied ? l10n.openSettings : l10n.allowAccess),
                        type: PandaButtonType.primary,
                        onPressed: _isLoading 
                            ? null 
                            : (_permissionDenied ? _openSettings : _requestLocationPermission),
                      ),
                      
                      SizedBox(height: 16.h),
                      
                      // Specify Location Button
                      PandaButton(
                        width: 1.sw,
                        text: l10n.specifyLocation,
                        type: PandaButtonType.secondary,
                        onPressed: _isLoading ? null : () {
                          // Navigate to location selection
                          context.push(AppRoutes.locationSelection);
                        },
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 