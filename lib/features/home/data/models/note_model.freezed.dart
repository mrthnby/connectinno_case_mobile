// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoteModel {

 String get uid; set uid(String value); String get title; set title(String value); String get content; set content(String value);@Property(type: PropertyType.date) DateTime get createdAt;@Property(type: PropertyType.date) set createdAt(DateTime value);@Property(type: PropertyType.date) DateTime get updatedAt;@Property(type: PropertyType.date) set updatedAt(DateTime value);@JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true) int? get localId;@JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true) set localId(int? value);
/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteModelCopyWith<NoteModel> get copyWith => _$NoteModelCopyWithImpl<NoteModel>(this as NoteModel, _$identity);

  /// Serializes this NoteModel to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'NoteModel(uid: $uid, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, localId: $localId)';
}


}

/// @nodoc
abstract mixin class $NoteModelCopyWith<$Res>  {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) _then) = _$NoteModelCopyWithImpl;
@useResult
$Res call({
 String uid, String title, String content,@Property(type: PropertyType.date) DateTime createdAt,@Property(type: PropertyType.date) DateTime updatedAt,@JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true) int? localId
});




}
/// @nodoc
class _$NoteModelCopyWithImpl<$Res>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._self, this._then);

  final NoteModel _self;
  final $Res Function(NoteModel) _then;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? title = null,Object? content = null,Object? createdAt = null,Object? updatedAt = null,Object? localId = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteModel].
extension NoteModelPatterns on NoteModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteModel value)  $default,){
final _that = this;
switch (_that) {
case _NoteModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String title,  String content, @Property(type: PropertyType.date)  DateTime createdAt, @Property(type: PropertyType.date)  DateTime updatedAt, @JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true)  int? localId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that.uid,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.localId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String title,  String content, @Property(type: PropertyType.date)  DateTime createdAt, @Property(type: PropertyType.date)  DateTime updatedAt, @JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true)  int? localId)  $default,) {final _that = this;
switch (_that) {
case _NoteModel():
return $default(_that.uid,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.localId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String title,  String content, @Property(type: PropertyType.date)  DateTime createdAt, @Property(type: PropertyType.date)  DateTime updatedAt, @JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true)  int? localId)?  $default,) {final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that.uid,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.localId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@Entity(realClass: NoteModel)
class _NoteModel implements NoteModel {
   _NoteModel({required this.uid, required this.title, required this.content, @Property(type: PropertyType.date) required this.createdAt, @Property(type: PropertyType.date) required this.updatedAt, @JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true) this.localId});
  factory _NoteModel.fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

@override  String uid;
@override  String title;
@override  String content;
@override@Property(type: PropertyType.date)  DateTime createdAt;
@override@Property(type: PropertyType.date)  DateTime updatedAt;
@override@JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true)  int? localId;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteModelCopyWith<_NoteModel> get copyWith => __$NoteModelCopyWithImpl<_NoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoteModelToJson(this, );
}



@override
String toString() {
  return 'NoteModel(uid: $uid, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, localId: $localId)';
}


}

/// @nodoc
abstract mixin class _$NoteModelCopyWith<$Res> implements $NoteModelCopyWith<$Res> {
  factory _$NoteModelCopyWith(_NoteModel value, $Res Function(_NoteModel) _then) = __$NoteModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String title, String content,@Property(type: PropertyType.date) DateTime createdAt,@Property(type: PropertyType.date) DateTime updatedAt,@JsonKey(includeFromJson: false, includeToJson: false)@Id(assignable: true) int? localId
});




}
/// @nodoc
class __$NoteModelCopyWithImpl<$Res>
    implements _$NoteModelCopyWith<$Res> {
  __$NoteModelCopyWithImpl(this._self, this._then);

  final _NoteModel _self;
  final $Res Function(_NoteModel) _then;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? title = null,Object? content = null,Object? createdAt = null,Object? updatedAt = null,Object? localId = freezed,}) {
  return _then(_NoteModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
