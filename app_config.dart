import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:order_pro_flutter/src/core/networking/api_client.dart';
import 'package:order_pro_flutter/src/core/data/models/template.dart';
import 'package:order_pro_flutter/src/core/utils/utils.dart';

///
/// Created by Auro on 17/07/24
///

// THIS IS THE OLDER FILE FOR APP THEM

class AppConfig {
  static late TemplateDatum currentTemplate;
  static late ThemeData currentTheme;

  /// In Future If we have template switch inside app we can add it here. allTemplates = []

  static Future<void> setTemplateAndTheme() async {
    try {
      /// setting up template >>>>
      final config = await loadJsonData("template_config.json");
      final listOfTemplates = List<TemplateDatum?>.from(
        (config as Map<String, dynamic>)["templates"].map(
          (e) => TemplateDatum.fromJson(e),
        ),
      );

      /// bring template from my config and match with the all templates list
      TemplateDatum? tempDatum = listOfTemplates.firstWhere(
        (e) => e?.name == ApiConfig.template,
        orElse: () => null,
      );

      /// if match okay if not then basic white fire theme will be set
      if (tempDatum != null) {
        currentTemplate = tempDatum;
      } else {
        currentTemplate = TemplateDatum(
          name: "WHITE_FIRE",
          productType: "DIAMOND",
          stockWise: true,
        );
      }

      /// setting up theme >>>>
      if (currentTemplate.name != "WHITE_FIRE") {
        currentTheme = ThemeData(
          fontFamily: currentTemplate.designSystem!.fontFamily,
          primaryColor:
              hexStringToColor(
                currentTemplate.designSystem!.color!.primaryColor!,
              )!,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.primaryColor!,
                )!,
            onPrimary:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.onPrimaryColor!,
                )!,
            secondary:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.secondaryColor!,
                )!,
            onSecondary:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.onSecondaryColor!,
                )!,
            surface:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.surfaceColor!,
                )!,
            onSurface:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.onSurfaceColor!,
                )!,
            onError:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.onErrorColor!,
                )!,
            error:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.errorColor!,
                )!,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.appBarColor!,
                )!,
            iconTheme: IconThemeData(
              color:
                  hexStringToColor(
                    currentTemplate.designSystem!.color!.primaryColor!,
                  )!,
            ),
          ),
          scaffoldBackgroundColor: hexStringToColor(
            currentTemplate.designSystem!.color!.scaffoldBackgroundColor!,
          ),
          iconTheme: IconThemeData(
            color:
                hexStringToColor(
                  currentTemplate.designSystem!.color!.primaryColor!,
                )!,
            size: 20,
          ),
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
              foregroundColor:
                  hexStringToColor(
                    currentTemplate.designSystem!.color!.primaryColor!,
                  )!,
            ),
          ),
          textTheme: const TextTheme(
            labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            displayLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            displaySmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
            headlineMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            headlineSmall: TextStyle(fontSize: 32, fontWeight: FontWeight.w200),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          useMaterial3: true,
        );
      } else {
        currentTheme = ThemeData(
          fontFamily: 'GothicA1',
          colorScheme: const ColorScheme(
            brightness: Brightness.light,

            // /// Luv Diamonds
            // primary: Color(0xff672F7A),
            // onPrimary: Color(0xffF9F6FA),
            // onSecondary: Color(0xffffffff),
            // onSurface: Color(0xff000000),
            // primaryContainer: Color(0xff90679F),
            // secondaryContainer: Color(0xFFEEDFF3),
            // onSecondaryContainer: Color(0xff90679F),
            // secondary: Color(0xffF9F6FA),
            // surface: Color(0xffFFFFFE),
            // onSurfaceVariant: Color(0xff000000),
            // onError: Color(0xffffffff),
            // error: Color(0xffb3261e),
            // tertiary: Color(0xFFB15F89),
            // tertiaryContainer: Color(0xFFfef5ff),
            // onSecondaryFixed:Color(0xFFf4ebf7),

            // /// Shri Banu
            // primary: Color(0xff7F1E50),
            // onPrimary: Color(0xffffffff),
            // onSecondary: Color(0xffffffff),
            // onSurface: Color(0xff7E5525),
            // primaryContainer: Color(0xffB15F89),
            // secondaryContainer: Color(0xFFFFFAF0),
            // onSecondaryContainer: Color(0xff7E5525),
            // secondary: Color(0xffFFFDF9),
            // surface: Color(0xffFFFFFE),
            // onSurfaceVariant: Color(0xff000000),
            // onError: Color(0xffffffff),
            // error: Color(0xffb3261e),
            // tertiary: Color(0xFFB15F89),
            // tertiaryContainer: Color(0xFFfef5ff),
            // onSecondaryFixed: Color(0xFFFFEFF7),

            /// WhiteFire
            primary: Color(0xff3D6BB1),
            onPrimary: Color(0xffFAFAFA),
            onSecondary: Color(0xffffffff),
            onSurface: Color(0xff000000),
            primaryContainer: Color(0xff8CAFE5),
            secondaryContainer: Color(0xFFDEEFFF),
            onSecondaryContainer: Color(0xFF1F4A8B),
            secondary: Color(0xffFAFAFA),
            surface: Color(0xffffffff),
            onSurfaceVariant: Color(0xff000000),
            onError: Color(0xffffffff),
            error: Color(0xffb3261e),
            tertiary: Color(0xFF509660),
            tertiaryContainer: Color(0xFFF5FFF7),
            onSecondaryFixed: Color(0xFFE4FFEB),
          ),
          primaryColorLight: Color(0xff8CAFE5),
          textTheme: const TextTheme(
            labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            displayLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            displaySmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
            headlineMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
            headlineSmall: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w200,
              // height: 2,
            ),
            bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              // height: 2,
            ),
          ),
          useMaterial3: true,
        );
      }
    } catch (err) {
      log("TEMPLATE CONFIG ERROR : $err");
    }
  }
}
