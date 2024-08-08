// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $MasterTable extends Master with TableInfo<$MasterTable, MasterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MasterTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<String> lat = GeneratedColumn<String>(
      'lat', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<String> long = GeneratedColumn<String>(
      'long', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, lat, long, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'master';
  @override
  VerificationContext validateIntegrity(Insertable<MasterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
          _longMeta, long.isAcceptableOrUnknown(data['long']!, _longMeta));
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MasterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MasterData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lat'])!,
      long: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}long'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
    );
  }

  @override
  $MasterTable createAlias(String alias) {
    return $MasterTable(attachedDatabase, alias);
  }
}

class MasterData extends DataClass implements Insertable<MasterData> {
  final int id;
  final String name;
  final String lat;
  final String long;
  final String address;
  const MasterData(
      {required this.id,
      required this.name,
      required this.lat,
      required this.long,
      required this.address});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['lat'] = Variable<String>(lat);
    map['long'] = Variable<String>(long);
    map['address'] = Variable<String>(address);
    return map;
  }

  MasterCompanion toCompanion(bool nullToAbsent) {
    return MasterCompanion(
      id: Value(id),
      name: Value(name),
      lat: Value(lat),
      long: Value(long),
      address: Value(address),
    );
  }

  factory MasterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MasterData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lat: serializer.fromJson<String>(json['lat']),
      long: serializer.fromJson<String>(json['long']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lat': serializer.toJson<String>(lat),
      'long': serializer.toJson<String>(long),
      'address': serializer.toJson<String>(address),
    };
  }

  MasterData copyWith(
          {int? id,
          String? name,
          String? lat,
          String? long,
          String? address}) =>
      MasterData(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        address: address ?? this.address,
      );
  MasterData copyWithCompanion(MasterCompanion data) {
    return MasterData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lat: data.lat.present ? data.lat.value : this.lat,
      long: data.long.present ? data.long.value : this.long,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MasterData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lat, long, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MasterData &&
          other.id == this.id &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.address == this.address);
}

class MasterCompanion extends UpdateCompanion<MasterData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> lat;
  final Value<String> long;
  final Value<String> address;
  const MasterCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.address = const Value.absent(),
  });
  MasterCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String lat,
    required String long,
    required String address,
  })  : name = Value(name),
        lat = Value(lat),
        long = Value(long),
        address = Value(address);
  static Insertable<MasterData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? lat,
    Expression<String>? long,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (address != null) 'address': address,
    });
  }

  MasterCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? lat,
      Value<String>? long,
      Value<String>? address}) {
    return MasterCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (long.present) {
      map['long'] = Variable<String>(long.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MasterCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTable extends Attendance
    with TableInfo<$AttendanceTable, AttendanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMasterMeta =
      const VerificationMeta('idMaster');
  @override
  late final GeneratedColumn<int> idMaster = GeneratedColumn<int>(
      'id_master', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES master (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<String> lat = GeneratedColumn<String>(
      'lat', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<String> long = GeneratedColumn<String>(
      'long', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idMaster, name, lat, long, address, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance';
  @override
  VerificationContext validateIntegrity(Insertable<AttendanceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_master')) {
      context.handle(_idMasterMeta,
          idMaster.isAcceptableOrUnknown(data['id_master']!, _idMasterMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
          _longMeta, long.isAcceptableOrUnknown(data['long']!, _longMeta));
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idMaster: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_master']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lat'])!,
      long: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}long'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AttendanceTable createAlias(String alias) {
    return $AttendanceTable(attachedDatabase, alias);
  }
}

class AttendanceData extends DataClass implements Insertable<AttendanceData> {
  final int id;
  final int? idMaster;
  final String name;
  final String lat;
  final String long;
  final String address;
  final DateTime createdAt;
  const AttendanceData(
      {required this.id,
      this.idMaster,
      required this.name,
      required this.lat,
      required this.long,
      required this.address,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idMaster != null) {
      map['id_master'] = Variable<int>(idMaster);
    }
    map['name'] = Variable<String>(name);
    map['lat'] = Variable<String>(lat);
    map['long'] = Variable<String>(long);
    map['address'] = Variable<String>(address);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttendanceCompanion toCompanion(bool nullToAbsent) {
    return AttendanceCompanion(
      id: Value(id),
      idMaster: idMaster == null && nullToAbsent
          ? const Value.absent()
          : Value(idMaster),
      name: Value(name),
      lat: Value(lat),
      long: Value(long),
      address: Value(address),
      createdAt: Value(createdAt),
    );
  }

  factory AttendanceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceData(
      id: serializer.fromJson<int>(json['id']),
      idMaster: serializer.fromJson<int?>(json['idMaster']),
      name: serializer.fromJson<String>(json['name']),
      lat: serializer.fromJson<String>(json['lat']),
      long: serializer.fromJson<String>(json['long']),
      address: serializer.fromJson<String>(json['address']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idMaster': serializer.toJson<int?>(idMaster),
      'name': serializer.toJson<String>(name),
      'lat': serializer.toJson<String>(lat),
      'long': serializer.toJson<String>(long),
      'address': serializer.toJson<String>(address),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AttendanceData copyWith(
          {int? id,
          Value<int?> idMaster = const Value.absent(),
          String? name,
          String? lat,
          String? long,
          String? address,
          DateTime? createdAt}) =>
      AttendanceData(
        id: id ?? this.id,
        idMaster: idMaster.present ? idMaster.value : this.idMaster,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        address: address ?? this.address,
        createdAt: createdAt ?? this.createdAt,
      );
  AttendanceData copyWithCompanion(AttendanceCompanion data) {
    return AttendanceData(
      id: data.id.present ? data.id.value : this.id,
      idMaster: data.idMaster.present ? data.idMaster.value : this.idMaster,
      name: data.name.present ? data.name.value : this.name,
      lat: data.lat.present ? data.lat.value : this.lat,
      long: data.long.present ? data.long.value : this.long,
      address: data.address.present ? data.address.value : this.address,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceData(')
          ..write('id: $id, ')
          ..write('idMaster: $idMaster, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idMaster, name, lat, long, address, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceData &&
          other.id == this.id &&
          other.idMaster == this.idMaster &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.address == this.address &&
          other.createdAt == this.createdAt);
}

class AttendanceCompanion extends UpdateCompanion<AttendanceData> {
  final Value<int> id;
  final Value<int?> idMaster;
  final Value<String> name;
  final Value<String> lat;
  final Value<String> long;
  final Value<String> address;
  final Value<DateTime> createdAt;
  const AttendanceCompanion({
    this.id = const Value.absent(),
    this.idMaster = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AttendanceCompanion.insert({
    this.id = const Value.absent(),
    this.idMaster = const Value.absent(),
    required String name,
    required String lat,
    required String long,
    required String address,
    required DateTime createdAt,
  })  : name = Value(name),
        lat = Value(lat),
        long = Value(long),
        address = Value(address),
        createdAt = Value(createdAt);
  static Insertable<AttendanceData> custom({
    Expression<int>? id,
    Expression<int>? idMaster,
    Expression<String>? name,
    Expression<String>? lat,
    Expression<String>? long,
    Expression<String>? address,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idMaster != null) 'id_master': idMaster,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (address != null) 'address': address,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AttendanceCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idMaster,
      Value<String>? name,
      Value<String>? lat,
      Value<String>? long,
      Value<String>? address,
      Value<DateTime>? createdAt}) {
    return AttendanceCompanion(
      id: id ?? this.id,
      idMaster: idMaster ?? this.idMaster,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idMaster.present) {
      map['id_master'] = Variable<int>(idMaster.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (long.present) {
      map['long'] = Variable<String>(long.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceCompanion(')
          ..write('id: $id, ')
          ..write('idMaster: $idMaster, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MasterTable master = $MasterTable(this);
  late final $AttendanceTable attendance = $AttendanceTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [master, attendance];
}

typedef $$MasterTableCreateCompanionBuilder = MasterCompanion Function({
  Value<int> id,
  required String name,
  required String lat,
  required String long,
  required String address,
});
typedef $$MasterTableUpdateCompanionBuilder = MasterCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> lat,
  Value<String> long,
  Value<String> address,
});

class $$MasterTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MasterTable,
    MasterData,
    $$MasterTableFilterComposer,
    $$MasterTableOrderingComposer,
    $$MasterTableCreateCompanionBuilder,
    $$MasterTableUpdateCompanionBuilder> {
  $$MasterTableTableManager(_$AppDatabase db, $MasterTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MasterTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MasterTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> lat = const Value.absent(),
            Value<String> long = const Value.absent(),
            Value<String> address = const Value.absent(),
          }) =>
              MasterCompanion(
            id: id,
            name: name,
            lat: lat,
            long: long,
            address: address,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String lat,
            required String long,
            required String address,
          }) =>
              MasterCompanion.insert(
            id: id,
            name: name,
            lat: lat,
            long: long,
            address: address,
          ),
        ));
}

class $$MasterTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MasterTable> {
  $$MasterTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lat => $state.composableBuilder(
      column: $state.table.lat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get long => $state.composableBuilder(
      column: $state.table.long,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter attendanceRefs(
      ComposableFilter Function($$AttendanceTableFilterComposer f) f) {
    final $$AttendanceTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.attendance,
        getReferencedColumn: (t) => t.idMaster,
        builder: (joinBuilder, parentComposers) =>
            $$AttendanceTableFilterComposer(ComposerState($state.db,
                $state.db.attendance, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$MasterTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MasterTable> {
  $$MasterTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lat => $state.composableBuilder(
      column: $state.table.lat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get long => $state.composableBuilder(
      column: $state.table.long,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AttendanceTableCreateCompanionBuilder = AttendanceCompanion Function({
  Value<int> id,
  Value<int?> idMaster,
  required String name,
  required String lat,
  required String long,
  required String address,
  required DateTime createdAt,
});
typedef $$AttendanceTableUpdateCompanionBuilder = AttendanceCompanion Function({
  Value<int> id,
  Value<int?> idMaster,
  Value<String> name,
  Value<String> lat,
  Value<String> long,
  Value<String> address,
  Value<DateTime> createdAt,
});

class $$AttendanceTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttendanceTable,
    AttendanceData,
    $$AttendanceTableFilterComposer,
    $$AttendanceTableOrderingComposer,
    $$AttendanceTableCreateCompanionBuilder,
    $$AttendanceTableUpdateCompanionBuilder> {
  $$AttendanceTableTableManager(_$AppDatabase db, $AttendanceTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AttendanceTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AttendanceTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> idMaster = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> lat = const Value.absent(),
            Value<String> long = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              AttendanceCompanion(
            id: id,
            idMaster: idMaster,
            name: name,
            lat: lat,
            long: long,
            address: address,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> idMaster = const Value.absent(),
            required String name,
            required String lat,
            required String long,
            required String address,
            required DateTime createdAt,
          }) =>
              AttendanceCompanion.insert(
            id: id,
            idMaster: idMaster,
            name: name,
            lat: lat,
            long: long,
            address: address,
            createdAt: createdAt,
          ),
        ));
}

class $$AttendanceTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AttendanceTable> {
  $$AttendanceTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lat => $state.composableBuilder(
      column: $state.table.lat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get long => $state.composableBuilder(
      column: $state.table.long,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$MasterTableFilterComposer get idMaster {
    final $$MasterTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMaster,
        referencedTable: $state.db.master,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$MasterTableFilterComposer(
            ComposerState(
                $state.db, $state.db.master, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AttendanceTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AttendanceTable> {
  $$AttendanceTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lat => $state.composableBuilder(
      column: $state.table.lat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get long => $state.composableBuilder(
      column: $state.table.long,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$MasterTableOrderingComposer get idMaster {
    final $$MasterTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.idMaster,
        referencedTable: $state.db.master,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MasterTableOrderingComposer(ComposerState(
                $state.db, $state.db.master, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MasterTableTableManager get master =>
      $$MasterTableTableManager(_db, _db.master);
  $$AttendanceTableTableManager get attendance =>
      $$AttendanceTableTableManager(_db, _db.attendance);
}
