import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user.dart';

/// Auth state provider
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

/// Current user provider
final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).valueOrNull;
});

/// Auth notifier for auth operations
class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthNotifier() : super(const AsyncValue.loading()) {
    _init();
  }

  void _init() {
    _auth.authStateChanges().listen((user) {
      state = AsyncValue.data(user);
    }, onError: (error, stack) {
      state = AsyncValue.error(error, stack);
    });
  }

  /// Sign in with email and password
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = AsyncValue.data(credential.user);
      return credential;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  /// Sign up with email and password
  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    state = const AsyncValue.loading();
    try {
      // Create user
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update display name
      await credential.user?.updateDisplayName(username);

      // Send email verification
      await credential.user?.sendEmailVerification();

      state = AsyncValue.data(credential.user);
      return credential;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  /// Reset password
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  /// Verify email
  Future<void> verifyEmail() async {
    await _auth.currentUser?.sendEmailVerification();
  }

  /// Delete account
  Future<void> deleteAccount() async {
    await _auth.currentUser?.delete();
    state = const AsyncValue.data(null);
  }

  /// Reauthenticate
  Future<void> reauthenticate(String password) async {
    final user = _auth.currentUser;
    if (user?.email == null) throw Exception('No email');

    final credential = EmailAuthProvider.credential(
      email: user!.email!,
      password: password,
    );
    await user.reauthenticateWithCredential(credential);
  }

  /// Update profile
  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.updateDisplayName(displayName);
      if (photoURL != null) {
        await user.updatePhotoURL(photoURL);
      }
    }
  }

  /// Link email and password
  Future<void> linkEmailPassword({
    required String email,
    required String password,
  }) async {
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await _auth.currentUser?.linkWithCredential(credential);
  }

  /// Unlink email provider
  Future<void> unlinkEmail() async {
    await _auth.currentUser?.unlink(EmailAuthProvider.PROVIDER_ID);
  }

  /// Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    // Implementation for Google sign in
    throw UnimplementedError();
  }

  /// Sign in with Apple
  Future<UserCredential> signInWithApple() async {
    // Implementation for Apple sign in
    throw UnimplementedError();
  }

  /// Sign in with phone
  Future<UserCredential> signInWithPhone(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return await _auth.signInWithCredential(credential);
  }
}

/// Auth notifier provider
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  return AuthNotifier();
});

/// User profile provider
final userProfileProvider = FutureProvider.family<User?, String>((ref, userId) async {
  // Fetch user profile from Firestore
  return null;
});

/// User settings provider
final userSettingsProvider = StateNotifierProvider<UserSettingsNotifier, UserSettings>((ref) {
  return UserSettingsNotifier();
});

class UserSettingsNotifier extends StateNotifier<UserSettings> {
  UserSettingsNotifier() : super(const UserSettings());

  void updateTheme(String theme) {
    state = state.copyWith(theme: theme);
  }

  void updateLocale(String locale) {
    state = state.copyWith(locale: locale);
  }

  void toggleOnlineStatus() {
    state = state.copyWith(showOnlineStatus: !state.showOnlineStatus);
  }

  void toggleDirectMessages() {
    state = state.copyWith(allowDirectMessages: !state.allowDirectMessages);
  }

  void toggleReadReceipts() {
    state = state.copyWith(readReceipts: !state.readReceipts);
  }

  void toggleTypingIndicators() {
    state = state.copyWith(typingIndicators: !state.typingIndicators);
  }

  void toggleCompactMode() {
    state = state.copyWith(compactMode: !state.compactMode);
  }

  void toggleDeveloperMode() {
    state = state.copyWith(developerMode: !state.developerMode);
  }
}

/// Online status provider
final onlineStatusProvider = StreamProvider<bool>((ref) {
  // Listen to user presence
  return Stream.value(true);
});
