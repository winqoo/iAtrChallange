import 'dart:math';
import 'package:flutter/material.dart';

class AppStyles {
  static Color colorBlue1 = Color(0xff7ab2d4);
  static Color colorBlue2 = Color(0xff86bddf);
  static Color colorBlue3 = Color(0xfff0f7fb);
  static Color colorBlue4 = Color(0xffe5edf2);

  static Color colorRed1 = Colors.red.shade200;

  static Color colorPink2 = Color(0xfff394ab);

  static Color colorText1 = Color(0xff304755);
  static Color colorText2 = Color(0xff4d6675);
  static Color colorText3 = Color(0xff7a838e);
  static Color colorText4 = Color(0xffa8aeb5);

  static Color colorGrey1 = Color(0xff9b9b9b);
  static Color colorGrey2 = Color(0xffeaeaea);

  static Color colorOffWhite1 = Color(0xfffaebda);
  static Color colorOffWhite2 = Color(0xfff8f7f3);
  static Color colorOffWhite3 = Color(0xffF2F0ED);
  static Color colorNude1 = Color(0xfff8c1b8);
  static Color colorLightBlue1 = Color(0xff00b4e4);
  static Color colorLightBlue2 = Color(0xff80d9f2);
  static Color colorLightBlue3 = Color(0x8080DAF1);
  static Color colorDarkBlue1 = Color(0xff002947);
  static Color colorDarkBlue2 = Color(0xff002947);
  static Color colorDarkBlue3 = Color(0xff193E59);
  static Color colorDarkBlue4 = Color(0xff002946);
  static Color colorDarkBlue5 = Color(0x334C697E);
  static Color colorDarkBlue6 = Color(0xff33536B);
  static Color colorDarkBlueInactive = Color(0xB3193E59);

  static Color colorMatteBlue1 = Color(0xff004759);
  static Color colorBurgundy1 = Color(0xff562a22);
  static Color colorPink1 = Color(0xffc97073);
  static Color colorGrapefruit1 = Color(0xfff5a284);
  static Color colorLemon1 = Color(0xfffaf2d1);
  static Color colorDarkAqua1 = Color(0xff006b70);
  static Color colorLightAqua1 = Color(0xff9aeaeb);
  static Color colorBarbie1 = Color(0xffe0b8c7);
  static Color colorPurple1 = Color(0xff9c3d69);
  static Color colorError = Colors.red;
  static Color colorWhite = Colors.white;
  static Color colorBlack = Colors.black;

  static double fullWidth;
  static double fullHeight;
  static double baseWidth;
  static double baseHeight;
  static double basePadding;
  static double baseIconSize;
  static double largeIconSize;

  static TextStyle base;
  static TextStyle single;
  static TextStyle caption;
  static TextStyle captionLight;
  static TextStyle captionLarge;
  static TextStyle captionLargeMinimalist;
  static TextStyle captionSmall;
  static TextStyle validationError;
  static TextStyle body;
  static TextStyle header;
  static TextStyle largeHeader;
  static TextStyle maxHeader;
  static TextStyle subHeader;
  static TextStyle subHeaderDark;
  static TextStyle subHeaderMinimalist;
  static TextStyle miniHeader;
  static TextStyle miniHeaderDark;
  static TextStyle homeButtonTitle;
  static TextStyle homeButtonSubtitle;

  static InputDecoration inputDeco;

  static void updateStyle(BoxConstraints constraints) {
    fullWidth = constraints.maxWidth;
    fullHeight = constraints.maxHeight;
    baseWidth = fullWidth / 10;
    baseHeight = fullHeight / 20;
    basePadding = max(baseWidth * 0.4, 15);
    baseIconSize = baseWidth * 0.7;
    largeIconSize = baseWidth * 1;

    base = TextStyle(
      color: colorText1,
      fontWeight: FontWeight.w400,
      height: 1.5,
      fontFamily: 'Matter',
      fontSize: max(baseWidth * 0.45, 16),
    );

    body = base.apply();

    homeButtonTitle = body.apply(
        color: AppStyles.colorOffWhite2,
        heightFactor: 0.6,
        fontSizeFactor: 0.9,
        fontWeightDelta: 2);

    homeButtonSubtitle = body.apply(
        color: AppStyles.colorOffWhite2,
        heightFactor: 0.8,
        fontSizeFactor: 0.7);

    single = body.apply(
      heightFactor: 0.66,
    );

    header = single.apply(
      fontFamily: 'Reckless',
      color: colorText2,
      fontWeightDelta: 3,
      fontSizeFactor: 1.8,
      heightFactor: 1.1,
    );

    largeHeader = header.apply(
      fontSizeFactor: 1.2,
      heightFactor: 1,
    );

    maxHeader = header.apply(
      fontSizeFactor: 1.6,
    );

    subHeader = header.apply(
      fontSizeFactor: 0.7,
    );

    subHeaderDark = header.apply(
      color: Colors.white,
      fontFamily: 'Matter',
      fontSizeFactor: 0.8,
    );

    subHeaderMinimalist = base.apply(
      heightFactor: 0.7,
      fontSizeFactor: 1.6,
    );

    miniHeader = header.apply(
      fontSizeFactor: 0.6,
    );

    miniHeaderDark = header.apply(
      color: colorNude1,
      fontFamily: 'Matter',
      fontSizeFactor: 0.7,
    );

    validationError = single.apply(
      color: colorRed1,
      fontWeightDelta: 1,
      fontSizeFactor: 0.8,
    );

    caption = single.copyWith(letterSpacing: baseWidth / 100).apply(
          fontSizeFactor: 0.8,
          fontWeightDelta: 2,
        );

    captionLight = caption.apply(
      fontWeightDelta: -1,
    );

    captionLarge = caption.apply(
      fontSizeFactor: 1.2,
    );

    captionLargeMinimalist = caption.apply(
      fontSizeFactor: 2.2,
    );

    captionSmall = caption.apply(
      fontSizeFactor: 0.75,
    );

    inputDeco = InputDecoration(
      contentPadding: EdgeInsets.all(AppStyles.basePadding),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppStyles.colorRed1, width: 2)),
      labelStyle: AppStyles.caption.apply(
          color: AppStyles.caption.color.withAlpha(160), fontWeightDelta: 0),
      hintStyle: AppStyles.caption.apply(
          color: AppStyles.caption.color.withAlpha(160), fontWeightDelta: -2),
      fillColor: Colors.white,
      errorStyle: AppStyles.validationError,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppStyles.colorLightBlue1.withAlpha(120), width: 1),
        borderRadius: BorderRadius.circular(AppStyles.basePadding / 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppStyles.basePadding / 2),
        borderSide: BorderSide(color: Colors.white, width: 0),
      ),
      filled: true,
    );
  }
}

ThemeData appTheme() => ThemeData(
      backgroundColor: AppStyles.colorOffWhite1,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primarySwatch: Colors.blue,
      accentColor: AppStyles.colorLightBlue1,
      sliderTheme: SliderThemeData(
        thumbColor: AppStyles.colorLightBlue1,
        activeTickMarkColor: AppStyles.colorLightBlue1,
        tickMarkShape: SliderTickMarkShape.noTickMark,
        activeTrackColor: AppStyles.colorLightBlue1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppStyles.basePadding),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppStyles.colorRed1, width: 2)),
        labelStyle: AppStyles.caption
            .apply(color: AppStyles.caption.color.withAlpha(100)),
        hintStyle: AppStyles.caption
            .apply(color: AppStyles.caption.color.withAlpha(100)),
        fillColor: Colors.white,
        errorStyle: AppStyles.validationError,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.basePadding / 2),
          borderSide: BorderSide(
              color: AppStyles.colorDarkBlue1.withAlpha(40), width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.basePadding / 2),
          borderSide: BorderSide(color: Colors.white, width: 0),
        ),
        filled: true,
      ),
      iconTheme: IconThemeData(
        color: AppStyles.colorLightBlue2,
        size: AppStyles.baseIconSize,
        opacity: 1,
      ),
    );
