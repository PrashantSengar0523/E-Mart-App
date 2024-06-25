class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return '💌 The email address is already registered. Please use a different email.';
      case 'user-not-found':
        return '👤 No user found for that email.';
      case 'wrong-password':
        return '🔑 Wrong password provided.';
      case 'invalid-email':
        return '📧 The email address is invalid.';
      case 'weak-password':
        return '💪 The password is too weak.';
      case 'operation-not-allowed':
        return '⛔ Operation not allowed.';
      case 'user-disabled':
        return '🚫 The user account has been disabled.';
      case 'too-many-requests':
        return '⏳ Too many requests. Try again later.';
      case 'network-request-failed':
        return '🌐 Network request failed. Please check your connection.';
      case 'invalid-credential':
        return '❌ The credential provided is invalid.';
      case 'user-mismatch':
        return '🧩 The credential does not correspond to the user.';
      case 'requires-recent-login':
        return '⏰ This operation is sensitive and requires recent authentication.';
      case 'credential-already-in-use':
        return '🔄 This credential is already associated with a different user account.';
      case 'invalid-verification-code':
        return '📵 The SMS verification code used is invalid.';
      case 'invalid-verification-id':
        return '🔢 The verification ID used is invalid.';
      case 'session-expired':
        return '⌛ The SMS code has expired.';
      case 'missing-email':
        return '❓ An email address must be provided.';
      case 'invalid-user-token':
        return '🚷 The user\'s credential is no longer valid. The user must sign in again.';
      case 'user-token-expired':
        return '⏱️ The user\'s credential has expired. The user must sign in again.';
      case 'invalid-api-key':
        return '🔑 The API key provided is invalid.';
      case 'app-not-authorized':
        return '🚫 This app is not authorized to use Firebase Authentication with the provided API key.';
      default:
        return '❓ An unknown error occurred.';
    }
  }

  // @override
  // String toString() {
  //   return 'FormatException(code: $code, message: $message)';
  // }
}
