
import 'package:flutter/material.dart';
import 'package:futurex/utils/color_collections.dart';

// Light Theme Configuration
ThemeData lightMode = ThemeData(
  colorScheme: lightColorScheme,

  // Component theming
  appBarTheme: AppBarTheme(
    backgroundColor: ColorCollections.PrimaryColor,  // White app bar
    foregroundColor: ColorCollections.TeritiaryColor, // Black title/text
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorCollections.QuaterneryColor,  // Blue buttons
      foregroundColor: ColorCollections.PrimaryColor,     // White button text
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: ColorCollections.QuaterneryColor,  // Blue text buttons
    ),
  ),
  cardTheme: CardTheme(
    color: ColorCollections.LightBlueColor,  // Light blue cards/containers
  ),
);


// Dark Theme Configuration
ThemeData darkMode = ThemeData(
  colorScheme: darkColorScheme,

  // Component theming (dark)
  appBarTheme: AppBarTheme(
    backgroundColor: ColorCollections.DeepGreyColor,  // Dark grey app bar
    foregroundColor: ColorCollections.PrimaryColor,   // White title/text
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorCollections.QuaterneryColor,  // Blue buttons
      foregroundColor: ColorCollections.PrimaryColor,     // White button text
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: ColorCollections.QuaterneryColor,  // Blue text buttons
    ),
  ),
  cardTheme: CardTheme(
    color: ColorCollections.DeepGreyColor,  // Dark grey cards/containers
    elevation: 2.0,  // Slightly elevated for visibility
  ),
);






// Light Theme
final lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  // Primary colors
  primary: ColorCollections.TeritiaryColor, //black text color
  onPrimary: Colors.grey.shade700,  // greyish text color
  primaryContainer:ColorCollections.PrimaryColor, // white container color
  onPrimaryContainer: Colors.grey[200]!,

  // Secondary colors
  secondary: ColorCollections.PrimaryColor,
  onSecondary: ColorCollections.PrimaryColor,
  secondaryContainer:ColorCollections.PrimaryColor,
  onSecondaryContainer: Colors.black,

  // Tertiary colors
  tertiary: ColorCollections.PrimaryColor,
  onTertiary: Colors.black,
  tertiaryContainer: Colors.blue.shade200,
  onTertiaryContainer: Colors.black,

  // Error colors
  error: ColorCollections.PrimaryColor,
  onError:ColorCollections.PrimaryColor,
  errorContainer: Colors.red.shade200,
  onErrorContainer: Colors.red.shade900,

  // Background/surface colors
  background: ColorCollections.PrimaryColor,
  onBackground: ColorCollections.PrimaryColor,
  surface: Colors.grey.shade500,
  onSurface: ColorCollections.PrimaryColor,

  // Surface variants
  surfaceVariant: ColorCollections.SecondaryColor,
  onSurfaceVariant: Colors.black87,
  outline: Colors.grey.shade400,
  outlineVariant: Colors.grey.shade200,

  // Additional surface levels
  surfaceDim: Colors.grey.shade100,
  surfaceBright: Colors.white,
  surfaceContainerLowest: Colors.white,
  surfaceContainerLow: Colors.grey.shade50,
  surfaceContainer: Colors.grey.shade100,
  surfaceContainerHigh: Colors.grey.shade200,
  surfaceContainerHighest: Colors.grey.shade300,

  // Fixed colors (less common)
  primaryFixed:ColorCollections.PrimaryColor.withOpacity(0.8),
  primaryFixedDim:ColorCollections.PrimaryColor.withOpacity(0.6),
  onPrimaryFixed: Colors.white,
  onPrimaryFixedVariant: Colors.white.withOpacity(0.8),

  secondaryFixed: ColorCollections.PrimaryColor.withOpacity(0.8),
  secondaryFixedDim: ColorCollections.PrimaryColor.withOpacity(0.6),
  onSecondaryFixed: Colors.black,
  onSecondaryFixedVariant: Colors.black.withOpacity(0.8),

  tertiaryFixed: ColorCollections.PrimaryColor.withOpacity(0.8),
  tertiaryFixedDim: ColorCollections.PrimaryColor.withOpacity(0.6),
  onTertiaryFixed: Colors.black,
  onTertiaryFixedVariant: Colors.black.withOpacity(0.8),

  // Other
  shadow: Colors.black.withOpacity(0.15),
  scrim: Colors.black.withOpacity(0.5),
  inverseSurface: Colors.black,
  onInverseSurface: Colors.white,
  inversePrimary: ColorCollections.PrimaryColor.withOpacity(0.8),
  surfaceTint: ColorCollections.PrimaryColor,
);


// Dark Theme
final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  // Primary colors
  primary: ColorCollections.PrimaryColor,
  onPrimary: Colors.white70,
  primaryContainer: Colors.grey.shade900,
  onPrimaryContainer:  Colors.grey.shade900,

  // Secondary colors
  secondary: ColorCollections.PrimaryColor,
  onSecondary: ColorCollections.PrimaryColor,
  secondaryContainer: ColorCollections.PrimaryColor,
  onSecondaryContainer: Colors.black,

  // Tertiary colors
  tertiary: Colors.grey.shade800,
  onTertiary: Colors.white,
  tertiaryContainer: Colors.blue.shade900,
  onTertiaryContainer: Colors.white,

  // Error colors
  error: ColorCollections.PrimaryColor,
  onError: ColorCollections.PrimaryColor,
  errorContainer: Colors.red.shade800,
  onErrorContainer: Colors.red.shade100,

  // Background/surface colors
  background: ColorCollections.TeritiaryColor,
  onBackground: ColorCollections.TeritiaryColor,
  surface:Colors.white70,
  onSurface: ColorCollections.PrimaryColor,

  // Surface variants
  surfaceVariant: Colors.grey.shade800,
  onSurfaceVariant: Colors.white.withOpacity(0.8),
  outline: Colors.grey.shade600,
  outlineVariant: Colors.grey.shade700,

  // Additional surface levels
  surfaceDim: Colors.grey.shade900,
  surfaceBright: Colors.grey.shade800,
  surfaceContainerLowest: Colors.grey.shade900,
  surfaceContainerLow: Colors.grey.shade800,
  surfaceContainer: Colors.grey.shade700,
  surfaceContainerHigh: Colors.grey.shade600,
  surfaceContainerHighest: Colors.grey.shade500,

  // Fixed colors (less common)
  primaryFixed: ColorCollections.PrimaryColor.withOpacity(0.8),
  primaryFixedDim: ColorCollections.PrimaryColor.withOpacity(0.6),
  onPrimaryFixed: Colors.white,
  onPrimaryFixedVariant: Colors.white.withOpacity(0.8),

  secondaryFixed: ColorCollections.PrimaryColor.withOpacity(0.8),
  secondaryFixedDim: ColorCollections.PrimaryColor.withOpacity(0.6),
  onSecondaryFixed: Colors.black,
  onSecondaryFixedVariant: Colors.black.withOpacity(0.8),

  tertiaryFixed: Colors.grey.shade800.withOpacity(0.8),
  tertiaryFixedDim: Colors.grey.shade800.withOpacity(0.6),
  onTertiaryFixed: Colors.white,
  onTertiaryFixedVariant: Colors.white.withOpacity(0.8),

  // Other
  shadow: Colors.black.withOpacity(0.4),
  scrim: Colors.black.withOpacity(0.7),
  inverseSurface: Colors.white,
  onInverseSurface: Colors.black,
  inversePrimary: ColorCollections.PrimaryColor.withOpacity(0.3),
  surfaceTint: ColorCollections.PrimaryColor,
);

