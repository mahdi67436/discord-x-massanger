import 'package:equatable/equatable.dart';

/// Channel type enumeration
enum ChannelType {
  text,
  voice,
  category,
  stage,
  announcement,
  forum,
  media,
}

/// Server entity representing a Discord-style server
class Server extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? iconUrl;
  final String? bannerUrl;
  final String? splashUrl;
  final String ownerId;
  final String region;
  final int? memberCount;
  final int? presenceCount;
  final int? maxMembers;
  final bool isVerified;
  final bool isPartnered;
  final bool isDiscoverable;
  final bool isFeatured;
  final bool isBoosted;
  final int boostLevel;
  final int? boostCount;
  final DateTime createdAt;
  final List<String>? roles;
  final List<String>? channels;
  final List<String>? emojis;
  final List<String>? stickers;
  final List<String>? rulesChannelIds;
  final List<String>? publicUpdatesChannelIds;
  final String? widgetChannelId;
  final String? widgetEnabledChannelId;
  final String? systemChannelId;
  final String? rulesChannelId;
  final Map<String, dynamic>? features;
  final String? vanityUrl;
  final int? approximateMemberCount;
  final int? approximatePresenceCount;
  final String? premiumSubscriptionId;
  final String? nsfwLevel;
  final String? safetyAlertsChannelId;

  const Server({
    required this.id,
    required this.name,
    this.description,
    this.iconUrl,
    this.bannerUrl,
    this.splashUrl,
    required this.ownerId,
    this.region = 'us-east',
    this.memberCount,
    this.presenceCount,
    this.maxMembers,
    this.isVerified = false,
    this.isPartnered = false,
    this.isDiscoverable = true,
    this.isFeatured = false,
    this.isBoosted = false,
    this.boostLevel = 0,
    this.boostCount,
    required this.createdAt,
    this.roles,
    this.channels,
    this.emojis,
    this.stickers,
    this.rulesChannelIds,
    this.publicUpdatesChannelIds,
    this.widgetChannelId,
    this.widgetEnabledChannelId,
    this.systemChannelId,
    this.rulesChannelId,
    this.features,
    this.vanityUrl,
    this.approximateMemberCount,
    this.approximatePresenceCount,
    this.premiumSubscriptionId,
    this.nsfwLevel,
    this.safetyAlertsChannelId,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      iconUrl: json['iconUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      splashUrl: json['splashUrl'] as String?,
      ownerId: json['ownerId'] as String,
      region: json['region'] as String? ?? 'us-east',
      memberCount: json['memberCount'] as int?,
      presenceCount: json['presenceCount'] as int?,
      maxMembers: json['maxMembers'] as int?,
      isVerified: json['isVerified'] as bool? ?? false,
      isPartnered: json['isPartnered'] as bool? ?? false,
      isDiscoverable: json['isDiscoverable'] as bool? ?? true,
      isFeatured: json['isFeatured'] as bool? ?? false,
      isBoosted: json['isBoosted'] as bool? ?? false,
      boostLevel: json['boostLevel'] as int? ?? 0,
      boostCount: json['boostCount'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stickers: (json['stickers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rulesChannelIds: (json['rulesChannelIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      publicUpdatesChannelIds: (json['publicUpdatesChannelIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      widgetChannelId: json['widgetChannelId'] as String?,
      widgetEnabledChannelId: json['widgetEnabledChannelId'] as String?,
      systemChannelId: json['systemChannelId'] as String?,
      rulesChannelId: json['rulesChannelId'] as String?,
      features: json['features'] as Map<String, dynamic>?,
      vanityUrl: json['vanityUrl'] as String?,
      approximateMemberCount: json['approximateMemberCount'] as int?,
      approximatePresenceCount: json['approximatePresenceCount'] as int?,
      premiumSubscriptionId: json['premiumSubscriptionId'] as String?,
      nsfwLevel: json['nsfwLevel'] as String?,
      safetyAlertsChannelId: json['safetyAlertsChannelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconUrl': iconUrl,
      'bannerUrl': bannerUrl,
      'splashUrl': splashUrl,
      'ownerId': ownerId,
      'region': region,
      'memberCount': memberCount,
      'presenceCount': presenceCount,
      'maxMembers': maxMembers,
      'isVerified': isVerified,
      'isPartnered': isPartnered,
      'isDiscoverable': isDiscoverable,
      'isFeatured': isFeatured,
      'isBoosted': isBoosted,
      'boostLevel': boostLevel,
      'boostCount': boostCount,
      'createdAt': createdAt.toIso8601String(),
      'roles': roles,
      'channels': channels,
      'emojis': emojis,
      'stickers': stickers,
      'rulesChannelIds': rulesChannelIds,
      'publicUpdatesChannelIds': publicUpdatesChannelIds,
      'widgetChannelId': widgetChannelId,
      'widgetEnabledChannelId': widgetEnabledChannelId,
      'systemChannelId': systemChannelId,
      'rulesChannelId': rulesChannelId,
      'features': features,
      'vanityUrl': vanityUrl,
      'approximateMemberCount': approximateMemberCount,
      'approximatePresenceCount': approximatePresenceCount,
      'premiumSubscriptionId': premiumSubscriptionId,
      'nsfwLevel': nsfwLevel,
      'safetyAlertsChannelId': safetyAlertsChannelId,
    };
  }

  Server copyWith({
    String? id,
    String? name,
    String? description,
    String? iconUrl,
    String? bannerUrl,
    String? splashUrl,
    String? ownerId,
    String? region,
    int? memberCount,
    int? presenceCount,
    int? maxMembers,
    bool? isVerified,
    bool? isPartnered,
    bool? isDiscoverable,
    bool? isFeatured,
    bool? isBoosted,
    int? boostLevel,
    int? boostCount,
    DateTime? createdAt,
    List<String>? roles,
    List<String>? channels,
    List<String>? emojis,
    List<String>? stickers,
    List<String>? rulesChannelIds,
    List<String>? publicUpdatesChannelIds,
    String? widgetChannelId,
    String? widgetEnabledChannelId,
    String? systemChannelId,
    String? rulesChannelId,
    Map<String, dynamic>? features,
    String? vanityUrl,
    int? approximateMemberCount,
    int? approximatePresenceCount,
    String? premiumSubscriptionId,
    String? nsfwLevel,
    String? safetyAlertsChannelId,
  }) {
    return Server(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      splashUrl: splashUrl ?? this.splashUrl,
      ownerId: ownerId ?? this.ownerId,
      region: region ?? this.region,
      memberCount: memberCount ?? this.memberCount,
      presenceCount: presenceCount ?? this.presenceCount,
      maxMembers: maxMembers ?? this.maxMembers,
      isVerified: isVerified ?? this.isVerified,
      isPartnered: isPartnered ?? this.isPartnered,
      isDiscoverable: isDiscoverable ?? this.isDiscoverable,
      isFeatured: isFeatured ?? this.isFeatured,
      isBoosted: isBoosted ?? this.isBoosted,
      boostLevel: boostLevel ?? this.boostLevel,
      boostCount: boostCount ?? this.boostCount,
      createdAt: createdAt ?? this.createdAt,
      roles: roles ?? this.roles,
      channels: channels ?? this.channels,
      emojis: emojis ?? this.emojis,
      stickers: stickers ?? this.stickers,
      rulesChannelIds: rulesChannelIds ?? this.rulesChannelIds,
      publicUpdatesChannelIds: publicUpdatesChannelIds ?? this.publicUpdatesChannelIds,
      widgetChannelId: widgetChannelId ?? this.widgetChannelId,
      widgetEnabledChannelId: widgetEnabledChannelId ?? this.widgetEnabledChannelId,
      systemChannelId: systemChannelId ?? this.systemChannelId,
      rulesChannelId: rulesChannelId ?? this.rulesChannelId,
      features: features ?? this.features,
      vanityUrl: vanityUrl ?? this.vanityUrl,
      approximateMemberCount: approximateMemberCount ?? this.approximateMemberCount,
      approximatePresenceCount: approximatePresenceCount ?? this.approximatePresenceCount,
      premiumSubscriptionId: premiumSubscriptionId ?? this.premiumSubscriptionId,
      nsfwLevel: nsfwLevel ?? this.nsfwLevel,
      safetyAlertsChannelId: safetyAlertsChannelId ?? this.safetyAlertsChannelId,
    );
  }

  String getDisplayIcon({int size = 128}) {
    if (iconUrl != null && iconUrl!.isNotEmpty) {
      return iconUrl!;
    }
    return 'https://api.dicebear.com/7.x/initials/svg?seed=$name&size=$size';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        iconUrl,
        bannerUrl,
        splashUrl,
        ownerId,
        region,
        memberCount,
        presenceCount,
        maxMembers,
        isVerified,
        isPartnered,
        isDiscoverable,
        isFeatured,
        isBoosted,
        boostLevel,
        boostCount,
        createdAt,
        roles,
        channels,
        emojis,
        stickers,
        rulesChannelIds,
        publicUpdatesChannelIds,
        widgetChannelId,
        widgetEnabledChannelId,
        systemChannelId,
        rulesChannelId,
        features,
        vanityUrl,
        approximateMemberCount,
        approximatePresenceCount,
        premiumSubscriptionId,
        nsfwLevel,
        safetyAlertsChannelId,
      ];
}

/// Channel entity
class Channel extends Equatable {
  final String id;
  final String serverId;
  final String name;
  final ChannelType type;
  final String? topic;
  final int? position;
  final bool isPrivate;
  final bool isNsfw;
  final int? rateLimitPerUser;
  final String? parentId;
  final String? lastMessageId;
  final int? memberCount;
  final int? messageCount;
  final String? rtcRegionId;
  final int? userLimit;
  final int? videoQualityMode;
  final String? defaultAutoArchiveDuration;
  final String? defaultReactionEmoji;
  final bool? defaultThreadSlowmode;
  final DateTime createdAt;
  final Map<String, dynamic>? permissionOverwrites;

  const Channel({
    required this.id,
    required this.serverId,
    required this.name,
    required this.type,
    this.topic,
    this.position,
    this.isPrivate = false,
    this.isNsfw = false,
    this.rateLimitPerUser,
    this.parentId,
    this.lastMessageId,
    this.memberCount,
    this.messageCount,
    this.rtcRegionId,
    this.userLimit,
    this.videoQualityMode,
    this.defaultAutoArchiveDuration,
    this.defaultReactionEmoji,
    this.defaultThreadSlowmode,
    required this.createdAt,
    this.permissionOverwrites,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      id: json['id'] as String,
      serverId: json['serverId'] as String,
      name: json['name'] as String,
      type: ChannelType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ChannelType.text,
      ),
      topic: json['topic'] as String?,
      position: json['position'] as int?,
      isPrivate: json['isPrivate'] as bool? ?? false,
      isNsfw: json['isNsfw'] as bool? ?? false,
      rateLimitPerUser: json['rateLimitPerUser'] as int?,
      parentId: json['parentId'] as String?,
      lastMessageId: json['lastMessageId'] as String?,
      memberCount: json['memberCount'] as int?,
      messageCount: json['messageCount'] as int?,
      rtcRegionId: json['rtcRegionId'] as String?,
      userLimit: json['userLimit'] as int?,
      videoQualityMode: json['videoQualityMode'] as int?,
      defaultAutoArchiveDuration: json['defaultAutoArchiveDuration'] as String?,
      defaultReactionEmoji: json['defaultReactionEmoji'] as String?,
      defaultThreadSlowmode: json['defaultThreadSlowmode'] as bool?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      permissionOverwrites: json['permissionOverwrites'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serverId': serverId,
      'name': name,
      'type': type.name,
      'topic': topic,
      'position': position,
      'isPrivate': isPrivate,
      'isNsfw': isNsfw,
      'rateLimitPerUser': rateLimitPerUser,
      'parentId': parentId,
      'lastMessageId': lastMessageId,
      'memberCount': memberCount,
      'messageCount': messageCount,
      'rtcRegionId': rtcRegionId,
      'userLimit': userLimit,
      'videoQualityMode': videoQualityMode,
      'defaultAutoArchiveDuration': defaultAutoArchiveDuration,
      'defaultReactionEmoji': defaultReactionEmoji,
      'defaultThreadSlowmode': defaultThreadSlowmode,
      'createdAt': createdAt.toIso8601String(),
      'permissionOverwrites': permissionOverwrites,
    };
  }

  Channel copyWith({
    String? id,
    String? serverId,
    String? name,
    ChannelType? type,
    String? topic,
    int? position,
    bool? isPrivate,
    bool? isNsfw,
    int? rateLimitPerUser,
    String? parentId,
    String? lastMessageId,
    int? memberCount,
    int? messageCount,
    String? rtcRegionId,
    int? userLimit,
    int? videoQualityMode,
    String? defaultAutoArchiveDuration,
    String? defaultReactionEmoji,
    bool? defaultThreadSlowmode,
    DateTime? createdAt,
    Map<String, dynamic>? permissionOverwrites,
  }) {
    return Channel(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      name: name ?? this.name,
      type: type ?? this.type,
      topic: topic ?? this.topic,
      position: position ?? this.position,
      isPrivate: isPrivate ?? this.isPrivate,
      isNsfw: isNsfw ?? this.isNsfw,
      rateLimitPerUser: rateLimitPerUser ?? this.rateLimitPerUser,
      parentId: parentId ?? this.parentId,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      memberCount: memberCount ?? this.memberCount,
      messageCount: messageCount ?? this.messageCount,
      rtcRegionId: rtcRegionId ?? this.rtcRegionId,
      userLimit: userLimit ?? this.userLimit,
      videoQualityMode: videoQualityMode ?? this.videoQualityMode,
      defaultAutoArchiveDuration: defaultAutoArchiveDuration ?? this.defaultAutoArchiveDuration,
      defaultReactionEmoji: defaultReactionEmoji ?? this.defaultReactionEmoji,
      defaultThreadSlowmode: defaultThreadSlowmode ?? this.defaultThreadSlowmode,
      createdAt: createdAt ?? this.createdAt,
      permissionOverwrites: permissionOverwrites ?? this.permissionOverwrites,
    );
  }

  bool get isVoice => type == ChannelType.voice;
  bool get isText => type == ChannelType.text;
  bool get isCategory => type == ChannelType.category;
  bool get isStage => type == ChannelType.stage;
  bool get isForum => type == ChannelType.forum;

  @override
  List<Object?> get props => [
        id,
        serverId,
        name,
        type,
        topic,
        position,
        isPrivate,
        isNsfw,
        rateLimitPerUser,
        parentId,
        lastMessageId,
        memberCount,
        messageCount,
        rtcRegionId,
        userLimit,
        videoQualityMode,
        defaultAutoArchiveDuration,
        defaultReactionEmoji,
        defaultThreadSlowmode,
        createdAt,
        permissionOverwrites,
      ];
}

/// Server role entity
class Role extends Equatable {
  final String id;
  final String serverId;
  final String name;
  final int color;
  final bool isHoisted;
  final String? icon;
  final String? unicodeEmoji;
  final int position;
  final Map<String, bool>? permissions;
  final bool isManaged;
  final bool isMentionable;

  const Role({
    required this.id,
    required this.serverId,
    required this.name,
    required this.color,
    this.isHoisted = false,
    this.icon,
    this.unicodeEmoji,
    required this.position,
    this.permissions,
    this.isManaged = false,
    this.isMentionable = false,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'] as String,
      serverId: json['serverId'] as String,
      name: json['name'] as String,
      color: json['color'] as int? ?? 0,
      isHoisted: json['isHoisted'] as bool? ?? false,
      icon: json['icon'] as String?,
      unicodeEmoji: json['unicodeEmoji'] as String?,
      position: json['position'] as int? ?? 0,
      permissions: json['permissions'] != null
          ? Map<String, bool>.from(json['permissions'] as Map)
          : null,
      isManaged: json['isManaged'] as bool? ?? false,
      isMentionable: json['isMentionable'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serverId': serverId,
      'name': name,
      'color': color,
      'isHoisted': isHoisted,
      'icon': icon,
      'unicodeEmoji': unicodeEmoji,
      'position': position,
      'permissions': permissions,
      'isManaged': isManaged,
      'isMentionable': isMentionable,
    };
  }

  @override
  List<Object?> get props => [
        id,
        serverId,
        name,
        color,
        isHoisted,
        icon,
        unicodeEmoji,
        position,
        permissions,
        isManaged,
        isMentionable,
      ];
}

/// Server member entity
class ServerMember extends Equatable {
  final String id;
  final String serverId;
  final String userId;
  final String? nick;
  final List<String>? roleIds;
  final DateTime joinedAt;
  final DateTime? premiumSince;
  final bool isMuted;
  final bool isDeafened;
  final bool isPending;
  final bool isTimeout;
  final DateTime? timeoutExpiresAt;
  final Map<String, dynamic>? permissions;

  const ServerMember({
    required this.id,
    required this.serverId,
    required this.userId,
    this.nick,
    this.roleIds,
    required this.joinedAt,
    this.premiumSince,
    this.isMuted = false,
    this.isDeafened = false,
    this.isPending = false,
    this.isTimeout = false,
    this.timeoutExpiresAt,
    this.permissions,
  });

  factory ServerMember.fromJson(Map<String, dynamic> json) {
    return ServerMember(
      id: json['id'] as String,
      serverId: json['serverId'] as String,
      userId: json['userId'] as String,
      nick: json['nick'] as String?,
      roleIds: (json['roleIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      premiumSince: json['premiumSince'] != null
          ? DateTime.parse(json['premiumSince'] as String)
          : null,
      isMuted: json['isMuted'] as bool? ?? false,
      isDeafened: json['isDeafened'] as bool? ?? false,
      isPending: json['isPending'] as bool? ?? false,
      isTimeout: json['isTimeout'] as bool? ?? false,
      timeoutExpiresAt: json['timeoutExpiresAt'] != null
          ? DateTime.parse(json['timeoutExpiresAt'] as String)
          : null,
      permissions: json['permissions'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serverId': serverId,
      'userId': userId,
      'nick': nick,
      'roleIds': roleIds,
      'joinedAt': joinedAt.toIso8601String(),
      'premiumSince': premiumSince?.toIso8601String(),
      'isMuted': isMuted,
      'isDeafened': isDeafened,
      'isPending': isPending,
      'isTimeout': isTimeout,
      'timeoutExpiresAt': timeoutExpiresAt?.toIso8601String(),
      'permissions': permissions,
    };
  }

  @override
  List<Object?> get props => [
        id,
        serverId,
        userId,
        nick,
        roleIds,
        joinedAt,
        premiumSince,
        isMuted,
        isDeafened,
        isPending,
        isTimeout,
        timeoutExpiresAt,
        permissions,
      ];
}
