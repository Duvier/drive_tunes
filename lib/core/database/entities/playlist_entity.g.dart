// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlaylistEntityCollection on Isar {
  IsarCollection<PlaylistEntity> get playlistEntitys => this.collection();
}

const PlaylistEntitySchema = CollectionSchema(
  name: r'PlaylistEntity',
  id: -2458012604133279019,
  properties: {
    r'artworkUri': PropertySchema(
      id: 0,
      name: r'artworkUri',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(id: 2, name: r'name', type: IsarType.string),
    r'playlistId': PropertySchema(
      id: 3,
      name: r'playlistId',
      type: IsarType.string,
    ),
    r'songIds': PropertySchema(
      id: 4,
      name: r'songIds',
      type: IsarType.stringList,
    ),
  },

  estimateSize: _playlistEntityEstimateSize,
  serialize: _playlistEntitySerialize,
  deserialize: _playlistEntityDeserialize,
  deserializeProp: _playlistEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'playlistId': IndexSchema(
      id: 7921918076105486368,
      name: r'playlistId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'playlistId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _playlistEntityGetId,
  getLinks: _playlistEntityGetLinks,
  attach: _playlistEntityAttach,
  version: '3.3.2',
);

int _playlistEntityEstimateSize(
  PlaylistEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.artworkUri;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.playlistId.length * 3;
  bytesCount += 3 + object.songIds.length * 3;
  {
    for (var i = 0; i < object.songIds.length; i++) {
      final value = object.songIds[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _playlistEntitySerialize(
  PlaylistEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artworkUri);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.playlistId);
  writer.writeStringList(offsets[4], object.songIds);
}

PlaylistEntity _playlistEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlaylistEntity();
  object.artworkUri = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.playlistId = reader.readString(offsets[3]);
  object.songIds = reader.readStringList(offsets[4]) ?? [];
  return object;
}

P _playlistEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playlistEntityGetId(PlaylistEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _playlistEntityGetLinks(PlaylistEntity object) {
  return [];
}

void _playlistEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  PlaylistEntity object,
) {
  object.id = id;
}

extension PlaylistEntityByIndex on IsarCollection<PlaylistEntity> {
  Future<PlaylistEntity?> getByPlaylistId(String playlistId) {
    return getByIndex(r'playlistId', [playlistId]);
  }

  PlaylistEntity? getByPlaylistIdSync(String playlistId) {
    return getByIndexSync(r'playlistId', [playlistId]);
  }

  Future<bool> deleteByPlaylistId(String playlistId) {
    return deleteByIndex(r'playlistId', [playlistId]);
  }

  bool deleteByPlaylistIdSync(String playlistId) {
    return deleteByIndexSync(r'playlistId', [playlistId]);
  }

  Future<List<PlaylistEntity?>> getAllByPlaylistId(
    List<String> playlistIdValues,
  ) {
    final values = playlistIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'playlistId', values);
  }

  List<PlaylistEntity?> getAllByPlaylistIdSync(List<String> playlistIdValues) {
    final values = playlistIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'playlistId', values);
  }

  Future<int> deleteAllByPlaylistId(List<String> playlistIdValues) {
    final values = playlistIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'playlistId', values);
  }

  int deleteAllByPlaylistIdSync(List<String> playlistIdValues) {
    final values = playlistIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'playlistId', values);
  }

  Future<Id> putByPlaylistId(PlaylistEntity object) {
    return putByIndex(r'playlistId', object);
  }

  Id putByPlaylistIdSync(PlaylistEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'playlistId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPlaylistId(List<PlaylistEntity> objects) {
    return putAllByIndex(r'playlistId', objects);
  }

  List<Id> putAllByPlaylistIdSync(
    List<PlaylistEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'playlistId', objects, saveLinks: saveLinks);
  }
}

extension PlaylistEntityQueryWhereSort
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QWhere> {
  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlaylistEntityQueryWhere
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QWhereClause> {
  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterWhereClause>
  playlistIdEqualTo(String playlistId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'playlistId', value: [playlistId]),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterWhereClause>
  playlistIdNotEqualTo(String playlistId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'playlistId',
                lower: [],
                upper: [playlistId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'playlistId',
                lower: [playlistId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'playlistId',
                lower: [playlistId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'playlistId',
                lower: [],
                upper: [playlistId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension PlaylistEntityQueryFilter
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QFilterCondition> {
  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  artworkUriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'artworkUri'),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  artworkUriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'artworkUri'),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  artworkUriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'artworkUri', value: ''),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  artworkUriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'artworkUri', value: ''),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'playlistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'playlistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'playlistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'playlistId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'playlistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'playlistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'playlistId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'playlistId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'playlistId', value: ''),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  playlistIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'playlistId', value: ''),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'songIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'songIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'songIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'songIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'songIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'songIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'songIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'songIds',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songIds', value: ''),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'songIds', value: ''),
      );
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songIds', length, true, length, true);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songIds', 0, true, 0, true);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songIds', 0, true, length, include);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songIds', length, include, 999999, true);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterFilterCondition>
  songIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'songIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PlaylistEntityQueryObject
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QFilterCondition> {}

extension PlaylistEntityQueryLinks
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QFilterCondition> {}

extension PlaylistEntityQuerySortBy
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QSortBy> {
  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  sortByArtworkUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  sortByArtworkUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.desc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  sortByPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  sortByPlaylistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.desc);
    });
  }
}

extension PlaylistEntityQuerySortThenBy
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QSortThenBy> {
  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  thenByArtworkUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  thenByArtworkUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.desc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  thenByPlaylistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.asc);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QAfterSortBy>
  thenByPlaylistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistId', Sort.desc);
    });
  }
}

extension PlaylistEntityQueryWhereDistinct
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QDistinct> {
  QueryBuilder<PlaylistEntity, PlaylistEntity, QDistinct> distinctByArtworkUri({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artworkUri', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QDistinct> distinctByPlaylistId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playlistId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlaylistEntity, PlaylistEntity, QDistinct> distinctBySongIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songIds');
    });
  }
}

extension PlaylistEntityQueryProperty
    on QueryBuilder<PlaylistEntity, PlaylistEntity, QQueryProperty> {
  QueryBuilder<PlaylistEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlaylistEntity, String?, QQueryOperations> artworkUriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artworkUri');
    });
  }

  QueryBuilder<PlaylistEntity, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PlaylistEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PlaylistEntity, String, QQueryOperations> playlistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playlistId');
    });
  }

  QueryBuilder<PlaylistEntity, List<String>, QQueryOperations>
  songIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songIds');
    });
  }
}
