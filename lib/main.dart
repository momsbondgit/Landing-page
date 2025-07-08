import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/waitlist_viewmodel.dart';
import 'views/mobile/mobile_landing_page.dart';

void main() {
  runApp(const MomsBondApp());
}

class MomsBondApp extends StatelessWidget {
  const MomsBondApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WaitlistViewModel()),
      ],
      child: MaterialApp(
        title: 'Moms Bond',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
        ),
        home: const MobileLandingPage(),
      ),
    );
  }
}
