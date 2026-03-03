import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  
  // Initialize all dependencies
  getIt.init();
}

// ============== REPOSITORY REGISTRATIONS ==============

// Auth
// @RegisterAs(AuthRepository)
// abstract class AuthRepositoryImpl implements AuthRepository;

// Messaging
// @RegisterAs(MessageRepository)
// abstract class MessageRepositoryImpl implements MessageRepository;

// Servers
// @RegisterAs(ServerRepository)
// abstract class ServerRepositoryImpl implements ServerRepository;

// ============== SERVICE REGISTRATIONS ==============

// Encryption Service
// getIt.registerLazySingleton<EncryptionService>(
//   () => EncryptionServiceImpl(),
// );

// AI Service
// getIt.registerLazySingleton<AIService>(
//   () => AIServiceImpl(),
// );

// Media Service
// getIt.registerLazySingleton<MediaService>(
//   () => MediaServiceImpl(),
// );

// Voice/Video Service
// getIt.registerLazySingleton<VoiceVideoService>(
//   () => VoiceVideoServiceImpl(),
// );

// Storage Service
// getIt.registerLazySingleton<StorageService>(
//   () => StorageServiceImpl(),
// );

// Cache Service
// getIt.registerLazySingleton<CacheService>(
//   () => CacheServiceImpl(),
// );

// Notification Service
// getIt.registerLazySingleton<NotificationService>(
//   () => NotificationServiceImpl(),
// );

// Analytics Service
// getIt.registerLazySingleton<AnalyticsService>(
//   () => AnalyticsServiceImpl(),
// );

// Moderation Service
// getIt.registerLazySingleton<ModerationService>(
//   () => ModerationServiceImpl(),
// );
