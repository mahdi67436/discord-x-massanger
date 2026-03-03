/// Application-wide constants
class AppConstants {
  AppConstants._();

  // ============== APP INFO ==============
  static const String appName = 'Nexus Messenger';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1000';

  // ============== FIREBASE CONFIG ==============
  // Replace with your Firebase configuration
  static const String firebaseApiKey = 'YOUR_API_KEY';
  static const String firebaseAppId = 'YOUR_APP_ID';
  static const String firebaseMessagingSenderId = 'YOUR_SENDER_ID';
  static const String firebaseProjectId = 'nexus-messenger';
  static const String firebaseStorageBucket = 'nexus-messenger.appspot.com';
  static const String firebaseAuthDomain = 'nexus-messenger.firebaseapp.com';

  // ============== PAGINATION ==============
  static const int defaultPageSize = 20;
  static const int messagePageSize = 50;
  static const int maxMessageLength = 4000;
  static const int maxSubjectLength = 256;
  static const int maxBioLength = 500;

  // ============== MEDIA ==============
  static const int maxImageSizeMB = 10;
  static const int maxVideoSizeMB = 100;
  static const int maxFileSizeMB = 100;
  static const int thumbnailQuality = 80;
  static const int imageCompressionQuality = 85;
  static const int maxMediaPreviewCount = 10;

  // ============== VOICE & VIDEO ==============
  static const int maxParticipantsPerCall = 100;
  static const int maxVoiceChannelUsers = 500;
  static const int maxScreenShareDurationMinutes = 120;
  static const int voiceBitrate = 128;
  static const int videoBitrate = 2500;
  static const int videoWidth = 1280;
  static const int videoHeight = 720;
  static const int videoFrameRate = 30;

  // ============== SERVER LIMITS ==============
  static const int maxServersPerUser = 100;
  static const int maxChannelsPerServer = 500;
  static const int maxRolesPerServer = 50;
  static const int maxMembersPerServer = 500000;
  static const int maxEmojiPerServer = 200;
  static const int maxStickersPerServer = 100;

  // ============== ENTERPRISE LIMITS ==============
  static const int maxDepartmentsPerOrg = 100;
  static const int maxProjectsPerOrg = 1000;
  static const int maxTasksPerProject = 10000;
  static const int maxCalendarEvents = 5000;

  // ============== CACHE ==============
  static const int messageCacheDurationDays = 30;
  static const int userCacheDurationDays = 7;
  static const int serverCacheDurationDays = 7;
  static const int maxCachedMessages = 1000;

  // ============== TIME LIMITS ==============
  static const int messageEditTimeoutMinutes = 15;
  static const int messageDeleteTimeoutHours = 24;
  static const int defaultDisappearingMessageHours = 24;
  static const int maxScheduledMessageDays = 365;
  static const int typingIndicatorTimeoutSeconds = 5;
  static const int onlineStatusTimeoutSeconds = 30;
  static const int readReceiptTimeoutSeconds = 10;

  // ============== RATE LIMITS ==============
  static const int maxMessagesPerMinute = 20;
  static const int maxMessagesPerHour = 500;
  static const int maxFriendRequestsPerDay = 50;
  static const int maxServerInvitesPerDay = 100;
  static const int maxReactionChangesPerMinute = 30;

  // ============== AI ENGINE ==============
  static const int aiModerationConfidenceThreshold = 75;
  static const int aiAutoReplyMinConfidence = 80;
  static const int aiTranslationMinConfidence = 90;
  static const int aiBehaviorAnalysisWindowDays = 30;
  static const int aiRiskScoreThreshold = 70;
  static const int aiLearningMinSamples = 100;

  // ============== ENCRYPTION ==============
  static const int aesKeySize = 256;
  static const int rsaKeySize = 2048;
  static const int keyRotationDays = 90;
  static const int maxDevicesPerUser = 10;
  static const int sessionTimeoutMinutes = 30;

  // ============== NOTIFICATIONS ==============
  static const int maxNotificationQueue = 100;
  static const int notificationRetentionDays = 7;

  // ============== ANALYTICS ==============
  static const int analyticsBatchSize = 50;
  static const int analyticsFlushIntervalMinutes = 15;

  // ============== STORAGE KEYS ==============
  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  static const String keyEncryptionKey = 'encryption_key';
  static const String keyPrivateKey = 'private_key';
  static const String keyPublicKey = 'public_key';
  static const String keyLastSync = 'last_sync';
  static const String keyDeviceId = 'device_id';
  static const String keyOnboardingComplete = 'onboarding_complete';

  // ============== FIRESTORE COLLECTIONS ==============
  static const String collUsers = 'users';
  static const String collMessages = 'messages';
  static const String collConversations = 'conversations';
  static const String collServers = 'servers';
  static const String collChannels = 'channels';
  static const String collRoles = 'roles';
  static const String collMembers = 'members';
  static const String collReactions = 'reactions';
  static const String collCallLogs = 'call_logs';
  static const String collOrganizations = 'organizations';
  static const String collDepartments = 'departments';
  static const String collProjects = 'projects';
  static const String collTasks = 'tasks';
  static const String collEvents = 'events';
  static const String collAnalytics = 'analytics';
  static const String collAuditLogs = 'audit_logs';
  static const String collAIModels = 'ai_models';
  static const String collModeration = 'moderation';
  static const String collReports = 'reports';
  static const String collBans = 'bans';
  static const String collSubscriptions = 'subscriptions';
  static const String collPayments = 'payments';

  // ============== REAL-TIME SUBSCRIPTIONS ==============
  static const String subMessages = 'messages';
  static const String subTyping = 'typing';
  static const String subPresence = 'presence';
  static const String subVoice = 'voice';
  static const String subNotifications = 'notifications';

  // ============== VALIDATION ==============
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 32;
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int minDisplayNameLength = 1;
  static const int maxDisplayNameLength = 100;
  static const int minServerNameLength = 2;
  static const int maxServerNameLength = 100;
  static const int minChannelNameLength = 1;
  static const int maxChannelNameLength = 100;

  // ============== REGEX PATTERNS ==============
  static const String usernamePattern = r'^[a-zA-Z0-9_]{3,32}$';
  static const String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String passwordPattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  static const String urlPattern = r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$';

  // ============== ANIMATION DURATIONS ==============
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  static const Duration splashDuration = Duration(seconds: 2);

  // ============== DEBOUNCE DELAYS ==============
  static const Duration searchDebounce = Duration(milliseconds: 300);
  static const Duration typingDebounce = Duration(milliseconds: 500);
  static const Duration filterDebounce = Duration(milliseconds: 400);

  // ============== ERROR MESSAGES ==============
  static const String errorNetwork = 'Network error. Please check your connection.';
  static const String errorServer = 'Server error. Please try again later.';
  static const String errorUnknown = 'An unknown error occurred.';
  static const String errorUnauthorized = 'Session expired. Please login again.';
  static const String errorNotFound = 'Resource not found.';
  static const String errorPermission = 'Permission denied.';
  static const String errorRateLimit = 'Too many requests. Please slow down.';
  static const String errorMaintenance = 'Service under maintenance.';

  // ============== SUCCESS MESSAGES ==============
  static const String successMessageSent = 'Message sent successfully';
  static const String successMessageDeleted = 'Message deleted';
  static const String successMessageEdited = 'Message edited';
  static const String successServerCreated = 'Server created successfully';
  static const String successChannelCreated = 'Channel created successfully';
  static const String successProfileUpdated = 'Profile updated successfully';
  static const String successSettingsSaved = 'Settings saved successfully';

  // ============== PLACEHOLDER MESSAGES ==============
  static const String placeholderTypeMessage = 'Type a message...';
  static const String placeholderSearch = 'Search...';
  static const String placeholderEmail = 'Enter your email';
  static const String placeholderPassword = 'Enter your password';
  static const String placeholderUsername = 'Enter your username';
  static const String placeholderDisplayName = 'Enter your display name';
  static const String placeholderServerName = 'Enter server name';
  static const String placeholderChannelName = 'Enter channel name';
  static const String placeholderBio = 'Write something about yourself...';

  // ============== EMPTY STATE MESSAGES ==============
  static const String emptyNoMessages = 'No messages yet. Start the conversation!';
  static const String emptyNoServers = 'You don\'t have any servers yet. Create one!';
  static const String emptyNoChannels = 'No channels in this server.';
  static const String emptyNoContacts = 'No contacts yet.';
  static const String emptyNoNotifications = 'No notifications.';
  static const String emptyNoResults = 'No results found.';

  // ============== CONFIRMATION MESSAGES ==============
  static const String confirmDeleteMessage = 'Are you sure you want to delete this message?';
  static const String confirmLeaveServer = 'Are you sure you want to leave this server?';
  static const String confirmDeleteAccount = 'Are you sure you want to delete your account? This action cannot be undone.';
  static const String confirmLogout = 'Are you sure you want to logout?';

  // ============== SUBSCRIPTION PLANS ==============
  static const double freePlanPrice = 0.0;
  static const double proPlanPrice = 9.99;
  static const double businessPlanPrice = 24.99;
  static const double enterprisePlanPrice = 99.99;

  // ============== AI MODEL VERSIONS ==============
  static const String aiModerationModelVersion = '2.1.0';
  static const String aiTranslationModelVersion = '1.5.0';
  static const String aiSentimentModelVersion = '1.8.0';
  static const String aiSpamFilterModelVersion = '3.0.0';
  static const String aiAssistantModelVersion = '1.0.0';
}
