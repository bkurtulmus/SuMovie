class FeedPost {
  String userphoto;
  String username;
  String text;
  String photo;
  String date;
  int likes;
  int dislikes;
  int comments;

  FeedPost({
    required this.userphoto,
    required this.username,
    required this.text,
    required this.photo,
    required this.date,
    required this.likes,
    required this.dislikes,
    required this.comments,
  });
}