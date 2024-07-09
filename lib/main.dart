import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/common/theme.dart';
import 'package:mood_tracker/features/settings/repos/theme_config_repository.dart';
import 'package:mood_tracker/features/settings/view_models/theme_config_view_model.dart';
import 'package:mood_tracker/firebase_options.dart';
import 'package:mood_tracker/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final repository = ThemeConfigRepository(preferences);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      overrides: [
        themeConfigProvider.overrideWith(
          () => ThemeConfigViewModel(repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Mood Tracker',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeConfigProvider).darkMode
          ? MoodTrackerTheme.dark
          : MoodTrackerTheme.light,
      darkTheme: MoodTrackerTheme.dark,
    );
  }
}
