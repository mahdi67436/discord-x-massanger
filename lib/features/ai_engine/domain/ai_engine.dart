import 'package:equatable/equatable.dart';

/// AI Moderation result
class AIModerationResult extends Equatable {
  final bool isSafe;
  final double confidence;
  final List<ModerationCategory> categories;
  final String? explanation;
  final String? recommendedAction;
  final DateTime analyzedAt;

  const AIModerationResult({
    required this.isSafe,
    required this.confidence,
    required this.categories,
    this.explanation,
    this.recommendedAction,
    required this.analyzedAt,
  });

  factory AIModerationResult.fromJson(Map<String, dynamic> json) {
    return AIModerationResult(
      isSafe: json['isSafe'] as bool,
      confidence: (json['confidence'] as num).toDouble(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => ModerationCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      explanation: json['explanation'] as String?,
      recommendedAction: json['recommendedAction'] as String?,
      analyzedAt: DateTime.parse(json['analyzedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSafe': isSafe,
      'confidence': confidence,
      'categories': categories.map((e) => e.toJson()).toList(),
      'explanation': explanation,
      'recommendedAction': recommendedAction,
      'analyzedAt': analyzedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        isSafe,
        confidence,
        categories,
        explanation,
        recommendedAction,
        analyzedAt,
      ];
}

/// Moderation category
class ModerationCategory extends Equatable {
  final String category;
  final double score;
  final bool flagged;

  const ModerationCategory({
    required this.category,
    required this.score,
    required this.flagged,
  });

  factory ModerationCategory.fromJson(Map<String, dynamic> json) {
    return ModerationCategory(
      category: json['category'] as String,
      score: (json['score'] as num).toDouble(),
      flagged: json['flagged'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'score': score,
      'flagged': flagged,
    };
  }

  @override
  List<Object?> get props => [category, score, flagged];
}

/// AI Translation result
class AITranslationResult extends Equatable {
  final String originalText;
  final String translatedText;
  final String sourceLanguage;
  final String targetLanguage;
  final double confidence;
  final DateTime translatedAt;

  const AITranslationResult({
    required this.originalText,
    required this.translatedText,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.confidence,
    required this.translatedAt,
  });

  factory AITranslationResult.fromJson(Map<String, dynamic> json) {
    return AITranslationResult(
      originalText: json['originalText'] as String,
      translatedText: json['translatedText'] as String,
      sourceLanguage: json['sourceLanguage'] as String,
      targetLanguage: json['targetLanguage'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      translatedAt: DateTime.parse(json['translatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalText': originalText,
      'translatedText': translatedText,
      'sourceLanguage': sourceLanguage,
      'targetLanguage': targetLanguage,
      'confidence': confidence,
      'translatedAt': translatedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        originalText,
        translatedText,
        sourceLanguage,
        targetLanguage,
        confidence,
        translatedAt,
      ];
}

/// AI Smart Reply suggestion
class AISmartReply extends Equatable {
  final String text;
  final double confidence;
  final String? intent;
  final List<String>? actions;

  const AISmartReply({
    required this.text,
    required this.confidence,
    this.intent,
    this.actions,
  });

  factory AISmartReply.fromJson(Map<String, dynamic> json) {
    return AISmartReply(
      text: json['text'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      intent: json['intent'] as String?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'confidence': confidence,
      'intent': intent,
      'actions': actions,
    };
  }

  @override
  List<Object?> get props => [text, confidence, intent, actions];
}

/// AI Sentiment analysis result
class AISentimentResult extends Equatable {
  final String sentiment;
  final double score;
  final Map<String, double> emotions;
  final List<String>? keyPhrases;
  final DateTime analyzedAt;

  const AISentimentResult({
    required this.sentiment,
    required this.score,
    required this.emotions,
    this.keyPhrases,
    required this.analyzedAt,
  });

  factory AISentimentResult.fromJson(Map<String, dynamic> json) {
    return AISentimentResult(
      sentiment: json['sentiment'] as String,
      score: (json['score'] as num).toDouble(),
      emotions: Map<String, double>.from(
        (json['emotions'] as Map).map(
          (k, v) => MapEntry(k.toString(), (v as num).toDouble()),
        ),
      ),
      keyPhrases: (json['keyPhrases'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      analyzedAt: DateTime.parse(json['analyzedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sentiment': sentiment,
      'score': score,
      'emotions': emotions,
      'keyPhrases': keyPhrases,
      'analyzedAt': analyzedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        sentiment,
        score,
        emotions,
        keyPhrases,
        analyzedAt,
      ];
}

/// AI User Behavior Analysis
class AIBehaviorAnalysis extends Equatable {
  final String odId;
  final double riskScore;
  final String riskLevel;
  final List<BehaviorFlag> flags;
  final Map<String, double> behaviorPattern;
  final List<String>? recommendations;
  final DateTime analyzedAt;

  const AIBehaviorAnalysis({
    required this.odId,
    required this.riskScore,
    required this.riskLevel,
    required this.flags,
    required this.behaviorPattern,
    this.recommendations,
    required this.analyzedAt,
  });

  factory AIBehaviorAnalysis.fromJson(Map<String, dynamic> json) {
    return AIBehaviorAnalysis(
      odId: json['userId'] as String,
      riskScore: (json['riskScore'] as num).toDouble(),
      riskLevel: json['riskLevel'] as String,
      flags: (json['flags'] as List<dynamic>)
          .map((e) => BehaviorFlag.fromJson(e as Map<String, dynamic>))
          .toList(),
      behaviorPattern: Map<String, double>.from(
        (json['behaviorPattern'] as Map).map(
          (k, v) => MapEntry(k.toString(), (v as num).toDouble()),
        ),
      ),
      recommendations: (json['recommendations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      analyzedAt: DateTime.parse(json['analyzedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': odId,
      'riskScore': riskScore,
      'riskLevel': riskLevel,
      'flags': flags.map((e) => e.toJson()).toList(),
      'behaviorPattern': behaviorPattern,
      'recommendations': recommendations,
      'analyzedAt': analyzedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        odId,
        riskScore,
        riskLevel,
        flags,
        behaviorPattern,
        recommendations,
        analyzedAt,
      ];
}

/// Behavior flag
class BehaviorFlag extends Equatable {
  final String type;
  final String description;
  final double severity;
  final DateTime detectedAt;

  const BehaviorFlag({
    required this.type,
    required this.description,
    required this.severity,
    required this.detectedAt,
  });

  factory BehaviorFlag.fromJson(Map<String, dynamic> json) {
    return BehaviorFlag(
      type: json['type'] as String,
      description: json['description'] as String,
      severity: (json['severity'] as num).toDouble(),
      detectedAt: DateTime.parse(json['detectedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'description': description,
      'severity': severity,
      'detectedAt': detectedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [type, description, severity, detectedAt];
}

/// AI Conversation Summary
class AIConversationSummary extends Equatable {
  final String conversationId;
  final String summary;
  final List<String> keyPoints;
  final List<String>? actionItems;
  final List<String>? participants;
  final DateTime summarizedAt;
  final String? sentiment;

  const AIConversationSummary({
    required this.conversationId,
    required this.summary,
    required this.keyPoints,
    this.actionItems,
    this.participants,
    required this.summarizedAt,
    this.sentiment,
  });

  factory AIConversationSummary.fromJson(Map<String, dynamic> json) {
    return AIConversationSummary(
      conversationId: json['conversationId'] as String,
      summary: json['summary'] as String,
      keyPoints: (json['keyPoints'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      actionItems: (json['actionItems'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      summarizedAt: DateTime.parse(json['summarizedAt'] as String),
      sentiment: json['sentiment'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'summary': summary,
      'keyPoints': keyPoints,
      'actionItems': actionItems,
      'participants': participants,
      'summarizedAt': summarizedAt.toIso8601String(),
      'sentiment': sentiment,
    };
  }

  @override
  List<Object?> get props => [
        conversationId,
        summary,
        keyPoints,
        actionItems,
        participants,
        summarizedAt,
        sentiment,
      ];
}

/// AI Spam Detection Result
class AISpamResult extends Equatable {
  final bool isSpam;
  final double confidence;
  final String? spamType;
  final List<String>? indicators;
  final DateTime analyzedAt;

  const AISpamResult({
    required this.isSpam,
    required this.confidence,
    this.spamType,
    this.indicators,
    required this.analyzedAt,
  });

  factory AISpamResult.fromJson(Map<String, dynamic> json) {
    return AISpamResult(
      isSpam: json['isSpam'] as bool,
      confidence: (json['confidence'] as num).toDouble(),
      spamType: json['spamType'] as String?,
      indicators: (json['indicators'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      analyzedAt: DateTime.parse(json['analyzedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSpam': isSpam,
      'confidence': confidence,
      'spamType': spamType,
      'indicators': indicators,
      'analyzedAt': analyzedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        isSpam,
        confidence,
        spamType,
        indicators,
        analyzedAt,
      ];
}

/// AI Productivity Insights
class AIProductivityInsights extends Equatable {
  final String odId;
  final String period;
  final Map<String, dynamic> metrics;
  final List<String> insights;
  final List<String>? recommendations;
  final DateTime generatedAt;

  const AIProductivityInsights({
    required this.odId,
    required this.period,
    required this.metrics,
    required this.insights,
    this.recommendations,
    required this.generatedAt,
  });

  factory AIProductivityInsights.fromJson(Map<String, dynamic> json) {
    return AIProductivityInsights(
      odId: json['userId'] as String,
      period: json['period'] as String,
      metrics: json['metrics'] as Map<String, dynamic>,
      insights: (json['insights'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      recommendations: (json['recommendations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': odId,
      'period': period,
      'metrics': metrics,
      'insights': insights,
      'recommendations': recommendations,
      'generatedAt': generatedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        odId,
        period,
        metrics,
        insights,
        recommendations,
        generatedAt,
      ];
}

/// AI Auto Role Suggestion
class AIAutoRoleSuggestion extends Equatable {
  final String odId;
  final List<RoleSuggestion> suggestedRoles;
  final double confidence;
  final String? reasoning;
  final DateTime suggestedAt;

  const AIAutoRoleSuggestion({
    required this.odId,
    required this.suggestedRoles,
    required this.confidence,
    this.reasoning,
    required this.suggestedAt,
  });

  factory AIAutoRoleSuggestion.fromJson(Map<String, dynamic> json) {
    return AIAutoRoleSuggestion(
      odId: json['userId'] as String,
      suggestedRoles: (json['suggestedRoles'] as List<dynamic>)
          .map((e) => RoleSuggestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: (json['confidence'] as num).toDouble(),
      reasoning: json['reasoning'] as String?,
      suggestedAt: DateTime.parse(json['suggestedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': odId,
      'suggestedRoles': suggestedRoles.map((e) => e.toJson()).toList(),
      'confidence': confidence,
      'reasoning': reasoning,
      'suggestedAt': suggestedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        odId,
        suggestedRoles,
        confidence,
        reasoning,
        suggestedAt,
      ];
}

/// Role suggestion
class RoleSuggestion extends Equatable {
  final String roleId;
  final String roleName;
  final double relevance;
  final String? reason;

  const RoleSuggestion({
    required this.roleId,
    required this.roleName,
    required this.relevance,
    this.reason,
  });

  factory RoleSuggestion.fromJson(Map<String, dynamic> json) {
    return RoleSuggestion(
      roleId: json['roleId'] as String,
      roleName: json['roleName'] as String,
      relevance: (json['relevance'] as num).toDouble(),
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roleId': roleId,
      'roleName': roleName,
      'relevance': relevance,
      'reason': reason,
    };
  }

  @override
  List<Object?> get props => [roleId, roleName, relevance, reason];
}
