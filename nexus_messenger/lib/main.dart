import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'core/di/injection.dart';
import 'core/network/firebase_service.dart';
import 'core/error/failures.dart';
import 'features/auth/presentation/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  // Initialize Firebase
  await Firebase.initializeApp();
      storageBucket: AppConstants.firebaseStorageBucket,
      authDomain: AppConstants.firebaseAuthDomain,
    ),
  );
  
  // Initialize dependency injection
  await configureDependencies();
  
  // Initialize Firebase services
  await FirebaseService.initialize();
  
  runApp(
    const ProviderScope(
      child: NexusMessengerApp(),
    ),
  );
}

class NexusMessengerApp extends StatelessWidget {
  const NexusMessengerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexus Messenger',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      builder: (context, child) {
        return ErrorBuilder(
          builder: (error, stack) {
            if (error != null) {
              return _ErrorOverlay(error: error.toString());
            }
            return child ?? const SizedBox.shrink();
          },
        );
      },
    );
  }
}

class _ErrorOverlay extends StatelessWidget {
  final String error;

  const _ErrorOverlay({required this.error});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'An error occurred:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
