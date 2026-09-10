class Artist {
  final String id;
  final String name;
  final Uri? artworkUri;

  const Artist({
    required this.id,
    required this.name,
    this.artworkUri,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Artist && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
