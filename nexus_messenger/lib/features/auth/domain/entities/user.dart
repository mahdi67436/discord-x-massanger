import 'package:equatable/equatable.dart';

/// User status enumeration
enum UserStatus {
  online,
  idle,
  dnd,
  offline,
}

/// User entity representing a user in the system
class User extends Equatable {
  final String id;
  final String username;
  final String displayName;
  final String? email;
  final String? avatarUrl;
  final String? bannerUrl;
  final String? bio;
  final UserStatus status;
  final String? statusText;
  final bool isVerified;
  final bool isPremium;
  final bool isBot;
  final bool isStaff;
  final bool isBanned;
  final DateTime createdAt;
  final DateTime? lastSeen;
  final bool isOnline;
  final Map<String, dynamic>? settings;
  final List<String>? blockedUsers;
  final List<String>? mutedUsers;
  final String? locale;
  final String? timezone;
  final int? accentColor;
  final List<String>? roles;
  final String? tenantId;
  final int messageCount;
  final int friendCount;
  final int serverCount;

  const User({
    required this.id,
    required this.username,
    required this.displayName,
    this.email,
    this.avatarUrl,
    this.bannerUrl,
    this.bio,
    this.status = UserStatus.offline,
    this.statusText,
    this.isVerified = false,
    this.isPremium = false,
    this.isBot = false,
    this.isStaff = false,
    this.isBanned = false,
    required this.createdAt,
    this.lastSeen,
    this.isOnline = false,
    this.settings,
    this.blockedUsers,
    this.mutedUsers,
    this.locale,
    this.timezone,
    this.accentColor,
    this.roles,
    this.tenantId,
    this.messageCount = 0,
    this.friendCount = 0,
    this.serverCount = 0,
  });

  /// Create user from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      bio: json['bio'] as String?,
      status: UserStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => UserStatus.offline,
      ),
      statusText: json['statusText'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      isPremium: json['isPremium'] as bool? ?? false,
      isBot: json['isBot'] as bool? ?? false,
      isStaff: json['isStaff'] as bool? ?? false,
      isBanned: json['isBanned'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastSeen: json['lastSeen'] != null
          ? DateTime.parse(json['lastSeen'] as String)
          : null,
      isOnline: json['isOnline'] as bool? ?? false,
      settings: json['settings'] as Map<String, dynamic>?,
      blockedUsers: (json['blockedUsers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mutedUsers: (json['mutedUsers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      locale: json['locale'] as String?,
      timezone: json['timezone'] as String?,
      accentColor: json['accentColor'] as int?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tenantId: json['tenantId'] as String?,
      messageCount: json['messageCount'] as int? ?? 0,
      friendCount: json['friendCount'] as int? ?? 0,
      serverCount: json['serverCount'] as int? ?? 0,
    );
  }

  /// Convert user to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'displayName': displayName,
      'email': email,
      'avatarUrl': avatarUrl,
      'bannerUrl': bannerUrl,
      'bio': bio,
      'status': status.name,
      'statusText': statusText,
      'isVerified': isVerified,
      'isPremium': isPremium,
      'isBot': isBot,
      'isStaff': isStaff,
      'isBanned': isBanned,
      'createdAt': createdAt.toIso8601String(),
      'lastSeen': lastSeen?.toIso8601String(),
      'isOnline': isOnline,
      'settings': settings,
      'blockedUsers': blockedUsers,
      'mutedUsers': mutedUsers,
      'locale': locale,
      'timezone': timezone,
      'accentColor': accentColor,
      'roles': roles,
      'tenantId': tenantId,
      'messageCount': messageCount,
      'friendCount': friendCount,
      'serverCount': serverCount,
    };
  }

  /// Create a copy with modified fields
  User copyWith({
    String? id,
    String? username,
    String? displayName,
    String? email,
    String? avatarUrl,
    String? bannerUrl,
    String? bio,
    UserStatus? status,
    String? statusText,
    bool? isVerified,
    bool? isPremium,
    bool? isBot,
    bool? isStaff,
    bool? isBanned,
    DateTime? createdAt,
    DateTime? lastSeen,
    bool? isOnline,
    Map<String, dynamic>? settings,
    List<String>? blockedUsers,
    List<String>? mutedUsers,
    String? locale,
    String? timezone,
    int? accentColor,
    List<String>? roles,
    String? tenantId,
    int? messageCount,
    int? friendCount,
    int? serverCount,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      bio: bio ?? this.bio,
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
      isVerified: isVerified ?? this.isVerified,
      isPremium: isPremium ?? this.isPremium,
      isBot: isBot ?? this.isBot,
      isStaff: isStaff ?? this.isStaff,
      isBanned: isBanned ?? this.isBanned,
      createdAt: createdAt ?? this.createdAt,
      lastSeen: lastSeen ?? this.lastSeen,
      isOnline: isOnline ?? this.isOnline,
      settings: settings ?? this.settings,
      blockedUsers: blockedUsers ?? this.blockedUsers,
      mutedUsers: mutedUsers ?? this.mutedUsers,
      locale: locale ?? this.locale,
      timezone: timezone ?? this.timezone,
      accentColor: accentColor ?? this.accentColor,
      roles: roles ?? this.roles,
      tenantId: tenantId ?? this.tenantId,
      messageCount: messageCount ?? this.messageCount,
      friendCount: friendCount ?? this.friendCount,
      serverCount: serverCount ?? this.serverCount,
    );
  }

  /// Get avatar URL with fallback
  String getDisplayAvatar({int size = 128}) {
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return avatarUrl!;
    }
    // Generate default avatar using username
    return 'https://api.dicebear.com/7.x/initials/svg?seed=$username&size=$size';
  }

  /// Get banner URL with fallback
  String? getDisplayBanner() {
    if (bannerUrl != null && bannerUrl!.isNotEmpty) {
      return bannerUrl;
    }
    // Generate gradient banner based on user ID hash
    return null;
  }

  /// Check if user can be contacted
  bool get isContactable => !isBanned && !isBlocked;

  /// Check if user is blocked
  bool isBlockedBy(String userId) {
    return blockedUsers?.contains(userId) ?? false;
  }

  /// Get status color
  int get statusColor {
    switch (status) {
      case UserStatus.online:
        return 0xFF22C55E;
      case UserStatus.idle:
        return 0xFFF59E0B;
      case UserStatus.dnd:
        return 0xFFEF4444;
      case UserStatus.offline:
        return 0xFF6B7280;
    }
  }

  @override
  List<Object?> get props => [
        id,
        username,
        displayName,
        email,
        avatarUrl,
        bannerUrl,
        bio,
        status,
        statusText,
        isVerified,
        isPremium,
        isBot,
        isStaff,
        isBanned,
        createdAt,
        lastSeen,
        isOnline,
        settings,
        blockedUsers,
        mutedUsers,
        locale,
        timezone,
        accentColor,
        roles,
        tenantId,
        messageCount,
        friendCount,
        serverCount,
      ];
}

/// User profile with additional details
class UserProfile extends Equatable {
  final User user;
  final int followersCount;
  final int followingCount;
  final int serversCount;
  final List<String>? badges;
  final Map<String, dynamic>? analytics;
  final DateTime? premiumSince;
  final DateTime? nitroSince;

  const UserProfile({
    required this.user,
    this.followersCount = 0,
    this.followingCount = 0,
    this.serversCount = 0,
    this.badges,
    this.analytics,
    this.premiumSince,
    this.nitroSince,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      followersCount: json['followersCount'] as int? ?? 0,
      followingCount: json['followingCount'] as int? ?? 0,
      serversCount: json['serversCount'] as int? ?? 0,
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      analytics: json['analytics'] as Map<String, dynamic>?,
      premiumSince: json['premiumSince'] != null
          ? DateTime.parse(json['premiumSince'] as String)
          : null,
      nitroSince: json['nitroSince'] != null
          ? DateTime.parse(json['nitroSince'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'followersCount': followersCount,
      'followingCount': followingCount,
      'serversCount': serversCount,
      'badges': badges,
      'analytics': analytics,
      'premiumSince': premiumSince?.toIso8601String(),
      'nitroSince': nitroSince?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        user,
        followersCount,
        followingCount,
        serversCount,
        badges,
        analytics,
        premiumSince,
        nitroSince,
      ];
}

/// User settings
class UserSettings extends Equatable {
  final String theme;
  final String locale;
  final bool showOnlineStatus;
  final bool allowDirectMessages;
  final bool allowServerInvites;
  final bool readReceipts;
  final bool typingIndicators;
  final bool animatedEmoji;
  final bool compactMode;
  final bool developerMode;
  final String messageDisplay;
  final String emojiStyle;
  final bool inlineMedia;
  final bool linkPreview;
  final String notificationSettings;

  const UserSettings({
    this.theme = 'system',
    this.locale = 'en',
    this.showOnlineStatus = true,
    this.allowDirectMessages = true,
    this.allowServerInvites = true,
    this.readReceipts = true,
    this.typingIndicators = true,
    this.animatedEmoji = true,
    this.compactMode = false,
    this.developerMode = false,
    this.messageDisplay = 'clean',
    this.emojiStyle = 'apple',
    this.inlineMedia = true,
    this.linkPreview = true,
    this.notificationSettings = 'all',
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      theme: json['theme'] as String? ?? 'system',
      locale: json['locale'] as String? ?? 'en',
      showOnlineStatus: json['showOnlineStatus'] as bool? ?? true,
      allowDirectMessages: json['allowDirectMessages'] as bool? ?? true,
      allowServerInvites: json['allowServerInvites'] as bool? ?? true,
      readReceipts: json['readReceipts'] as bool? ?? true,
      typingIndicators: json['typingIndicators'] as bool? ?? true,
      animatedEmoji: json['animatedEmoji'] as bool? ?? true,
      compactMode: json['compactMode'] as bool? ?? false,
      developerMode: json['developerMode'] as bool? ?? false,
      messageDisplay: json['messageDisplay'] as String? ?? 'clean',
      emojiStyle: json['emojiStyle'] as String? ?? 'apple',
      inlineMedia: json['inlineMedia'] as bool? ?? true,
      linkPreview: json['linkPreview'] as bool? ?? true,
      notificationSettings: json['notificationSettings'] as String? ?? 'all',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme,
      'locale': locale,
      'showOnlineStatus': showOnlineStatus,
      'allowDirectMessages': allowDirectMessages,
      'allowServerInvites': allowServerInvites,
      'readReceipts': readReceipts,
      'typingIndicators': typingIndicators,
      'animatedEmoji': animatedEmoji,
      'compactMode': compactMode,
      'developerMode': developerMode,
      'messageDisplay': messageDisplay,
      'emojiStyle': emojiStyle,
      'inlineMedia': inlineMedia,
      'linkPreview': linkPreview,
      'notificationSettings': notificationSettings,
    };
  }

  UserSettings copyWith({
    String? theme,
    String? locale,
    bool? showOnlineStatus,
    bool? allowDirectMessages,
    bool? allowServerInvites,
    bool? readReceipts,
    bool? typingIndicators,
    bool? animatedEmoji,
    bool? compactMode,
    bool? developerMode,
    String? messageDisplay,
    String? emojiStyle,
    bool? inlineMedia,
    bool? linkPreview,
    String? notificationSettings,
  }) {
    return UserSettings(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      showOnlineStatus: showOnlineStatus ?? this.showOnlineStatus,
      allowDirectMessages: allowDirectMessages ?? this.allowDirectMessages,
      allowServerInvites: allowServerInvites ?? this.allowServerInvites,
      readReceipts: readReceipts ?? this.readReceipts,
      typingIndicators: typingIndicators ?? this.typingIndicators,
      animatedEmoji: animatedEmoji ?? this.animatedEmoji,
      compactMode: compactMode ?? this.compactMode,
      developerMode: developerMode ?? this.developerMode,
      messageDisplay: messageDisplay ?? this.messageDisplay,
      emojiStyle: emojiStyle ?? this.emojiStyle,
      inlineMedia: inlineMedia ?? this.inlineMedia,
      linkPreview: linkPreview ?? this.linkPreview,
      notificationSettings: notificationSettings ?? this.notificationSettings,
    );
  }

  @override
  List<Object?> get props => [
        theme,
        locale,
        showOnlineStatus,
        allowDirectMessages,
        allowServerInvites,
        readReceipts,
        typingIndicators,
        animatedEmoji,
        compactMode,
        developerMode,
        messageDisplay,
        emojiStyle,
        inlineMedia,
        linkPreview,
        notificationSettings,
      ];
}
