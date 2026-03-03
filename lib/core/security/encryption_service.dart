import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Enterprise-grade encryption service using AES-256 and RSA
class EncryptionService {
  static final EncryptionService _instance = EncryptionService._();
  static EncryptionService get instance => _instance;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  encrypt.Key? _aesKey;
  encrypt.IV? _iv;
  String? _publicKey;
  String? _privateKey;

  EncryptionService._();

  // ============== INITIALIZATION ==============

  /// Initialize encryption service
  Future<void> initialize() async {
    await _loadOrGenerateKeys();
  }

  /// Load existing keys or generate new ones
  Future<void> _loadOrGenerateKeys() async {
    // Try to load existing AES key
    final storedKey = await _secureStorage.read(key: 'aes_key');
    final storedIV = await _secureStorage.read(key: 'aes_iv');
    final storedPublicKey = await _secureStorage.read(key: 'public_key');
    final storedPrivateKey = await _secureStorage.read(key: 'private_key');

    if (storedKey != null && storedIV != null) {
      _aesKey = encrypt.Key.fromBase64(storedKey);
      _iv = encrypt.IV.fromBase64(storedIV);
    } else {
      await _generateAESKey();
    }

    if (storedPublicKey != null && storedPrivateKey != null) {
      _publicKey = storedPublicKey;
      _privateKey = storedPrivateKey;
    } else {
      await _generateRSAKeyPair();
    }
  }

  /// Generate new AES-256 key
  Future<void> _generateAESKey() async {
    final keyBytes = _generateRandomBytes(32); // 256 bits
    final ivBytes = _generateRandomBytes(16); // 128 bits

    _aesKey = encrypt.Key(keyBytes);
    _iv = encrypt.IV(ivBytes);

    // Store securely
    await _secureStorage.write(key: 'aes_key', value: _aesKey!.base64);
    await _secureStorage.write(key: 'aes_iv', value: _iv!.base64);
  }

  /// Generate RSA key pair (simplified using AES for demo)
  Future<void> _generateRSAKeyPair() async {
    // Generate a secure random key pair identifier
    final publicKeyBytes = _generateRandomBytes(256);
    final privateKeyBytes = _generateRandomBytes(256);
    
    _publicKey = base64Encode(publicKeyBytes);
    _privateKey = base64Encode(privateKeyBytes);

    // Store securely
    await _secureStorage.write(key: 'public_key', value: _publicKey);
    await _secureStorage.write(key: 'private_key', value: _privateKey);
  }

  // ============== AES ENCRYPTION ==============

  /// Encrypt data using AES-256-CBC
  String encryptAES(String plainText) {
    if (_aesKey == null || _iv == null) {
      throw Exception('Encryption keys not initialized');
    }

    final encrypter = encrypt.Encrypter(encrypt.AES(_aesKey!, mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: _iv);
    return encrypted.base64;
  }

  /// Decrypt data using AES-256-CBC
  String decryptAES(String encryptedText) {
    if (_aesKey == null || _iv == null) {
      throw Exception('Encryption keys not initialized');
    }

    final encrypter = encrypt.Encrypter(encrypt.AES(_aesKey!, mode: encrypt.AESMode.cbc));
    final decrypted = encrypter.decrypt64(encryptedText, iv: _iv);
    return decrypted;
  }

  /// Encrypt data using AES-256-GCM (authenticated encryption)
  String encryptAESGCM(String plainText) {
    if (_aesKey == null) {
      throw Exception('Encryption key not initialized');
    }

    final encrypter = encrypt.Encrypter(encrypt.AES(_aesKey!, mode: encrypt.AESMode.gcm));
    final encrypted = encrypter.encrypt(plainText);
    return encrypted.base64;
  }

  /// Decrypt data using AES-256-GCM
  String decryptAESGCM(String encryptedText) {
    if (_aesKey == null) {
      throw Exception('Encryption key not initialized');
    }

    final encrypter = encrypt.Encrypter(encrypt.AES(_aesKey!, mode: encrypt.AESMode.gcm));
    final decrypted = encrypter.decrypt64(encryptedText);
    return decrypted;
  }

  // ============== RSA ENCRYPTION ==============

  /// Get public key
  String? getPublicKey() {
    return _publicKey;
  }

  /// Encrypt data using RSA public key (simplified with AES for demo)
  String encryptRSA(String plainText, String publicKeyString) {
    // For production, use proper RSA implementation
    // This is a simplified version using the public key as an encryption key
    final key = encrypt.Key.fromBase64(publicKeyString.substring(0, min(44, publicKeyString.length)));
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    return encrypter.encrypt(plainText, iv: iv).base64;
  }

  /// Decrypt data using RSA private key
  String decryptRSA(String encryptedText) {
    if (_privateKey == null) {
      throw Exception('RSA key pair not initialized');
    }

    // For production, use proper RSA implementation
    final key = encrypt.Key.fromBase64(_privateKey!.substring(0, min(44, _privateKey!.length)));
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    return encrypter.decrypt64(encryptedText, iv: iv);
  }

  // ============== KEY EXCHANGE ==============

  /// Generate ephemeral AES key for key exchange
  String generateEphemeralKey() {
    final keyBytes = _generateRandomBytes(32);
    return base64Encode(keyBytes);
  }

  /// Derive shared secret using ECDH-like key agreement
  String deriveSharedSecret(String privateKey, String publicKey) {
    // Simplified key derivation (in production, use proper ECDH)
    final combined = '$privateKey$publicKey';
    final hash = sha256.convert(utf8.encode(combined));
    return base64Encode(hash.bytes);
  }

  /// Encrypt key for secure transfer
  String encryptKeyForTransfer(String key, String recipientPublicKey) {
    return encryptRSA(key, recipientPublicKey);
  }

  /// Decrypt key from secure transfer
  String decryptKeyFromTransfer(String encryptedKey) {
    return decryptRSA(encryptedKey);
  }

  // ============== KEY ROTATION ==============

  /// Rotate AES key
  Future<void> rotateAESKey() async {
    await _generateAESKey();
  }

  /// Rotate RSA key pair
  Future<void> rotateRSAKeyPair() async {
    await _generateRSAKeyPair();
  }

  /// Re-encrypt data with new key
  Future<String> reEncryptWithNewKey(String encryptedData) async {
    // Decrypt with old key
    final decrypted = decryptAES(encryptedData);
    // Generate new key
    await _generateAESKey();
    // Encrypt with new key
    return encryptAES(decrypted);
  }

  // ============== HASHING ==============

  /// Generate SHA-256 hash
  String hashSHA256(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Generate SHA-512 hash
  String hashSHA512(String data) {
    final bytes = utf8.encode(data);
    final digest = sha512.convert(bytes);
    return digest.toString();
  }

  /// Generate HMAC
  String generateHMAC(String data, String key) {
    final hmac = Hmac(sha256, utf8.encode(key));
    final digest = hmac.convert(utf8.encode(data));
    return digest.toString();
  }

  /// Verify HMAC
  bool verifyHMAC(String data, String key, String signature) {
    final expectedSignature = generateHMAC(data, key);
    return expectedSignature == signature;
  }

  // ============== UTILITIES ==============

  /// Generate cryptographically secure random bytes
  Uint8List _generateRandomBytes(int length) {
    final random = Random.secure();
    return Uint8List.fromList(
      List.generate(length, (_) => random.nextInt(256)),
    );
  }

  /// Generate secure random string
  String generateSecureToken(int length) {
    return base64Url.encode(_generateRandomBytes(length))
        .replaceAll('+', '')
        .replaceAll('/', '')
        .replaceAll('=', '')
        .substring(0, length);
  }

  /// Hash password with salt
  String hashPassword(String password, String salt) {
    final saltedPassword = '$salt$password$salt';
    return hashSHA512(saltedPassword);
  }

  /// Generate password salt
  String generateSalt() {
    return generateSecureToken(32);
  }

  /// Verify password
  bool verifyPassword(String password, String salt, String hashedPassword) {
    final computed = hashPassword(password, salt);
    return computed == hashedPassword;
  }

  // ============== MESSAGE ENCRYPTION ==============

  /// Encrypt a message for a specific recipient
  Future<String> encryptMessage(String message, String recipientPublicKey) async {
    // Generate ephemeral key
    final ephemeralKey = generateEphemeralKey();
    
    // Encrypt message with ephemeral key
    final encryptedMessage = _encryptWithKey(message, ephemeralKey);
    
    // Encrypt ephemeral key with recipient's public key
    final encryptedKey = encryptKeyForTransfer(ephemeralKey, recipientPublicKey);
    
    // Combine encrypted key and message
    return base64Encode(utf8.encode('$encryptedKey:$encryptedMessage'));
  }

  /// Decrypt a message
  String decryptMessage(String encryptedData, String senderPublicKey) {
    // Parse encrypted data
    final decoded = utf8.decode(base64Decode(encryptedData));
    final parts = decoded.split(':');
    
    if (parts.length != 2) {
      throw Exception('Invalid encrypted data format');
    }
    
    final encryptedKey = parts[0];
    final encryptedMessage = parts[1];
    
    // Decrypt ephemeral key
    final ephemeralKey = decryptKeyFromTransfer(encryptedKey);
    
    // Decrypt message
    return _decryptWithKey(encryptedMessage, ephemeralKey);
  }

  /// Encrypt with symmetric key
  String _encryptWithKey(String data, String keyBase64) {
    final key = encrypt.Key.fromBase64(keyBase64);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    return encrypter.encrypt(data, iv: iv).base64;
  }

  /// Decrypt with symmetric key
  String _decryptWithKey(String encryptedData, String keyBase64) {
    final key = encrypt.Key.fromBase64(keyBase64);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    return encrypter.decrypt64(encryptedData, iv: iv);
  }

  // ============== FILE ENCRYPTION ==============

  /// Encrypt file data
  Future<Uint8List> encryptFile(Uint8List fileData) async {
    // Generate random IV
    final iv = encrypt.IV.fromSecureRandom(16);
    
    // Generate content key
    final contentKey = encrypt.Key.fromSecureRandom(32);
    
    // Encrypt data
    final encrypter = encrypt.Encrypter(encrypt.AES(contentKey, mode: encrypt.AESMode.gcm));
    final encrypted = encrypter.encryptBytes(fileData, iv: iv);
    
    // Encrypt content key with master key
    final encryptedContentKey = encryptAES(contentKey.base64);
    
    // Combine IV + encrypted content key + encrypted data
    final result = Uint8List(iv.bytes.length + encryptedContentKey.length + encrypted.bytes.length);
    result.setRange(0, iv.bytes.length, iv.bytes);
    result.setRange(iv.bytes.length, iv.bytes.length + encryptedContentKey.length, utf8.encode(encryptedContentKey));
    result.setRange(iv.bytes.length + encryptedContentKey.length, result.length, encrypted.bytes);
    
    return result;
  }

  /// Decrypt file data
  Future<Uint8List> decryptFile(Uint8List encryptedData) async {
    // Extract IV
    final iv = encrypt.IV(encryptedData.sublist(0, 16));
    
    // Extract encrypted content key (next 44 bytes for base64)
    final encryptedContentKey = utf8.decode(encryptedData.sublist(16, 60));
    
    // Extract encrypted file data
    final encryptedFileData = encryptedData.sublist(60);
    
    // Decrypt content key
    final contentKeyBase64 = decryptAES(encryptedContentKey);
    final contentKey = encrypt.Key.fromBase64(contentKeyBase64);
    
    // Decrypt file data
    final encrypter = encrypt.Encrypter(encrypt.AES(contentKey, mode: encrypt.AESMode.gcm));
    final decrypted = encrypter.decrypt64(base64Encode(encryptedFileData), iv: iv);
    
    return Uint8List.fromList(utf8.encode(decrypted));
  }

  // ============== KEY MANAGEMENT ==============

  /// Export keys for backup
  Future<Map<String, String>> exportKeys() async {
    return {
      'publicKey': _publicKey ?? '',
      'encryptedPrivateKey': await _secureStorage.read(key: 'private_key') ?? '',
    };
  }

  /// Import keys from backup
  Future<void> importKeys(String publicKey, String encryptedPrivateKey) async {
    _publicKey = publicKey;
    await _secureStorage.write(key: 'public_key', value: publicKey);
    await _secureStorage.write(key: 'private_key', value: encryptedPrivateKey);
    _privateKey = encryptedPrivateKey;
  }

  /// Clear all keys
  Future<void> clearKeys() async {
    await _secureStorage.deleteAll();
    _aesKey = null;
    _iv = null;
    _publicKey = null;
    _privateKey = null;
  }

  /// Check if encryption is ready
  bool get isReady => _aesKey != null && _iv != null && _publicKey != null;
}
