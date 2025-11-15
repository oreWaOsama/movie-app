import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_movie_app/app_constants.dart';
import 'package:new_movie_app/core/utils/app_localization.dart';
import 'package:new_movie_app/movie_app.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppLocalizations.englishLocale,
        AppLocalizations.arabicLocale,
      ],
      fallbackLocale: AppLocalizations.englishLocale,
      startLocale: AppLocalizations.arabicLocale,
      path: AppConstant.translationsPath,
      child: DevicePreview(
        enabled: kDebugMode,
        builder: (context) => const MovieApp(),
      ),
    ),
  );
}
