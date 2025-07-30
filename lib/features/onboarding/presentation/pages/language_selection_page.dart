import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/application/services/language_service.dart';
import '../../../../core/presentation/l10n/app_localizations.dart';
import '../../../../core/presentation/utils/app_images.dart';
import '../../../../core/presentation/utils/app_colors.dart';
import '../../../../core/presentation/utils/app_text_styles.dart';
import '../../../../core/presentation/widgets/language_selection_button.dart';
import '../../../../core/presentation/widgets/panda_button.dart';
import '../../../../core/presentation/router/app_router.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String selectedLanguage = 'Русский'; // Default to Russian

  @override
  void initState() {
    super.initState();
    // Initialize selectedLanguage based on current language
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final languageService = Provider.of<LanguageService>(context, listen: false);
      
      // Wait for the language service to be initialized
      if (languageService.isInitialized) {
        _updateSelectedLanguage(languageService);
      } else {
        // Listen for changes until initialized
        languageService.addListener(() {
          if (languageService.isInitialized) {
            _updateSelectedLanguage(languageService);
          }
        });
      }
    });
  }

  void _updateSelectedLanguage(LanguageService languageService) {
    final currentLanguageCode = languageService.getLanguageCode();
    
    setState(() {
      if (currentLanguageCode == 'uz') {
        selectedLanguage = 'uzbek';
      } else if (currentLanguageCode == 'en') {
        selectedLanguage = 'english';
      } else {
        selectedLanguage = 'russian';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageService = Provider.of<LanguageService>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              const Spacer(),

              // Panda Logo
              Image.asset(AppImages.panda, width: 238.w, height: 238.h),

              SizedBox(height: 36.h),

              // App Name
              Text(
                l10n.appName,
                style: AppTextStyles.h3.copyWith(fontSize: 72.sp),
              ),

              const Spacer(),

              // Language Selection Text
              Text(
                l10n.chooseLanguage,
                style: AppTextStyles.buttonSecondary.copyWith(fontSize: 24.sp),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 36.h),

              // Language Selection Buttons
              Row(
                children: [
                  Expanded(
                    child: LanguageSelectionButton(
                      languageName: l10n.uzbek,
                      isSelected: selectedLanguage == 'uzbek',
                      onPressed: () {
                        setState(() {
                          selectedLanguage = 'uzbek';
                        });
                        languageService.setLanguage('uz');
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: LanguageSelectionButton(
                      languageName: l10n.russian,
                      isSelected: selectedLanguage == 'russian',
                      onPressed: () {
                        setState(() {
                          selectedLanguage = 'russian';
                        });
                        languageService.setLanguage('ru');
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Continue Button
              PandaButton(
                width: 1.sw,
                text: l10n.continueText,
                type: PandaButtonType.primary,
                onPressed: () {
                  // Navigate to next screen using go_router
                  context.push(AppRoutes.locationPermission);
                },
              ),

              SizedBox(height: 48.h),
            ],
          ),
        ),
      ),
    );
  }
}
