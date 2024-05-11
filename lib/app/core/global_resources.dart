String toNonDiacritics(String value) {
  String diacritics = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  String nonDiacritics = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';
  return value.splitMapJoin(
    '',
    onNonMatch: (char) => char.isNotEmpty && diacritics.contains(char)
        ? nonDiacritics[diacritics.indexOf(char)]
        : char,
  );
}
