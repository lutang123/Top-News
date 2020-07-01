class Constants {
  static String TOP_HEADLINES_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=4949ad1dcf2a41bb812b06d5e788212c';

  static String headlinesFor(String keyword) {
    return 'https://newsapi.org/v2/everything?q=$keyword&apiKey=4949ad1dcf2a41bb812b06d5e788212c';
  }
}
