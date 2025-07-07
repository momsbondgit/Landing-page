import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moms_bond/viewmodels/app_viewmodel.dart';
import 'package:moms_bond/views/landing_page.dart';

void main() {
  runApp(const MomsBondApp());
}

class MomsBondApp extends StatelessWidget {
  const MomsBondApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppViewModel()),
      ],
      child: MaterialApp(
        title: 'MomsBond',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFE91E63),
            brightness: Brightness.light,
          ),
          textTheme: GoogleFonts.interTextTheme(),
          useMaterial3: true,
        ),
        home: const LandingPage(),
      ),
    );
  }
} 