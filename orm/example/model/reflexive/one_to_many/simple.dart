library example.has_one;

import 'dart:async';
import 'package:jaguar_query/jaguar_query.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query_postgres/jaguar_query_postgres.dart';

part 'simple.jorm.dart';

class Directory {
  @PrimaryKey(length: 50)
  String id;

  @Column(length: 50)
  String name;

  @HasMany(DirectoryBean)
  List<Directory> child;

  @BelongsTo(DirectoryBean)
  String parentId;
}

@GenBean()
class DirectoryBean extends Bean<Directory> with _DirectoryBean {
  DirectoryBean get directoryBean => this;
  DirectoryBean(Adapter adapter) : super(adapter);

  String get tableName => 'directory';
}
