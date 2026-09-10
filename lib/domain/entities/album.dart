class Album {
  final String id;
  final String title;
  final String? artistId;
  final Uri? artworkUri;
  final int? year;
  final int? totalTracks;

  const Album({
    required this.id,
    required this.title,
    this.artistId,
    this.artworkUri,
    this.year,
    this.totalTracks,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Album && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
