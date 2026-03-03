import 'package:equatable/equatable.dart';

/// Call type enumeration
enum CallType {
  voice,
  video,
  screenShare,
  webinar,
}

/// Call status enumeration
enum CallStatus {
  ringing,
  connecting,
  connected,
  reconnecting,
  ended,
  declined,
  missed,
}

/// Voice/Video call entity
class Call extends Equatable {
  final String id;
  final String channelId;
  final CallType type;
  final CallStatus status;
  final String callerId;
  final List<String> calleeIds;
  final List<String> participantIds;
  final DateTime startedAt;
  final DateTime? endedAt;
  final Duration? duration;
  final bool isGroup;
  final bool isSpatialAudio;
  final String? region;
  final Map<String, dynamic>? settings;
  final String? recordingUrl;
  final bool isRecording;
  final bool isMuted;
  final bool isVideoEnabled;
  final bool isScreenSharing;
  final bool isHandRaised;

  const Call({
    required this.id,
    required this.channelId,
    required this.type,
    required this.status,
    required this.callerId,
    required this.calleeIds,
    required this.participantIds,
    required this.startedAt,
    this.endedAt,
    this.duration,
    this.isGroup = false,
    this.isSpatialAudio = false,
    this.region,
    this.settings,
    this.recordingUrl,
    this.isRecording = false,
    this.isMuted = false,
    this.isVideoEnabled = true,
    this.isScreenSharing = false,
    this.isHandRaised = false,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      id: json['id'] as String,
      channelId: json['channelId'] as String,
      type: CallType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => CallType.voice,
      ),
      status: CallStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => CallStatus.ringing,
      ),
      callerId: json['callerId'] as String,
      calleeIds: (json['calleeIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      participantIds: (json['participantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] != null
          ? DateTime.parse(json['endedAt'] as String)
          : null,
      duration: json['duration'] != null
          ? Duration(seconds: json['duration'] as int)
          : null,
      isGroup: json['isGroup'] as bool? ?? false,
      isSpatialAudio: json['isSpatialAudio'] as bool? ?? false,
      region: json['region'] as String?,
      settings: json['settings'] as Map<String, dynamic>?,
      recordingUrl: json['recordingUrl'] as String?,
      isRecording: json['isRecording'] as bool? ?? false,
      isMuted: json['isMuted'] as bool? ?? false,
      isVideoEnabled: json['isVideoEnabled'] as bool? ?? true,
      isScreenSharing: json['isScreenSharing'] as bool? ?? false,
      isHandRaised: json['isHandRaised'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'type': type.name,
      'status': status.name,
      'callerId': callerId,
      'calleeIds': calleeIds,
      'participantIds': participantIds,
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt?.toIso8601String(),
      'duration': duration?.inSeconds,
      'isGroup': isGroup,
      'isSpatialAudio': isSpatialAudio,
      'region': region,
      'settings': settings,
      'recordingUrl': recordingUrl,
      'isRecording': isRecording,
      'isMuted': isMuted,
      'isVideoEnabled': isVideoEnabled,
      'isScreenSharing': isScreenSharing,
      'isHandRaised': isHandRaised,
    };
  }

  Call copyWith({
    String? id,
    String? channelId,
    CallType? type,
    CallStatus? status,
    String? callerId,
    List<String>? calleeIds,
    List<String>? participantIds,
    DateTime? startedAt,
    DateTime? endedAt,
    Duration? duration,
    bool? isGroup,
    bool? isSpatialAudio,
    String? region,
    Map<String, dynamic>? settings,
    String? recordingUrl,
    bool? isRecording,
    bool? isMuted,
    bool? isVideoEnabled,
    bool? isScreenSharing,
    bool? isHandRaised,
  }) {
    return Call(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      type: type ?? this.type,
      status: status ?? this.status,
      callerId: callerId ?? this.callerId,
      calleeIds: calleeIds ?? this.calleeIds,
      participantIds: participantIds ?? this.participantIds,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      duration: duration ?? this.duration,
      isGroup: isGroup ?? this.isGroup,
      isSpatialAudio: isSpatialAudio ?? this.isSpatialAudio,
      region: region ?? this.region,
      settings: settings ?? this.settings,
      recordingUrl: recordingUrl ?? this.recordingUrl,
      isRecording: isRecording ?? this.isRecording,
      isMuted: isMuted ?? this.isMuted,
      isVideoEnabled: isVideoEnabled ?? this.isVideoEnabled,
      isScreenSharing: isScreenSharing ?? this.isScreenSharing,
      isHandRaised: isHandRaised ?? this.isHandRaised,
    );
  }

  int get participantCount => participantIds.length;

  @override
  List<Object?> get props => [
        id,
        channelId,
        type,
        status,
        callerId,
        calleeIds,
        participantIds,
        startedAt,
        endedAt,
        duration,
        isGroup,
        isSpatialAudio,
        region,
        settings,
        recordingUrl,
        isRecording,
        isMuted,
        isVideoEnabled,
        isScreenSharing,
        isHandRaised,
      ];
}

/// Voice channel state
class VoiceChannelState extends Equatable {
  final String channelId;
  final List<VoiceParticipant> participants;
  final String? region;
  final int bitrate;
  final int? userLimit;
  final bool isLocked;

  const VoiceChannelState({
    required this.channelId,
    required this.participants,
    this.region,
    this.bitrate = 128000,
    this.userLimit,
    this.isLocked = false,
  });

  factory VoiceChannelState.fromJson(Map<String, dynamic> json) {
    return VoiceChannelState(
      channelId: json['channelId'] as String,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => VoiceParticipant.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['region'] as String?,
      bitrate: json['bitrate'] as int? ?? 128000,
      userLimit: json['userLimit'] as int?,
      isLocked: json['isLocked'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channelId': channelId,
      'participants': participants.map((e) => e.toJson()).toList(),
      'region': region,
      'bitrate': bitrate,
      'userLimit': userLimit,
      'isLocked': isLocked,
    };
  }

  @override
  List<Object?> get props => [
        channelId,
        participants,
        region,
        bitrate,
        userLimit,
        isLocked,
      ];
}

/// Voice participant
class VoiceParticipant extends Equatable {
  final String odId;
  final bool isMuted;
  final bool isDeafened;
  final bool isSpeaking;
  final bool isVideoEnabled;
  final bool isScreenSharing;
  final bool isHandRaised;
  final String? nick;
  final double? volume;
  final double? pan;

  const VoiceParticipant({
    required this.odId,
    this.isMuted = false,
    this.isDeafened = false,
    this.isSpeaking = false,
    this.isVideoEnabled = false,
    this.isScreenSharing = false,
    this.isHandRaised = false,
    this.nick,
    this.volume,
    this.pan,
  });

  factory VoiceParticipant.fromJson(Map<String, dynamic> json) {
    return VoiceParticipant(
      odId: json['userId'] as String,
      isMuted: json['isMuted'] as bool? ?? false,
      isDeafened: json['isDeafened'] as bool? ?? false,
      isSpeaking: json['isSpeaking'] as bool? ?? false,
      isVideoEnabled: json['isVideoEnabled'] as bool? ?? false,
      isScreenSharing: json['isScreenSharing'] as bool? ?? false,
      isHandRaised: json['isHandRaised'] as bool? ?? false,
      nick: json['nick'] as String?,
      volume: (json['volume'] as num?)?.toDouble(),
      pan: (json['pan'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': odId,
      'isMuted': isMuted,
      'isDeafened': isDeafened,
      'isSpeaking': isSpeaking,
      'isVideoEnabled': isVideoEnabled,
      'isScreenSharing': isScreenSharing,
      'isHandRaised': isHandRaised,
      'nick': nick,
      'volume': volume,
      'pan': pan,
    };
  }

  VoiceParticipant copyWith({
    String? odId,
    bool? isMuted,
    bool? isDeafened,
    bool? isSpeaking,
    bool? isVideoEnabled,
    bool? isScreenSharing,
    bool? isHandRaised,
    String? nick,
    double? volume,
    double? pan,
  }) {
    return VoiceParticipant(
      odId: odId ?? this.odId,
      isMuted: isMuted ?? this.isMuted,
      isDeafened: isDeafened ?? this.isDeafened,
      isSpeaking: isSpeaking ?? this.isSpeaking,
      isVideoEnabled: isVideoEnabled ?? this.isVideoEnabled,
      isScreenSharing: isScreenSharing ?? this.isScreenSharing,
      isHandRaised: isHandRaised ?? this.isHandRaised,
      nick: nick ?? this.nick,
      volume: volume ?? this.volume,
      pan: pan ?? this.pan,
    );
  }

  @override
  List<Object?> get props => [
        odId,
        isMuted,
        isDeafened,
        isSpeaking,
        isVideoEnabled,
        isScreenSharing,
        isHandRaised,
        nick,
        volume,
        pan,
      ];
}

/// Call log entity
class CallLog extends Equatable {
  final String id;
  final String callerId;
  final String calleeId;
  final String channelId;
  final CallType type;
  final CallStatus status;
  final DateTime startedAt;
  final DateTime? endedAt;
  final Duration? duration;
  final bool isIncoming;

  const CallLog({
    required this.id,
    required this.callerId,
    required this.calleeId,
    required this.channelId,
    required this.type,
    required this.status,
    required this.startedAt,
    this.endedAt,
    this.duration,
    required this.isIncoming,
  });

  factory CallLog.fromJson(Map<String, dynamic> json) {
    return CallLog(
      id: json['id'] as String,
      callerId: json['callerId'] as String,
      calleeId: json['calleeId'] as String,
      channelId: json['channelId'] as String,
      type: CallType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => CallType.voice,
      ),
      status: CallStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => CallStatus.ended,
      ),
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] != null
          ? DateTime.parse(json['endedAt'] as String)
          : null,
      duration: json['duration'] != null
          ? Duration(seconds: json['duration'] as int)
          : null,
      isIncoming: json['isIncoming'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'callerId': callerId,
      'calleeId': calleeId,
      'channelId': channelId,
      'type': type.name,
      'status': status.name,
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt?.toIso8601String(),
      'duration': duration?.inSeconds,
      'isIncoming': isIncoming,
    };
  }

  @override
  List<Object?> get props => [
        id,
        callerId,
        calleeId,
        channelId,
        type,
        status,
        startedAt,
        endedAt,
        duration,
        isIncoming,
      ];
}
