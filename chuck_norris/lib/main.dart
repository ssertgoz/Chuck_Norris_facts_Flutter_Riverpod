import 'package:chuck_norris/routing/app_router.dart';
import 'package:chuck_norris/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      title: 'Chuck Horris',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.themColor),
        textTheme: GoogleFonts.kalamTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
    );
  }
}
