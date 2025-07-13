bool isPalindrome(String text) {
  final processed = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
  return processed == processed.split('').reversed.join('');
}
