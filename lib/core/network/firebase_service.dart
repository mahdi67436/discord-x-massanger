import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

/// Firebase service initialization and management
class FirebaseService {
  FirebaseService._();
  
  static final FirebaseService _instance = FirebaseService._();
  static FirebaseService get instance => _instance;
  
  // Firebase instances
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  late FirebaseStorage storage;
  late FirebaseMessaging messaging;
  late FirebaseAnalytics analytics;
  late FirebaseCrashlytics crashlytics;
  late FirebaseRemoteConfig remoteConfig;
  
  // User
  User? get currentUser => auth.currentUser;
  bool get isAuthenticated => currentUser != null;
  String? get currentUserId => currentUser?.uid;
  
  // Initialization
  Future<void> initialize() async {
    // Auth
    auth = FirebaseAuth.instance;
    
    // Firestore
    firestore = FirebaseFirestore.instance;
    _configureFirestore();
    
    // Storage FirebaseStorage.instance;

    storage =    _configureStorage();
    
    // Messaging
    messaging = FirebaseMessaging.instance;
    await _configureMessaging();
    
    // Analytics
    analytics = FirebaseAnalytics.instance;
    await _configureAnalytics();
    
    // Crashlytics
    crashlytics = FirebaseCrashlytics.instance;
    await _configureCrashlytics();
    
    // Remote Config
    remoteConfig = FirebaseRemoteConfig.instance;
    await _configureRemoteConfig();
    
    // Set up auth state listener
    _setupAuthStateListener();
  }
  
  // Configure Firestore
  void _configureFirestore() {
    // Enable persistence
    firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    
    // Configure timestamps
    firestore.settings = const Settings(
      timestampsInSnapshotsEnabled: true,
    );
  }
  
  // Configure Storage
  void _configureStorage() {
    // Set max operation retry time
    storage.maxOperationRetryTime = const Duration(seconds: 30);
    // Set max upload retry time
    storage.maxUploadRetryTime = const Duration(minutes: 5);
    // Set max download retry time
    storage.maxDownloadRetryTime = const Duration(minutes: 5);
  }
  
  // Configure Messaging
  Future<void> _configureMessaging() async {
    // Request permission
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    
    // Get token
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final token = await messaging.getToken();
      // Save token to user document
      if (token != null) {
        await _saveFcmToken(token);
      }
    }
    
    // Set up foreground handler
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    
    // Set up background handler
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }
  
  // Configure Analytics
  Future<void> _configureAnalytics() async {
    // Set analytics collection enabled
    await analytics.setAnalyticsCollectionEnabled(true);
    
    // Set user properties
    // await analytics.setUserProperty(name: 'platform', value: Platform.operatingSystem);
  }
  
  // Configure Crashlytics
  Future<void> _configureCrashlytics() async {
    // Enable crashlytics
    await crashlytics.setCrashlyticsCollectionEnabled(true);
    
    // Pass uncaught errors
    Function originalOnError = FlutterError.presentError;
    FlutterError.presentError = (FlutterErrorDetails details) async {
      await crashlytics.recordFlutterError(details);
      originalOnError(details);
    };
  }
  
  // Configure Remote Config
  Future<void> _configureRemoteConfig() async {
    // Set defaults
    await remoteConfig.setDefaults(<String, dynamic>{
      'ai_moderation_enabled': true,
      'ai_translation_enabled': true,
      'ai_smart_reply_enabled': true,
      'max_upload_size_mb': 100,
      'maintenance_mode': false,
      'min_app_version': '1.0.0',
      'force_update': false,
    });
    
    // Fetch config
    await remoteConfig.fetchAndActivate();
  }
  
  // Save FCM token
  Future<void> _saveFcmToken(String token) async {
    if (currentUser != null) {
      await firestore
          .collection('users')
          .doc(currentUser!.uid)
          .collection('tokens')
          .doc(token)
          .set({
        'token': token,
        'createdAt': FieldValue.serverTimestamp(),
        'platform': 'flutter',
      });
    }
  }
  
  // Handle foreground messages
  void _handleForegroundMessage(RemoteMessage message) {
    // Handle notification
    if (message.notification != null) {
      // Show local notification
    }
    
    // Handle data
    final data = message.data;
    // Process data payload
  }
  
  // Handle background messages
  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    // Handle notification
    if (message.notification != null) {
      // Show local notification
    }
    
    // Handle data
    final data = message.data;
    // Process data payload
  }
  
  // Auth state listener
  void _setupAuthStateListener() {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        // User logged out
      } else {
        // User logged in
        _onUserAuthenticated(user);
      }
    });
  }
  
  // On user authenticated
  Future<void> _onUserAuthenticated(User user) async {
    // Update user presence
    await _updatePresence(user.uid, true);
    
    // Save FCM token
    final token = await messaging.getToken();
    if (token != null) {
      await _saveFcmToken(token);
    }
  }
  
  // Update presence
  Future<void> _updatePresence(String userId, bool online) async {
    await firestore.collection('users').doc(userId).update({
      'isOnline': online,
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }
  
  // Sign out
  Future<void> signOut() async {
    if (currentUser != null) {
      await _updatePresence(currentUser!.uid, false);
    }
    await auth.signOut();
  }
  
  // Delete account
  Future<void> deleteAccount() async {
    if (currentUser != null) {
      await _updatePresence(currentUser!.uid, false);
      await currentUser!.delete();
    }
  }
  
  // Reauthenticate
  Future<void> reauthenticate(String password) async {
    if (currentUser != null && currentUser!.email != null) {
      final credential = EmailAuthProvider.credential(
        email: currentUser!.email!,
        password: password,
      );
      await currentUser!.reauthenticateWithCredential(credential);
    }
  }
  
  // Verify email
  Future<void> sendEmailVerification() async {
    await currentUser?.sendEmailVerification();
  }
  
  // Refresh token
  Future<String?> refreshToken() async {
    return await currentUser?.getIdToken(true);
  }
  
  // Get ID token
  Future<String?> getIdToken() async {
    return await currentUser?.getIdToken();
  }
  
  // Stream auth state
  Stream<User?> get authStateChanges => auth.authStateChanges();
  
  // Get server timestamp
  FieldValue get serverTimestamp => FieldValue.serverTimestamp();
  
  // Create batch
  WriteBatch get batch => firestore.batch();
  
  // Create run transaction
  Future<T> runTransaction<T>(TransactionHandler<T> transactionHandler) {
    return firestore.runTransaction(transactionHandler);
  }
}
