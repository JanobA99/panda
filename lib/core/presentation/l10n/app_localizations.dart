import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'PANDA'**
  String get appName;

  /// Text for language selection
  ///
  /// In en, this message translates to:
  /// **'Choose application language'**
  String get chooseLanguage;

  /// Uzbek language option
  ///
  /// In en, this message translates to:
  /// **'O\'zbekcha'**
  String get uzbek;

  /// Russian language option
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get russian;

  /// Continue button text
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// Location permission request title
  ///
  /// In en, this message translates to:
  /// **'Allow access to geolocation'**
  String get allowLocationAccess;

  /// Location permission description
  ///
  /// In en, this message translates to:
  /// **'This way we can show interesting offers and pick-up/drop-off points near you'**
  String get locationDescription;

  /// Allow access button text
  ///
  /// In en, this message translates to:
  /// **'Allow access'**
  String get allowAccess;

  /// Specify location button text
  ///
  /// In en, this message translates to:
  /// **'Specify location'**
  String get specifyLocation;

  /// Location page title
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Search placeholder text
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Select region section title
  ///
  /// In en, this message translates to:
  /// **'Select region'**
  String get selectRegion;

  /// Andijan region name
  ///
  /// In en, this message translates to:
  /// **'Andijan Region'**
  String get andijanRegion;

  /// Bukhara region name
  ///
  /// In en, this message translates to:
  /// **'Bukhara Region'**
  String get bukharaRegion;

  /// Jizzakh region name
  ///
  /// In en, this message translates to:
  /// **'Jizzakh Region'**
  String get jizzakhRegion;

  /// Karakalpakstan region name
  ///
  /// In en, this message translates to:
  /// **'Karakalpakstan'**
  String get karakalpakstan;

  /// Navoiy region name
  ///
  /// In en, this message translates to:
  /// **'Navoiy Region'**
  String get navoiyRegion;

  /// Samarkand region name
  ///
  /// In en, this message translates to:
  /// **'Samarkand Region'**
  String get samarkandRegion;

  /// Tashkent region name
  ///
  /// In en, this message translates to:
  /// **'Tashkent Region'**
  String get tashkentRegion;

  /// Namangan region name
  ///
  /// In en, this message translates to:
  /// **'Namangan Region'**
  String get namanganRegion;

  /// Fergana region name
  ///
  /// In en, this message translates to:
  /// **'Fergana Region'**
  String get ferganaRegion;

  /// Khorezm region name
  ///
  /// In en, this message translates to:
  /// **'Khorezm Region'**
  String get khorezmRegion;

  /// Surkhandarya region name
  ///
  /// In en, this message translates to:
  /// **'Surkhandarya Region'**
  String get surkhandaryaRegion;

  /// Syrdarya region name
  ///
  /// In en, this message translates to:
  /// **'Syrdarya Region'**
  String get syrdaryaRegion;

  /// Regions section title
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get regions;

  /// All regions section
  ///
  /// In en, this message translates to:
  /// **'All Regions'**
  String get allRegions;

  /// Loading text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Open settings button text
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
