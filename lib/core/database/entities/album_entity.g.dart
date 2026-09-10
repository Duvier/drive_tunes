// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlbumEntityCollection on Isar {
  IsarCollection<AlbumEntity> get albumEntitys => this.collection();
}

const AlbumEntitySchema = CollectionSchema(
  name: r'AlbumEntity',
  id: 5722830199791071764,
  properties: {
    r'albumId': PropertySchema(id: 0, name: r'albumId', type: IsarType.string),
    r'artistId': PropertySchema(
      id: 1,
      name: r'artistId',
      type: IsarType.string,
    ),
    r'artworkUri': PropertySchema(
      id: 2,
      name: r'artworkUri',
      type: IsarType.string,
    ),
    r'title': PropertySchema(id: 3, name: r'title', type: IsarType.string),
    r'totalTracks': PropertySchema(
      id: 4,
      name: r'totalTracks',
      type: IsarType.long,
    ),
    r'year': PropertySchema(id: 5, name: r'year', type: IsarType.long),
  },

  estimateSize: _albumEntityEstimateSize,
  serialize: _albumEntitySerialize,
  deserialize: _albumEntityDeserialize,
  deserializeProp: _albumEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'albumId': IndexSchema(
      id: -3314078833704812111,
      name: r'albumId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'albumId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _albumEntityGetId,
  getLinks: _albumEntityGetLinks,
  attach: _albumEntityAttach,
  version: '3.3.2',
);

int _albumEntityEstimateSize(
  AlbumEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.albumId.length * 3;
  {
    final value = object.artistId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.artworkUri;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _albumEntitySerialize(
  AlbumEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.albumId);
  writer.writeString(offsets[1], object.artistId);
  writer.writeString(offsets[2], object.artworkUri);
  writer.writeString(offsets[3], object.title);
  writer.writeLong(offsets[4], object.totalTracks);
  writer.writeLong(offsets[5], object.year);
}

AlbumEntity _albumEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlbumEntity();
  object.albumId = reader.readString(offsets[0]);
  object.artistId = reader.readStringOrNull(offsets[1]);
  object.artworkUri = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.title = reader.readString(offsets[3]);
  object.totalTracks = reader.readLongOrNull(offsets[4]);
  object.year = reader.readLongOrNull(offsets[5]);
  return object;
}

P _albumEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _albumEntityGetId(AlbumEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _albumEntityGetLinks(AlbumEntity object) {
  return [];
}

void _albumEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  AlbumEntity object,
) {
  object.id = id;
}

extension AlbumEntityByIndex on IsarCollection<AlbumEntity> {
  Future<AlbumEntity?> getByAlbumId(String albumId) {
    return getByIndex(r'albumId', [albumId]);
  }

  AlbumEntity? getByAlbumIdSync(String albumId) {
    return getByIndexSync(r'albumId', [albumId]);
  }

  Future<bool> deleteByAlbumId(String albumId) {
    return deleteByIndex(r'albumId', [albumId]);
  }

  bool deleteByAlbumIdSync(String albumId) {
    return deleteByIndexSync(r'albumId', [albumId]);
  }

  Future<List<AlbumEntity?>> getAllByAlbumId(List<String> albumIdValues) {
    final values = albumIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'albumId', values);
  }

  List<AlbumEntity?> getAllByAlbumIdSync(List<String> albumIdValues) {
    final values = albumIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'albumId', values);
  }

  Future<int> deleteAllByAlbumId(List<String> albumIdValues) {
    final values = albumIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'albumId', values);
  }

  int deleteAllByAlbumIdSync(List<String> albumIdValues) {
    final values = albumIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'albumId', values);
  }

  Future<Id> putByAlbumId(AlbumEntity object) {
    return putByIndex(r'albumId', object);
  }

  Id putByAlbumIdSync(AlbumEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'albumId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAlbumId(List<AlbumEntity> objects) {
    return putAllByIndex(r'albumId', objects);
  }

  List<Id> putAllByAlbumIdSync(
    List<AlbumEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'albumId', objects, saveLinks: saveLinks);
  }
}

extension AlbumEntityQueryWhereSort
    on QueryBuilder<AlbumEntity, AlbumEntity, QWhere> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AlbumEntityQueryWhere
    on QueryBuilder<AlbumEntity, AlbumEntity, QWhereClause> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> albumIdEqualTo(
    String albumId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'albumId', value: [albumId]),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterWhereClause> albumIdNotEqualTo(
    String albumId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [],
                upper: [albumId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [albumId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [albumId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [],
                upper: [albumId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension AlbumEntityQueryFilter
    on QueryBuilder<AlbumEntity, AlbumEntity, QFilterCondition> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  albumIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'albumId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  albumIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> albumIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'albumId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  albumIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'albumId', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  albumIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'albumId', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'artistId'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'artistId'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> artistIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'artistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'artistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'artistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> artistIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'artistId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'artistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'artistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'artistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> artistIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'artistId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'artistId', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artistIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'artistId', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'artworkUri'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'artworkUri'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'artworkUri',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'artworkUri',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'artworkUri',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'artworkUri',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'artworkUri',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'artworkUri',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'artworkUri',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'artworkUri',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'artworkUri', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  artworkUriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'artworkUri', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  totalTracksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalTracks'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  totalTracksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalTracks'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  totalTracksEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalTracks', value: value),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  totalTracksGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalTracks',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  totalTracksLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalTracks',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  totalTracksBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalTracks',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'year'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition>
  yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'year'),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> yearEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'year', value: value),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'year',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'year',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterFilterCondition> yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'year',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AlbumEntityQueryObject
    on QueryBuilder<AlbumEntity, AlbumEntity, QFilterCondition> {}

extension AlbumEntityQueryLinks
    on QueryBuilder<AlbumEntity, AlbumEntity, QFilterCondition> {}

extension AlbumEntityQuerySortBy
    on QueryBuilder<AlbumEntity, AlbumEntity, QSortBy> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByArtistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByArtistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByArtworkUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByArtworkUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByTotalTracks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTracks', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByTotalTracksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTracks', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension AlbumEntityQuerySortThenBy
    on QueryBuilder<AlbumEntity, AlbumEntity, QSortThenBy> {
  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByArtistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByArtistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByArtworkUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByArtworkUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByTotalTracks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTracks', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByTotalTracksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTracks', Sort.desc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension AlbumEntityQueryWhereDistinct
    on QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> {
  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByAlbumId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'albumId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByArtistId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artistId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByArtworkUri({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artworkUri', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByTotalTracks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTracks');
    });
  }

  QueryBuilder<AlbumEntity, AlbumEntity, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension AlbumEntityQueryProperty
    on QueryBuilder<AlbumEntity, AlbumEntity, QQueryProperty> {
  QueryBuilder<AlbumEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AlbumEntity, String, QQueryOperations> albumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'albumId');
    });
  }

  QueryBuilder<AlbumEntity, String?, QQueryOperations> artistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artistId');
    });
  }

  QueryBuilder<AlbumEntity, String?, QQueryOperations> artworkUriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artworkUri');
    });
  }

  QueryBuilder<AlbumEntity, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<AlbumEntity, int?, QQueryOperations> totalTracksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTracks');
    });
  }

  QueryBuilder<AlbumEntity, int?, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
