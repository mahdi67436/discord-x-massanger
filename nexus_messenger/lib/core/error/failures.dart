import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  final String message;
  final String? code;
  final dynamic details;

  const Failure({
    required this.message,
    this.code,
    this.details,
  });

  @override
  List<Object?> get props => [message, code, details];
}

// ============== SERVER FAILURES ==============

class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Server error occurred',
    super.code,
    super.details,
  });
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Network error. Please check your connection.',
    super.code = 'NETWORK_ERROR',
    super.details,
  });
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({
    super.message = 'Request timed out. Please try again.',
    super.code = 'TIMEOUT_ERROR',
    super.details,
  });
}

// ============== AUTHENTICATION FAILURES ==============

class AuthFailure extends Failure {
  const AuthFailure({
    super.message = 'Authentication failed',
    super.code,
    super.details,
  });
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure({
    super.message = 'Invalid email or password',
    super.code = 'INVALID_CREDENTIALS',
  });
}

class EmailNotVerifiedFailure extends AuthFailure {
  const EmailNotVerifiedFailure({
    super.message = 'Please verify your email address',
    super.code = 'EMAIL_NOT_VERIFIED',
  });
}

class UserNotFoundFailure extends AuthFailure {
  const UserNotFoundFailure({
    super.message = 'User not found',
    super.code = 'USER_NOT_FOUND',
  });
}

class UserAlreadyExistsFailure extends AuthFailure {
  const UserAlreadyExistsFailure({
    super.message = 'User already exists',
    super.code = 'USER_ALREADY_EXISTS',
  });
}

class WeakPasswordFailure extends AuthFailure {
  const WeakPasswordFailure({
    super.message = 'Password is too weak',
    super.code = 'WEAK_PASSWORD',
  });
}

class SessionExpiredFailure extends AuthFailure {
  const SessionExpiredFailure({
    super.message = 'Session expired. Please login again.',
    super.code = 'SESSION_EXPIRED',
  });
}

class AccountDisabledFailure extends AuthFailure {
  const AccountDisabledFailure({
    super.message = 'Account has been disabled',
    super.code = 'ACCOUNT_DISABLED',
  });
}

class TooManyRequestsFailure extends AuthFailure {
  const TooManyRequestsFailure({
    super.message = 'Too many attempts. Please try again later.',
    super.code = 'TOO_MANY_REQUESTS',
  });
}

// ============== PERMISSION FAILURES ==============

class PermissionFailure extends Failure {
  const PermissionFailure({
    super.message = 'Permission denied',
    super.code = 'PERMISSION_DENIED',
    super.details,
  });
}

class InsufficientPermissionsFailure extends PermissionFailure {
  const InsufficientPermissionsFailure({
    super.message = 'You don\'t have permission to perform this action',
    super.code = 'INSUFFICIENT_PERMISSIONS',
  });
}

// ============== RESOURCE FAILURES ==============

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'Resource not found',
    super.code = 'NOT_FOUND',
    super.details,
  });
}

class ResourceNotFoundFailure extends NotFoundFailure {
  final String resourceType;
  
  const ResourceNotFoundFailure({
    required this.resourceType,
    super.message = '$resourceType not found',
    super.code = 'RESOURCE_NOT_FOUND',
  });
}

class AlreadyExistsFailure extends Failure {
  const AlreadyExistsFailure({
    super.message = 'Resource already exists',
    super.code = 'ALREADY_EXISTS',
    super.details,
  });
}

class DeletedFailure extends Failure {
  const DeletedFailure({
    super.message = 'Resource has been deleted',
    super.code = 'RESOURCE_DELETED',
  });
}

// ============== VALIDATION FAILURES ==============

class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors;
  
  const ValidationFailure({
    super.message = 'Validation failed',
    super.code = 'VALIDATION_ERROR',
    this.fieldErrors,
    super.details,
  });

  @override
  List<Object?> get props => [message, code, fieldErrors, details];
}

class InvalidEmailFailure extends ValidationFailure {
  const InvalidEmailFailure({
    super.message = 'Invalid email address',
    super.code = 'INVALID_EMAIL',
  });
}

class InvalidUsernameFailure extends ValidationFailure {
  const InvalidUsernameFailure({
    super.message = 'Invalid username format',
    super.code = 'INVALID_USERNAME',
  });
}

class InvalidPasswordFailure extends ValidationFailure {
  const InvalidPasswordFailure({
    super.message = 'Password does not meet requirements',
    super.code = 'INVALID_PASSWORD',
  });
}

// ============== RATE LIMIT FAILURES ==============

class RateLimitFailure extends Failure {
  final DateTime? retryAfter;
  
  const RateLimitFailure({
    super.message = 'Rate limit exceeded',
    super.code = 'RATE_LIMIT_EXCEEDED',
    this.retryAfter,
    super.details,
  });

  @override
  List<Object?> get props => [message, code, retryAfter, details];
}

class TooManyRequestsFailure extends RateLimitFailure {
  const TooManyRequestsFailure({
    super.message = 'Too many requests. Please slow down.',
    super.code = 'TOO_MANY_REQUESTS',
    super.retryAfter,
  });
}

// ============== ENCRYPTION FAILURES ==============

class EncryptionFailure extends Failure {
  const EncryptionFailure({
    super.message = 'Encryption error occurred',
    super.code = 'ENCRYPTION_ERROR',
    super.details,
  });
}

class DecryptionFailure extends EncryptionFailure {
  const DecryptionFailure({
    super.message = 'Decryption failed',
    super.code = 'DECRYPTION_ERROR',
  });
}

class KeyGenerationFailure extends EncryptionFailure {
  const KeyGenerationFailure({
    super.message = 'Key generation failed',
    super.code = 'KEY_GENERATION_ERROR',
  });
}

class KeyExchangeFailure extends EncryptionFailure {
  const KeyExchangeFailure({
    super.message = 'Key exchange failed',
    super.code = 'KEY_EXCHANGE_ERROR',
  });
}

class InvalidKeyFailure extends EncryptionFailure {
  const InvalidKeyFailure({
    super.message = 'Invalid encryption key',
    super.code = 'INVALID_KEY',
  });
}

// ============== DATABASE FAILURES ==============

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    super.message = 'Database error occurred',
    super.code = 'DATABASE_ERROR',
    super.details,
  });
}

class QueryFailure extends DatabaseFailure {
  const QueryFailure({
    super.message = 'Query execution failed',
    super.code = 'QUERY_ERROR',
    super.details,
  });
}

class WriteFailure extends DatabaseFailure {
  const WriteFailure({
    super.message = 'Write operation failed',
    super.code = 'WRITE_ERROR',
    super.details,
  });
}

class ReadFailure extends DatabaseFailure {
  const ReadFailure({
    super.message = 'Read operation failed',
    super.code = 'READ_ERROR',
    super.details,
  });
}

// ============== STORAGE FAILURES ==============

class StorageFailure extends Failure {
  const StorageFailure({
    super.message = 'Storage error occurred',
    super.code = 'STORAGE_ERROR',
    super.details,
  });
}

class UploadFailure extends StorageFailure {
  const UploadFailure({
    super.message = 'File upload failed',
    super.code = 'UPLOAD_ERROR',
    super.details,
  });
}

class DownloadFailure extends StorageFailure {
  const DownloadFailure({
    super.message = 'File download failed',
    super.code = 'DOWNLOAD_ERROR',
    super.details,
  });
}

class FileTooLargeFailure extends StorageFailure {
  final int maxSize;
  
  const FileTooLargeFailure({
    required this.maxSize,
    super.message = 'File size exceeds maximum allowed size',
    super.code = 'FILE_TOO_LARGE',
  });
}

class UnsupportedFileTypeFailure extends StorageFailure {
  final String fileType;
  
  const UnsupportedFileTypeFailure({
    required this.fileType,
    super.message = 'File type not supported',
    super.code = 'UNSUPPORTED_FILE_TYPE',
  });
}

// ============== MEDIA FAILURES ==============

class MediaFailure extends Failure {
  const MediaFailure({
    super.message = 'Media processing failed',
    super.code = 'MEDIA_ERROR',
    super.details,
  });
}

class ImageProcessingFailure extends MediaFailure {
  const ImageProcessingFailure({
    super.message = 'Image processing failed',
    super.code = 'IMAGE_PROCESSING_ERROR',
  });
}

class VideoProcessingFailure extends MediaFailure {
  const VideoProcessingFailure({
    super.message = 'Video processing failed',
    super.code = 'VIDEO_PROCESSING_ERROR',
  });
}

class AudioProcessingFailure extends MediaFailure {
  const AudioProcessingFailure({
    super.message = 'Audio processing failed',
    super.code = 'AUDIO_PROCESSING_ERROR',
  });
}

class CompressionFailure extends MediaFailure {
  const CompressionFailure({
    super.message = 'Media compression failed',
    super.code = 'COMPRESSION_ERROR',
  });
}

// ============== VOICE/VIDEO FAILURES ==============

class CallFailure extends Failure {
  const CallFailure({
    super.message = 'Call error occurred',
    super.code = 'CALL_ERROR',
    super.details,
  });
}

class CallInitiationFailure extends CallFailure {
  const CallInitiationFailure({
    super.message = 'Failed to initiate call',
    super.code = 'CALL_INITIATION_ERROR',
  });
}

class CallConnectionFailure extends CallFailure {
  const CallConnectionFailure({
    super.message = 'Failed to connect to call',
    super.code = 'CALL_CONNECTION_ERROR',
  });
}

class CallPermissionFailure extends CallFailure {
  const CallPermissionFailure({
    super.message = 'Microphone/camera permission denied',
    super.code = 'CALL_PERMISSION_ERROR',
  });
}

class NetworkQualityFailure extends CallFailure {
  const NetworkQualityFailure({
    super.message = 'Poor network quality',
    super.code = 'NETWORK_QUALITY_ERROR',
  });
}

// ============== AI ENGINE FAILURES ==============

class AIFailure extends Failure {
  const AIFailure({
    super.message = 'AI service error',
    super.code = 'AI_ERROR',
    super.details,
  });
}

class AIModelNotFoundFailure extends AIFailure {
  const AIModelNotFoundFailure({
    super.message = 'AI model not found',
    super.code = 'AI_MODEL_NOT_FOUND',
  });
}

class AIInferenceFailure extends AIFailure {
  const AIInferenceFailure({
    super.message = 'AI inference failed',
    super.code = 'AI_INFERENCE_ERROR',
  });
}

class AIQuotaExceededFailure extends AIFailure {
  const AIQuotaExceededFailure({
    super.message = 'AI service quota exceeded',
    super.code = 'AI_QUOTA_EXCEEDED',
  });
}

// ============== ENTERPRISE FAILURES ==============

class EnterpriseFailure extends Failure {
  const EnterpriseFailure({
    super.message = 'Enterprise error occurred',
    super.code = 'ENTERPRISE_ERROR',
    super.details,
  });
}

class SubscriptionExpiredFailure extends EnterpriseFailure {
  const SubscriptionExpiredFailure({
    super.message = 'Subscription has expired',
    super.code = 'SUBSCRIPTION_EXPIRED',
  });
}

class SubscriptionLimitFailure extends EnterpriseFailure {
  final String limit;
  
  const SubscriptionLimitFailure({
    required this.limit,
    super.message = 'Subscription limit reached: $limit',
    super.code = 'SUBSCRIPTION_LIMIT',
  });
}

class TenantNotFoundFailure extends EnterpriseFailure {
  const TenantNotFoundFailure({
    super.message = 'Organization not found',
    super.code = 'TENANT_NOT_FOUND',
  });
}

// ============== MODERATION FAILURES ==============

class ModerationFailure extends Failure {
  const ModerationFailure({
    super.message = 'Moderation error occurred',
    super.code = 'MODERATION_ERROR',
    super.details,
  });
}

class ContentViolationFailure extends ModerationFailure {
  final String violationType;
  final double confidence;
  
  const ContentViolationFailure({
    required this.violationType,
    required this.confidence,
    super.message = 'Content violates community guidelines',
    super.code = 'CONTENT_VIOLATION',
  });
}

class ReportProcessingFailure extends ModerationFailure {
  const ReportProcessingFailure({
    super.message = 'Failed to process report',
    super.code = 'REPORT_PROCESSING_ERROR',
  });
}

// ============== CACHE FAILURES ==============

class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Cache error occurred',
    super.code = 'CACHE_ERROR',
    super.details,
  });
}

class CacheNotFoundFailure extends CacheFailure {
  const CacheNotFoundFailure({
    super.message = 'Cached data not found',
    super.code = 'CACHE_NOT_FOUND',
  });
}

class CacheExpiredFailure extends CacheFailure {
  const CacheExpiredFailure({
    super.message = 'Cached data has expired',
    super.code = 'CACHE_EXPIRED',
  });
}

// ============== UNKNOWN FAILURE ==============

class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unknown error occurred',
    super.code = 'UNKNOWN_ERROR',
    super.details,
  });
}
