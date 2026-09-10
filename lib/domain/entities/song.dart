class Song {
  final int id;
  final String title;
  final Duration duration;
  final Uri source;
  final String? albumId;
  final List<String> artistIds;
  final Uri? artwork;

  const Song({
    required this.id,
    required this.title,
    required this.duration,
    required this.source,
    this.albumId,
    this.artistIds = const [],
    this.artwork,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Song && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
