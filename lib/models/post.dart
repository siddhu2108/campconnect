class Post {
  final int postId;
  final String imageUrl;
  final String description;
  final DateTime postDateTime;
  final String postedBy;

  Post({
    required this.postId,
    required this.imageUrl,
    required this.description,
    required this.postDateTime,
    required this.postedBy,
  });
}
