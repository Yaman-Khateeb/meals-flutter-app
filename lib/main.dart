

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tabs_screen.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark

  ),
  textTheme: GoogleFonts.latoTextTheme()
);

void main()
{
  runApp(
    ProviderScope(child: 
    MaterialApp(
      theme: theme,
      home: 
    const TabsScreen()
    )
    )
  );
}