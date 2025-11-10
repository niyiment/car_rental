 import 'package:flutter/material.dart';

 import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';

 class AppTheme {
   // Primary Colors
   static const Color primaryColor = Colors.black;
   static const Color secondaryColor = Color(0xFF2C2C2C);
   static const Color accentColor = Color(0xFF00AAE4); // Hyundai Blue

   // Light Theme Colors
   static const Color lightBackground = Color(0xFFF8F9FA);
   static const Color lightSurface = Colors.white;
   static const Color lightText = Color(0xFF1A1A1A);
   static const Color lightTextSecondary = Color(0xFF6B6B6B);

   // Dark Theme Colors
   static const Color darkBackground = Color(0xFF0D0D0D);
   static const Color darkSurface = Color(0xFF1A1A1A);
   static const Color darkText = Color(0xFFF8F9FA);
   static const Color darkTextSecondary = Color(0xFFB0B0B0);

   // Shared Colors
   static const Color success = Color(0xFF10B981);
   static const Color error = Color(0xFFEF4444);
   static const Color warning = Color(0xFFF59E0B);
   static const Color info = Color(0xFF3B82F6);

   // Text Theme
   static TextTheme _textTheme(Color textColor) {
     return TextTheme(
       displayLarge: GoogleFonts.inter(
         fontSize: 32,
         fontWeight: FontWeight.bold,
         color: textColor,
         letterSpacing: -0.5,
       ),
       displayMedium: GoogleFonts.inter(
         fontSize: 28,
         fontWeight: FontWeight.bold,
         color: textColor,
         letterSpacing: -0.5,
       ),
       displaySmall: GoogleFonts.inter(
         fontSize: 24,
         fontWeight: FontWeight.bold,
         color: textColor,
         letterSpacing: -0.25,
       ),
       headlineLarge: GoogleFonts.inter(
         fontSize: 22,
         fontWeight: FontWeight.w600,
         color: textColor,
       ),
       headlineMedium: GoogleFonts.inter(
         fontSize: 20,
         fontWeight: FontWeight.w600,
         color: textColor,
       ),
       headlineSmall: GoogleFonts.inter(
         fontSize: 18,
         fontWeight: FontWeight.w600,
         color: textColor,
       ),
       titleLarge: GoogleFonts.inter(
         fontSize: 16,
         fontWeight: FontWeight.w600,
         color: textColor,
       ),
       titleMedium: GoogleFonts.inter(
         fontSize: 14,
         fontWeight: FontWeight.w600,
         color: textColor,
       ),
       titleSmall: GoogleFonts.inter(
         fontSize: 12,
         fontWeight: FontWeight.w600,
         color: textColor,
       ),
       bodyLarge: GoogleFonts.inter(
         fontSize: 16,
         fontWeight: FontWeight.normal,
         color: textColor,
       ),
       bodyMedium: GoogleFonts.inter(
         fontSize: 14,
         fontWeight: FontWeight.normal,
         color: textColor,
       ),
       bodySmall: GoogleFonts.inter(
         fontSize: 12,
         fontWeight: FontWeight.normal,
         color: textColor,
       ),
       labelLarge: GoogleFonts.inter(
         fontSize: 14,
         fontWeight: FontWeight.w500,
         color: textColor,
       ),
       labelMedium: GoogleFonts.inter(
         fontSize: 12,
         fontWeight: FontWeight.w500,
         color: textColor,
       ),
       labelSmall: GoogleFonts.inter(
         fontSize: 10,
         fontWeight: FontWeight.w500,
         color: textColor,
       ),
     );
   }

   // Light Theme
   static ThemeData lightTheme = ThemeData(
     useMaterial3: true,
     brightness: Brightness.light,
     primaryColor: primaryColor,
     scaffoldBackgroundColor: lightBackground,
     colorScheme: const ColorScheme.light(
       primary: primaryColor,
       secondary: secondaryColor,
       surface: lightSurface,
       onPrimary: Colors.white,
       onSecondary: Colors.white,
       onSurface: lightText,
       error: error,
     ),
     textTheme: _textTheme(lightText),
     appBarTheme: AppBarTheme(
       backgroundColor: lightBackground,
       elevation: 0,
       centerTitle: false,
       iconTheme: const IconThemeData(color: primaryColor),
       titleTextStyle: GoogleFonts.inter(
         fontSize: 20,
         fontWeight: FontWeight.w600,
         color: lightText,
       ),
     ),
     cardTheme: CardThemeData(
       color: lightSurface,
       elevation: 0,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(16),
       ),
     ),
     elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         backgroundColor: primaryColor,
         foregroundColor: Colors.white,
         elevation: 0,
         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
         ),
         textStyle: GoogleFonts.inter(
           fontSize: 16,
           fontWeight: FontWeight.w600,
         ),
       ),
     ),
     outlinedButtonTheme: OutlinedButtonThemeData(
       style: OutlinedButton.styleFrom(
         foregroundColor: primaryColor,
         side: const BorderSide(color: primaryColor, width: 1.5),
         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
         ),
         textStyle: GoogleFonts.inter(
           fontSize: 16,
           fontWeight: FontWeight.w600,
         ),
       ),
     ),
     inputDecorationTheme: InputDecorationTheme(
       filled: true,
       fillColor: lightSurface,
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
         borderSide: BorderSide(color: Colors.grey.shade300),
       ),
       enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
         borderSide: BorderSide(color: Colors.grey.shade300),
       ),
       focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
         borderSide: const BorderSide(color: primaryColor, width: 2),
       ),
       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
     ),
     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
       backgroundColor: lightSurface,
       selectedItemColor: primaryColor,
       unselectedItemColor: lightTextSecondary,
       type: BottomNavigationBarType.fixed,
       elevation: 0,
     ),
     chipTheme: ChipThemeData(
       backgroundColor: Colors.grey.shade100,
       selectedColor: primaryColor,
       labelStyle: GoogleFonts.inter(fontSize: 12),
       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8),
       ),
     ),
   );

   // Dark Theme
   static ThemeData darkTheme = ThemeData(
     useMaterial3: true,
     brightness: Brightness.dark,
     primaryColor: Colors.white,
     scaffoldBackgroundColor: darkBackground,
     colorScheme: const ColorScheme.dark(
       primary: Colors.white,
       secondary: Color(0xFF3A3A3A),
       surface: darkSurface,
       onPrimary: Colors.black,
       onSecondary: Colors.white,
       onSurface: darkText,
       error: error,
     ),
     textTheme: _textTheme(darkText),
     appBarTheme: AppBarTheme(
       backgroundColor: darkBackground,
       elevation: 0,
       centerTitle: false,
       iconTheme: const IconThemeData(color: Colors.white),
       titleTextStyle: GoogleFonts.inter(
         fontSize: 20,
         fontWeight: FontWeight.w600,
         color: darkText,
       ),
     ),
     cardTheme: CardThemeData(
       color: darkSurface,
       elevation: 0,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(16),
       ),
     ),
     elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         backgroundColor: Colors.white,
         foregroundColor: Colors.black,
         elevation: 0,
         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
         ),
         textStyle: GoogleFonts.inter(
           fontSize: 16,
           fontWeight: FontWeight.w600,
         ),
       ),
     ),
     outlinedButtonTheme: OutlinedButtonThemeData(
       style: OutlinedButton.styleFrom(
         foregroundColor: Colors.white,
         side: const BorderSide(color: Colors.white, width: 1.5),
         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
         ),
         textStyle: GoogleFonts.inter(
           fontSize: 16,
           fontWeight: FontWeight.w600,
         ),
       ),
     ),
     inputDecorationTheme: InputDecorationTheme(
       filled: true,
       fillColor: darkSurface,
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
         borderSide: const BorderSide(color: Color(0xFF3A3A3A)),
       ),
       enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
         borderSide: const BorderSide(color: Color(0xFF3A3A3A)),
       ),
       focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
         borderSide: const BorderSide(color: Colors.white, width: 2),
       ),
       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
     ),
     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
       backgroundColor: darkSurface,
       selectedItemColor: Colors.white,
       unselectedItemColor: darkTextSecondary,
       type: BottomNavigationBarType.fixed,
       elevation: 0,
     ),
     chipTheme: ChipThemeData(
       backgroundColor: const Color(0xFF2A2A2A),
       selectedColor: Colors.white,
       labelStyle: GoogleFonts.inter(fontSize: 12, color: darkText),
       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8),
       ),
     ),
   );
 }
