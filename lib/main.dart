import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samatea/features/splash/presentation/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Samatea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Set global background to white
        // Use League Spartan for headings/display
        fontFamily: GoogleFonts.leagueSpartan().fontFamily,
        // Use Poppins for body text
        textTheme: GoogleFonts.leagueSpartanTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          bodyMedium: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          bodyLarge: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
          bodySmall: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
