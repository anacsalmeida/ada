class User {
  final String id;
  final String email;
  final String name;
  final String photoUrl;
  final String description;
  final String bio;
  final String training;
  final String currently;
  final List<String> skills;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.description,
    required this.bio,
    required this.training,
    required this.currently,
    required this.skills,
  });
}