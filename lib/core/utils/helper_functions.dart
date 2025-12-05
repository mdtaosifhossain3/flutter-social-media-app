String formatTimeAgo(String timestamp) {
  // 1. Parse the string into a DateTime object
  // DateTime.parse handles "2025-11-28 19:34:08.832823" automatically
  DateTime parsedDate = DateTime.parse(timestamp);

  // 2. Calculate the difference between now and the timestamp
  final now = DateTime.now();
  final difference = now.difference(parsedDate);

  // 3. Logic to return the correct string
  if (difference.inDays > 365) {
    return '${(difference.inDays / 365).floor()}y ago'; // Years
  } else if (difference.inDays > 30) {
    return '${(difference.inDays / 30).floor()}mo ago'; // Months
  } else if (difference.inDays >= 7) {
    return '${(difference.inDays / 7).floor()}w ago'; // Weeks
  } else if (difference.inDays >= 1) {
    return '${difference.inDays}d ago'; // Days
  } else if (difference.inHours >= 1) {
    return '${difference.inHours}h ago'; // Hours
  } else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes}m ago'; // Minutes
  } else {
    return 'Just now'; // Seconds
  }
}
