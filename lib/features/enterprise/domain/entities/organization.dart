import 'package:equatable/equatable.dart';

/// Subscription plan type
enum SubscriptionPlan {
  free,
  pro,
  business,
  enterprise,
}

/// Organization entity (multi-tenant)
class Organization extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? logoUrl;
  final String? bannerUrl;
  final String? website;
  final String? customDomain;
  final String ownerId;
  final SubscriptionPlan plan;
  final DateTime? planExpiresAt;
  final int memberCount;
  final int maxMembers;
  final bool isVerified;
  final bool isPartnered;
  final DateTime createdAt;
  final List<String>? departmentIds;
  final List<String>? projectIds;
  final Map<String, dynamic>? settings;
  final Map<String, dynamic>? features;
  final String? industry;
  final String? size;
  final Map<String, dynamic>? branding;
  final Map<String, dynamic>? analytics;
  final bool isActive;
  final String? billingEmail;

  const Organization({
    required this.id,
    required this.name,
    this.description,
    this.logoUrl,
    this.bannerUrl,
    this.website,
    this.customDomain,
    required this.ownerId,
    this.plan = SubscriptionPlan.free,
    this.planExpiresAt,
    this.memberCount = 0,
    this.maxMembers = 10,
    this.isVerified = false,
    this.isPartnered = false,
    required this.createdAt,
    this.departmentIds,
    this.projectIds,
    this.settings,
    this.features,
    this.industry,
    this.size,
    this.branding,
    this.analytics,
    this.isActive = true,
    this.billingEmail,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      logoUrl: json['logoUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      website: json['website'] as String?,
      customDomain: json['customDomain'] as String?,
      ownerId: json['ownerId'] as String,
      plan: SubscriptionPlan.values.firstWhere(
        (e) => e.name == json['plan'],
        orElse: () => SubscriptionPlan.free,
      ),
      planExpiresAt: json['planExpiresAt'] != null
          ? DateTime.parse(json['planExpiresAt'] as String)
          : null,
      memberCount: json['memberCount'] as int? ?? 0,
      maxMembers: json['maxMembers'] as int? ?? 10,
      isVerified: json['isVerified'] as bool? ?? false,
      isPartnered: json['isPartnered'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      departmentIds: (json['departmentIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      projectIds: (json['projectIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      settings: json['settings'] as Map<String, dynamic>?,
      features: json['features'] as Map<String, dynamic>?,
      industry: json['industry'] as String?,
      size: json['size'] as String?,
      branding: json['branding'] as Map<String, dynamic>?,
      analytics: json['analytics'] as Map<String, dynamic>?,
      isActive: json['isActive'] as bool? ?? true,
      billingEmail: json['billingEmail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logoUrl': logoUrl,
      'bannerUrl': bannerUrl,
      'website': website,
      'customDomain': customDomain,
      'ownerId': ownerId,
      'plan': plan.name,
      'planExpiresAt': planExpiresAt?.toIso8601String(),
      'memberCount': memberCount,
      'maxMembers': maxMembers,
      'isVerified': isVerified,
      'isPartnered': isPartnered,
      'createdAt': createdAt.toIso8601String(),
      'departmentIds': departmentIds,
      'projectIds': projectIds,
      'settings': settings,
      'features': features,
      'industry': industry,
      'size': size,
      'branding': branding,
      'analytics': analytics,
      'isActive': isActive,
      'billingEmail': billingEmail,
    };
  }

  Organization copyWith({
    String? id,
    String? name,
    String? description,
    String? logoUrl,
    String? bannerUrl,
    String? website,
    String? customDomain,
    String? ownerId,
    SubscriptionPlan? plan,
    DateTime? planExpiresAt,
    int? memberCount,
    int? maxMembers,
    bool? isVerified,
    bool? isPartnered,
    DateTime? createdAt,
    List<String>? departmentIds,
    List<String>? projectIds,
    Map<String, dynamic>? settings,
    Map<String, dynamic>? features,
    String? industry,
    String? size,
    Map<String, dynamic>? branding,
    Map<String, dynamic>? analytics,
    bool? isActive,
    String? billingEmail,
  }) {
    return Organization(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logoUrl: logoUrl ?? this.logoUrl,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      website: website ?? this.website,
      customDomain: customDomain ?? this.customDomain,
      ownerId: ownerId ?? this.ownerId,
      plan: plan ?? this.plan,
      planExpiresAt: planExpiresAt ?? this.planExpiresAt,
      memberCount: memberCount ?? this.memberCount,
      maxMembers: maxMembers ?? this.maxMembers,
      isVerified: isVerified ?? this.isVerified,
      isPartnered: isPartnered ?? this.isPartnered,
      createdAt: createdAt ?? this.createdAt,
      departmentIds: departmentIds ?? this.departmentIds,
      projectIds: projectIds ?? this.projectIds,
      settings: settings ?? this.settings,
      features: features ?? this.features,
      industry: industry ?? this.industry,
      size: size ?? this.size,
      branding: branding ?? this.branding,
      analytics: analytics ?? this.analytics,
      isActive: isActive ?? this.isActive,
      billingEmail: billingEmail ?? this.billingEmail,
    );
  }

  bool get isPlanExpired =>
      planExpiresAt != null && DateTime.now().isAfter(planExpiresAt!);

  bool get canAddMembers => memberCount < maxMembers;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        logoUrl,
        bannerUrl,
        website,
        customDomain,
        ownerId,
        plan,
        planExpiresAt,
        memberCount,
        maxMembers,
        isVerified,
        isPartnered,
        createdAt,
        departmentIds,
        projectIds,
        settings,
        features,
        industry,
        size,
        branding,
        analytics,
        isActive,
        billingEmail,
      ];
}

/// Department entity
class Department extends Equatable {
  final String id;
  final String organizationId;
  final String name;
  final String? description;
  final String? iconUrl;
  final String? parentId;
  final List<String>? memberIds;
  final List<String>? channelIds;
  final String? managerId;
  final int memberCount;
  final DateTime createdAt;
  final Map<String, dynamic>? settings;

  const Department({
    required this.id,
    required this.organizationId,
    required this.name,
    this.description,
    this.iconUrl,
    this.parentId,
    this.memberIds,
    this.channelIds,
    this.managerId,
    this.memberCount = 0,
    required this.createdAt,
    this.settings,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      iconUrl: json['iconUrl'] as String?,
      parentId: json['parentId'] as String?,
      memberIds: (json['memberIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      channelIds: (json['channelIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      managerId: json['managerId'] as String?,
      memberCount: json['memberCount'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      settings: json['settings'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organizationId': organizationId,
      'name': name,
      'description': description,
      'iconUrl': iconUrl,
      'parentId': parentId,
      'memberIds': memberIds,
      'channelIds': channelIds,
      'managerId': managerId,
      'memberCount': memberCount,
      'createdAt': createdAt.toIso8601String(),
      'settings': settings,
    };
  }

  @override
  List<Object?> get props => [
        id,
        organizationId,
        name,
        description,
        iconUrl,
        parentId,
        memberIds,
        channelIds,
        managerId,
        memberCount,
        createdAt,
        settings,
      ];
}

/// Project entity
class Project extends Equatable {
  final String id;
  final String organizationId;
  final String? departmentId;
  final String name;
  final String? description;
  final String? iconUrl;
  final String ownerId;
  final List<String>? memberIds;
  final List<String>? taskIds;
  final DateTime? startDate;
  final DateTime? dueDate;
  final String status;
  final int progress;
  final DateTime createdAt;
  final Map<String, dynamic>? settings;
  final Map<String, dynamic>? metadata;

  const Project({
    required this.id,
    required this.organizationId,
    this.departmentId,
    required this.name,
    this.description,
    this.iconUrl,
    required this.ownerId,
    this.memberIds,
    this.taskIds,
    this.startDate,
    this.dueDate,
    this.status = 'active',
    this.progress = 0,
    required this.createdAt,
    this.settings,
    this.metadata,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String,
      departmentId: json['departmentId'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      iconUrl: json['iconUrl'] as String?,
      ownerId: json['ownerId'] as String,
      memberIds: (json['memberIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      taskIds: (json['taskIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'] as String)
          : null,
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      status: json['status'] as String? ?? 'active',
      progress: json['progress'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      settings: json['settings'] as Map<String, dynamic>?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organizationId': organizationId,
      'departmentId': departmentId,
      'name': name,
      'description': description,
      'iconUrl': iconUrl,
      'ownerId': ownerId,
      'memberIds': memberIds,
      'taskIds': taskIds,
      'startDate': startDate?.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'status': status,
      'progress': progress,
      'createdAt': createdAt.toIso8601String(),
      'settings': settings,
      'metadata': metadata,
    };
  }

  @override
  List<Object?> get props => [
        id,
        organizationId,
        departmentId,
        name,
        description,
        iconUrl,
        ownerId,
        memberIds,
        taskIds,
        startDate,
        dueDate,
        status,
        progress,
        createdAt,
        settings,
        metadata,
      ];
}

/// Task entity
class Task extends Equatable {
  final String id;
  final String projectId;
  final String title;
  final String? description;
  final String? assigneeId;
  final List<String>? watcherIds;
  final String status;
  final String priority;
  final DateTime? dueDate;
  final DateTime? completedAt;
  final List<String>? attachmentIds;
  final List<String>? commentIds;
  final List<String>? labelIds;
  final DateTime createdAt;
  final Map<String, dynamic>? metadata;

  const Task({
    required this.id,
    required this.projectId,
    required this.title,
    this.description,
    this.assigneeId,
    this.watcherIds,
    this.status = 'todo',
    this.priority = 'medium',
    this.dueDate,
    this.completedAt,
    this.attachmentIds,
    this.commentIds,
    this.labelIds,
    required this.createdAt,
    this.metadata,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      assigneeId: json['assigneeId'] as String?,
      watcherIds: (json['watcherIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String? ?? 'todo',
      priority: json['priority'] as String? ?? 'medium',
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      attachmentIds: (json['attachmentIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      commentIds: (json['commentIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      labelIds: (json['labelIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'title': title,
      'description': description,
      'assigneeId': assigneeId,
      'watcherIds': watcherIds,
      'status': status,
      'priority': priority,
      'dueDate': dueDate?.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'attachmentIds': attachmentIds,
      'commentIds': commentIds,
      'labelIds': labelIds,
      'createdAt': createdAt.toIso8601String(),
      'metadata': metadata,
    };
  }

  @override
  List<Object?> get props => [
        id,
        projectId,
        title,
        description,
        assigneeId,
        watcherIds,
        status,
        priority,
        dueDate,
        completedAt,
        attachmentIds,
        commentIds,
        labelIds,
        createdAt,
        metadata,
      ];
}

/// Subscription entity
class Subscription extends Equatable {
  final String id;
  final String organizationId;
  final SubscriptionPlan plan;
  final String? stripeCustomerId;
  final String? stripeSubscriptionId;
  final DateTime startedAt;
  final DateTime? expiresAt;
  final DateTime? canceledAt;
  final bool isActive;
  final Map<String, dynamic>? features;
  final double? amount;
  final String? currency;
  final String? interval;

  const Subscription({
    required this.id,
    required this.organizationId,
    required this.plan,
    this.stripeCustomerId,
    this.stripeSubscriptionId,
    required this.startedAt,
    this.expiresAt,
    this.canceledAt,
    this.isActive = true,
    this.features,
    this.amount,
    this.currency,
    this.interval,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String,
      plan: SubscriptionPlan.values.firstWhere(
        (e) => e.name == json['plan'],
        orElse: () => SubscriptionPlan.free,
      ),
      stripeCustomerId: json['stripeCustomerId'] as String?,
      stripeSubscriptionId: json['stripeSubscriptionId'] as String?,
      startedAt: DateTime.parse(json['startedAt'] as String),
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'] as String)
          : null,
      canceledAt: json['canceledAt'] != null
          ? DateTime.parse(json['canceledAt'] as String)
          : null,
      isActive: json['isActive'] as bool? ?? true,
      features: json['features'] as Map<String, dynamic>?,
      amount: (json['amount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      interval: json['interval'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organizationId': organizationId,
      'plan': plan.name,
      'stripeCustomerId': stripeCustomerId,
      'stripeSubscriptionId': stripeSubscriptionId,
      'startedAt': startedAt.toIso8601String(),
      'expiresAt': expiresAt?.toIso8601String(),
      'canceledAt': canceledAt?.toIso8601String(),
      'isActive': isActive,
      'features': features,
      'amount': amount,
      'currency': currency,
      'interval': interval,
    };
  }

  @override
  List<Object?> get props => [
        id,
        organizationId,
        plan,
        stripeCustomerId,
        stripeSubscriptionId,
        startedAt,
        expiresAt,
        canceledAt,
        isActive,
        features,
        amount,
        currency,
        interval,
      ];
}
