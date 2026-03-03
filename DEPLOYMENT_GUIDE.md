# Nexus Messenger - Deployment Guide

## Prerequisites

### Required Tools
- Flutter SDK 3.16.0+
- Dart SDK 3.2.0+
- Node.js 18+ (for Cloud Functions)
- Firebase CLI
- Android SDK (for Android builds)
- Xcode (for iOS builds)

### Required Accounts
- Firebase Project (Blaze Plan recommended for production)
- Google Cloud Platform Project
- Apple Developer Account (for iOS)
- GitHub Repository (for CI/CD)

## Setup Steps

### 1. Clone and Install Dependencies
```bash
git clone https://github.com/your-org/nexus-messenger.git
cd nexus-messenger
flutter pub get
```

### 2. Firebase Setup

#### Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create new project
3. Enable Firestore, Storage, Authentication, and Hosting

#### Configure Firebase
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase
firebase init
```

#### Update Configuration
Replace values in `lib/core/constants/app_constants.dart`:
- `firebaseApiKey`: Your Firebase API key
- `firebaseAppId`: Your Firebase app ID
- `firebaseMessagingSenderId`: Your messaging sender ID
- `firebaseProjectId`: Your project ID

### 3. Security Rules

#### Deploy Firestore Rules
```bash
firebase deploy --only firestore:rules
```

#### Deploy Storage Rules
```bash
firebase deploy --only storage:rules
```

### 4. Environment Configuration

#### Development
```bash
# Create .env file
cp .env.example .env.dev

# Update with development values
```

#### Production
```bash
# Create production .env
cp .env.example .env.prod

# Update with production values
# Use CI/CD secrets for sensitive data
```

### 5. Build Commands

#### Development Build
```bash
# Run in debug mode
flutter run

# Build debug APK
flutter build apk --debug

# Build for iOS simulator
flutter build ios --simulator --no-codesign
```

#### Production Build
```bash
# Build release APK
flutter build apk --release

# Build iOS release
flutter build ios --release

# Build web
flutter build web --release

# Build desktop
flutter build linux --release
flutter build macos --release
flutter build windows --release
```

### 6. CI/CD Setup

#### GitHub Secrets
Configure these secrets in your GitHub repository:
- `FIREBASE_TOKEN`: Firebase CLI token
- `ANDROID_SDK_ROOT`: Android SDK path
- `KEYSTORE_PASSWORD`: Android keystore password
- `KEY_ALIAS`: Android key alias
- `KEY_PASSWORD`: Android key password
- `MATCH_PASSWORD`: Fastlane match password
- `PROVISIONING_PROFILE_*`: iOS provisioning profiles
- `CERTIFICATE_*`: iOS certificates

#### Enable GitHub Actions
1. Go to repository Settings
2. Enable Actions
3. Push code to trigger workflow

### 7. Deployment

#### Deploy to Firebase Hosting
```bash
firebase deploy --only hosting
```

#### Deploy Cloud Functions
```bash
cd functions
npm install
firebase deploy --only functions
```

### 8. Post-Deployment

#### Verify Deployment
1. Check Firebase Console for deployed assets
2. Test authentication flow
3. Verify Firestore database structure
4. Test file uploads to Storage

#### Monitoring
- Set up Firebase Crashlytics
- Configure Firebase Analytics
- Set up Cloud Monitoring alerts

## Scaling Strategy

### Horizontal Scaling
- Use Firebase App Distribution for testing
- Configure Cloud Run for Cloud Functions
- Use Cloud CDN for static assets

### Vertical Scaling
- Optimize Firestore queries
- Implement caching layer
- Use offline-first architecture

### Database Sharding
- Implement tenant-based sharding for multi-tenant
- Use collection group queries efficiently

## Performance Optimization

### Frontend
- Implement lazy loading
- Use image caching
- Optimize bundle size with tree shaking

### Backend
- Index Firestore queries properly
- Use Cloud Functions efficiently
- Implement rate limiting

### Network
- Use CDN for static assets
- Implement PWA service workers
- Optimize API calls

## Security Checklist

- [ ] Enable 2FA on all admin accounts
- [ ] Configure proper CORS policies
- [ ] Implement rate limiting
- [ ] Set up audit logging
- [ ] Enable encryption at rest
- [ ] Configure secure headers
- [ ] Implement proper authentication flows

## Troubleshooting

### Common Issues

#### Build Errors
- Clear Flutter cache: `flutter clean`
- Update dependencies: `flutter pub upgrade`
- Check Dart version compatibility

#### Authentication Issues
- Verify Firebase configuration
- Check authentication providers in Console
- Ensure correct OAuth redirect URIs

#### Deployment Issues
- Check Firebase CLI version
- Verify project permissions
- Check billing status

## Support

For issues and questions:
- GitHub Issues
- Discord Community
- Email Support
