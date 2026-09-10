// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetArtistEntityCollection on Isar {
  IsarCollection<ArtistEntity> get artistEntitys => this.collection();
}

const ArtistEntitySchema = CollectionSchema(
  name: r'ArtistEntity',
  id: -3512007407542063331,
  properties: {
    r'artistId': PropertySchema(
      id: 0,
      name: r'artistId',
      type: IsarType.string,
    ),
    r'artworkUri': PropertySchema(
      id: 1,
      name: r'artworkUri',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 2, name: r'name', type: IsarType.string),
  },

  estimateSize: _artistEntityEstimateSize,
  serialize: _artistEntitySerialize,
  deserialize: _artistEntityDeserialize,
  deserializeProp: _artistEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'artistId': IndexSchema(
      id: 8275676849534481306,
      name: r'artistId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'artistId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _artistEntityGetId,
  getLinks: _artistEntityGetLinks,
  attach: _artistEntityAttach,
  version: '3.3.2',
);

int _artistEntityEstimateSize(
  ArtistEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.artistId.length * 3;
  {
    final value = object.artworkUri;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _artistEntitySerialize(
  ArtistEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artistId);
  writer.writeString(offsets[1], object.artworkUri);
  writer.writeString(offsets[2], object.name);
}

ArtistEntity _artistEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ArtistEntity();
  object.artistId = reader.readString(offsets[0]);
  object.artworkUri = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  return object;
}

P _artistEntityDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _artistEntityGetId(ArtistEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _artistEntityGetLinks(ArtistEntity object) {
  return [];
}

void _artistEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  ArtistEntity object,
) {
  object.id = id;
}

extension ArtistEntityByIndex on IsarCollection<ArtistEntity> {
  Future<ArtistEntity?> getByArtistId(String artistId) {
    return getByIndex(r'artistId', [artistId]);
  }

  ArtistEntity? getByArtistIdSync(String artistId) {
    return getByIndexSync(r'artistId', [artistId]);
  }

  Future<bool> deleteByArtistId(String artistId) {
    return deleteByIndex(r'artistId', [artistId]);
  }

  bool deleteByArtistIdSync(String artistId) {
    return deleteByIndexSync(r'artistId', [artistId]);
  }

  Future<List<ArtistEntity?>> getAllByArtistId(List<String> artistIdValues) {
    final values = artistIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'artistId', values);
  }

  List<ArtistEntity?> getAllByArtistIdSync(List<String> artistIdValues) {
    final values = artistIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'artistId', values);
  }

  Future<int> deleteAllByArtistId(List<String> artistIdValues) {
    final values = artistIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'artistId', values);
  }

  int deleteAllByArtistIdSync(List<String> artistIdValues) {
    final values = artistIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'artistId', values);
  }

  Future<Id> putByArtistId(ArtistEntity object) {
    return putByIndex(r'artistId', object);
  }

  Id putByArtistIdSync(ArtistEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'artistId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByArtistId(List<ArtistEntity> objects) {
    return putAllByIndex(r'artistId', objects);
  }

  List<Id> putAllByArtistIdSync(
    List<ArtistEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'artistId', objects, saveLinks: saveLinks);
  }
}

extension ArtistEntityQueryWhereSort
    on QueryBuilder<ArtistEntity, ArtistEntity, QWhere> {
  QueryBuilder<ArtistEntity, ArtistEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ArtistEntityQueryWhere
    on QueryBuilder<ArtistEntity, ArtistEntity, QWhereClause> {
  QueryBuilder<ArtistEntity, ArtistEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterWhereClause> artistIdEqualTo(
    String artistId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'artistId', value: [artistId]),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterWhereClause>
  artistIdNotEqualTo(String artistId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'artistId',
                lower: [],
                upper: [artistId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'artistId',
                lower: [artistId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'artistId',
                lower: [artistId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'artistId',
                lower: [],
                upper: [artistId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ArtistEntityQueryFilter
    on QueryBuilder<ArtistEntity, ArtistEntity, QFilterCondition> {
  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artistIdEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artistIdGreaterThan(
    String value, {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artistIdLessThan(
    String value, {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artistIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artistIdMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artistIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'artistId', value: ''),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artistIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'artistId', value: ''),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artworkUriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'artworkUri'),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artworkUriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'artworkUri'),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artworkUriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'artworkUri', value: ''),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  artworkUriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'artworkUri', value: ''),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }
}

extension ArtistEntityQueryObject
    on QueryBuilder<ArtistEntity, ArtistEntity, QFilterCondition> {}

extension ArtistEntityQueryLinks
    on QueryBuilder<ArtistEntity, ArtistEntity, QFilterCondition> {}

extension ArtistEntityQuerySortBy
    on QueryBuilder<ArtistEntity, ArtistEntity, QSortBy> {
  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> sortByArtistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.asc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> sortByArtistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.desc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> sortByArtworkUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.asc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy>
  sortByArtworkUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.desc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ArtistEntityQuerySortThenBy
    on QueryBuilder<ArtistEntity, ArtistEntity, QSortThenBy> {
  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> thenByArtistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.asc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> thenByArtistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.desc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> thenByArtworkUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.asc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy>
  thenByArtworkUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artworkUri', Sort.desc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ArtistEntityQueryWhereDistinct
    on QueryBuilder<ArtistEntity, ArtistEntity, QDistinct> {
  QueryBuilder<ArtistEntity, ArtistEntity, QDistinct> distinctByArtistId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artistId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QDistinct> distinctByArtworkUri({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artworkUri', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ArtistEntity, ArtistEntity, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension ArtistEntityQueryProperty
    on QueryBuilder<ArtistEntity, ArtistEntity, QQueryProperty> {
  QueryBuilder<ArtistEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ArtistEntity, String, QQueryOperations> artistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artistId');
    });
  }

  QueryBuilder<ArtistEntity, String?, QQueryOperations> artworkUriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artworkUri');
    });
  }

  QueryBuilder<ArtistEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
