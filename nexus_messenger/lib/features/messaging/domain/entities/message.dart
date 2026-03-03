import 'package:equatable/equatable.dart';

/// Message type enumeration
enum MessageType {
  text,
  image,
  video,
  audio,
  file,
  sticker,
  gif,
  embed,
  system,
  reply,
  thread,
}

/// Message entity representing a chat message
class Message extends Equatable {
  final String id;
  final String conversationId;
  final String senderId;
  final String? content;
  final MessageType type;
  final List<Attachment>? attachments;
  final String? replyToId;
  final List<String>? mentions;
  final Map<String, dynamic>? embeds;
  final List<Reaction>? reactions;
  final bool isEdited;
  final bool isDeleted;
  final bool isPinned;
  final bool isSilent;
  final bool isEphemeral;
  final DateTime? ephemeralUntil;
  final DateTime? scheduledFor;
  final DateTime? editedAt;
  final DateTime createdAt;
  final DateTime? deletedAt;
  final List<MessageEdit>? editHistory;
  final String? threadId;
  final int? replyCount;
  final bool? isAI;
  final Map<String, dynamic>? metadata;

  const Message({
    required this.id,
    required this.conversationId,
    required this.senderId,
    this.content,
    this.type = MessageType.text,
    this.attachments,
    this.replyToId,
    this.mentions,
    this.embeds,
    this.reactions,
    this.isEdited = false,
    this.isDeleted = false,
    this.isPinned = false,
    this.isSilent = false,
    this.isEphemeral = false,
    this.ephemeralUntil,
    this.scheduledFor,
    this.editedAt,
    required this.createdAt,
    this.deletedAt,
    this.editHistory,
    this.threadId,
    this.replyCount,
    this.isAI,
    this.metadata,
  });

  /// Create message from JSON
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
      content: json['content'] as String?,
      type: MessageType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => MessageType.text,
      ),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyToId: json['replyToId'] as String?,
      mentions: (json['mentions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      embeds: json['embeds'] as Map<String, dynamic>?,
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEdited: json['isEdited'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
      isSilent: json['isSilent'] as bool? ?? false,
      isEphemeral: json['isEphemeral'] as bool? ?? false,
      ephemeralUntil: json['ephemeralUntil'] != null
          ? DateTime.parse(json['ephemeralUntil'] as String)
          : null,
      scheduledFor: json['scheduledFor'] != null
          ? DateTime.parse(json['scheduledFor'] as String)
          : null,
      editedAt: json['editedAt'] != null
          ? DateTime.parse(json['editedAt'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
      editHistory: (json['editHistory'] as List<dynamic>?)
          ?.map((e) => MessageEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
      threadId: json['threadId'] as String?,
      replyCount: json['replyCount'] as int?,
      isAI: json['isAI'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Convert message to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conversationId': conversationId,
      'senderId': senderId,
      'content': content,
      'type': type.name,
      'attachments': attachments?.map((e) => e.toJson()).toList(),
      'replyToId': replyToId,
      'mentions': mentions,
      'embeds': embeds,
      'reactions': reactions?.map((e) => e.toJson()).toList(),
      'isEdited': isEdited,
      'isDeleted': isDeleted,
      'isPinned': isPinned,
      'isSilent': isSilent,
      'isEphemeral': isEphemeral,
      'ephemeralUntil': ephemeralUntil?.toIso8601String(),
      'scheduledFor': scheduledFor?.toIso8601String(),
      'editedAt': editedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'editHistory': editHistory?.map((e) => e.toJson()).toList(),
      'threadId': threadId,
      'replyCount': replyCount,
      'isAI': isAI,
      'metadata': metadata,
    };
  }

  /// Create a copy with modified fields
  Message copyWith({
    String? id,
    String? conversationId,
    String? senderId,
    String? content,
    MessageType? type,
    List<Attachment>? attachments,
    String? replyToId,
    List<String>? mentions,
    Map<String, dynamic>? embeds,
    List<Reaction>? reactions,
    bool? isEdited,
    bool? isDeleted,
    bool? isPinned,
    bool? isSilent,
    bool? isEphemeral,
    DateTime? ephemeralUntil,
    DateTime? scheduledFor,
    DateTime? editedAt,
    DateTime? createdAt,
    DateTime? deletedAt,
    List<MessageEdit>? editHistory,
    String? threadId,
    int? replyCount,
    bool? isAI,
    Map<String, dynamic>? metadata,
  }) {
    return Message(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      type: type ?? this.type,
      attachments: attachments ?? this.attachments,
      replyToId: replyToId ?? this.replyToId,
      mentions: mentions ?? this.mentions,
      embeds: embeds ?? this.embeds,
      reactions: reactions ?? this.reactions,
      isEdited: isEdited ?? this.isEdited,
      isDeleted: isDeleted ?? this.isDeleted,
      isPinned: isPinned ?? this.isPinned,
      isSilent: isSilent ?? this.isSilent,
      isEphemeral: isEphemeral ?? this.isEphemeral,
      ephemeralUntil: ephemeralUntil ?? this.ephemeralUntil,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      editedAt: editedAt ?? this.editedAt,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      editHistory: editHistory ?? this.editHistory,
      threadId: threadId ?? this.threadId,
      replyCount: replyCount ?? this.replyCount,
      isAI: isAI ?? this.isAI,
      metadata: metadata ?? this.metadata,
    );
  }

  /// Check if message is expiring soon
  bool get isExpiringSoon {
    if (!isEphemeral || ephemeralUntil == null) return false;
    return DateTime.now().difference(ephemeralUntil!).inHours < 1;
  }

  /// Check if message has expired
  bool get hasExpired {
    if (!isEphemeral || ephemeralUntil == null) return false;
    return DateTime.now().isAfter(ephemeralUntil!);
  }

  /// Check if message can be edited
  bool get canBeEdited {
    if (isDeleted || type != MessageType.text) return false;
    final editWindow = const Duration(minutes: 15);
    return DateTime.now().difference(createdAt) < editWindow;
  }

  @override
  List<Object?> get props => [
        id,
        conversationId,
        senderId,
        content,
        type,
        attachments,
        replyToId,
        mentions,
        embeds,
        reactions,
        isEdited,
        isDeleted,
        isPinned,
        isSilent,
        isEphemeral,
        ephemeralUntil,
        scheduledFor,
        editedAt,
        createdAt,
        deletedAt,
        editHistory,
        threadId,
        replyCount,
        isAI,
        metadata,
      ];
}

/// Message attachment
class Attachment extends Equatable {
  final String id;
  final String fileName;
  final String fileType;
  final String url;
  final int size;
  final int? width;
  final int? height;
  final String? thumbnailUrl;
  final Duration? duration;
  final bool isSpoiler;
  final Map<String, dynamic>? metadata;

  const Attachment({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.url,
    required this.size,
    this.width,
    this.height,
    this.thumbnailUrl,
    this.duration,
    this.isSpoiler = false,
    this.metadata,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      fileType: json['fileType'] as String,
      url: json['url'] as String,
      size: json['size'] as int,
      width: json['width'] as int?,
      height: json['height'] as int?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      duration: json['duration'] != null
          ? Duration(milliseconds: json['duration'] as int)
          : null,
      isSpoiler: json['isSpoiler'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileName': fileName,
      'fileType': fileType,
      'url': url,
      'size': size,
      'width': width,
      'height': height,
      'thumbnailUrl': thumbnailUrl,
      'duration': duration?.inMilliseconds,
      'isSpoiler': isSpoiler,
      'metadata': metadata,
    };
  }

  bool get isImage => fileType.startsWith('image/');
  bool get isVideo => fileType.startsWith('video/');
  bool get isAudio => fileType.startsWith('audio/');
  bool get isFile => !isImage && !isVideo && !isAudio;

  @override
  List<Object?> get props => [
        id,
        fileName,
        fileType,
        url,
        size,
        width,
        height,
        thumbnailUrl,
        duration,
        isSpoiler,
        metadata,
      ];
}

/// Message reaction
class Reaction extends Equatable {
  final String emoji;
  final List<String> userIds;
  final String? emojiId;
  final bool isAnimated;

  const Reaction({
    required this.emoji,
    required this.userIds,
    this.emojiId,
    this.isAnimated = false,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      emoji: json['emoji'] as String,
      userIds: (json['userIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      emojiId: json['emojiId'] as String?,
      isAnimated: json['isAnimated'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'emoji': emoji,
      'userIds': userIds,
      'emojiId': emojiId,
      'isAnimated': isAnimated,
    };
  }

  Reaction copyWith({
    String? emoji,
    List<String>? userIds,
    String? emojiId,
    bool? isAnimated,
  }) {
    return Reaction(
      emoji: emoji ?? this.emoji,
      userIds: userIds ?? this.userIds,
      emojiId: emojiId ?? this.emojiId,
      isAnimated: isAnimated ?? this.isAnimated,
    );
  }

  int get count => userIds.length;

  @override
  List<Object?> get props => [emoji, userIds, emojiId, isAnimated];
}

/// Message edit history
class MessageEdit extends Equatable {
  final String content;
  final DateTime editedAt;
  final String? editedBy;

  const MessageEdit({
    required this.content,
    required this.editedAt,
    this.editedBy,
  });

  factory MessageEdit.fromJson(Map<String, dynamic> json) {
    return MessageEdit(
      content: json['content'] as String,
      editedAt: DateTime.parse(json['editedAt'] as String),
      editedBy: json['editedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'editedAt': editedAt.toIso8601String(),
      'editedBy': editedBy,
    };
  }

  @override
  List<Object?> get props => [content, editedAt, editedBy];
}

/// Conversation entity
class Conversation extends Equatable {
  final String id;
  final String? name;
  final String? avatarUrl;
  final List<String> participantIds;
  final bool isGroup;
  final String? ownerId;
  final bool isEncrypted;
  final DateTime? lastMessageAt;
  final Message? lastMessage;
  final Map<String, int>? unreadCounts;
  final Map<String, DateTime>? lastReadAt;
  final bool isMuted;
  final bool isPinned;
  final DateTime? pinnedAt;
  final DateTime createdAt;
  final List<String>? admins;
  final String? theme;
  final Map<String, dynamic>? settings;

  const Conversation({
    required this.id,
    this.name,
    this.avatarUrl,
    required this.participantIds,
    this.isGroup = false,
    this.ownerId,
    this.isEncrypted = true,
    this.lastMessageAt,
    this.lastMessage,
    this.unreadCounts,
    this.lastReadAt,
    this.isMuted = false,
    this.isPinned = false,
    this.pinnedAt,
    required this.createdAt,
    this.admins,
    this.theme,
    this.settings,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'] as String,
      name: json['name'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      participantIds: (json['participantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isGroup: json['isGroup'] as bool? ?? false,
      ownerId: json['ownerId'] as String?,
      isEncrypted: json['isEncrypted'] as bool? ?? true,
      lastMessageAt: json['lastMessageAt'] != null
          ? DateTime.parse(json['lastMessageAt'] as String)
          : null,
      lastMessage: json['lastMessage'] != null
          ? Message.fromJson(json['lastMessage'] as Map<String, dynamic>)
          : null,
      unreadCounts: json['unreadCounts'] != null
          ? Map<String, int>.from(json['unreadCounts'] as Map)
          : null,
      lastReadAt: json['lastReadAt'] != null
          ? Map<String, DateTime>.from(
              (json['lastReadAt'] as Map).map(
                (k, v) => MapEntry(k.toString(), DateTime.parse(v as String)),
              ),
            )
          : null,
      isMuted: json['isMuted'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
      pinnedAt: json['pinnedAt'] != null
          ? DateTime.parse(json['pinnedAt'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      theme: json['theme'] as String?,
      settings: json['settings'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'participantIds': participantIds,
      'isGroup': isGroup,
      'ownerId': ownerId,
      'isEncrypted': isEncrypted,
      'lastMessageAt': lastMessageAt?.toIso8601String(),
      'lastMessage': lastMessage?.toJson(),
      'unreadCounts': unreadCounts,
      'lastReadAt': lastReadAt?.map((k, v) => MapEntry(k, v.toIso8601String())),
      'isMuted': isMuted,
      'isPinned': isPinned,
      'pinnedAt': pinnedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'admins': admins,
      'theme': theme,
      'settings': settings,
    };
  }

  int get unreadCount => unreadCounts?.values.fold(0, (a, b) => a + b) ?? 0;

  @override
  List<Object?> get props => [
        id,
        name,
        avatarUrl,
        participantIds,
        isGroup,
        ownerId,
        isEncrypted,
        lastMessageAt,
        lastMessage,
        unreadCounts,
        lastReadAt,
        isMuted,
        isPinned,
        pinnedAt,
        createdAt,
        admins,
        theme,
        settings,
      ];
}
