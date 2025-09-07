// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeGetNotesEvent value)?  getNotes,TResult Function( HomeCreateNoteEvent value)?  createNote,TResult Function( HomeUpdateNoteEvent value)?  updateNote,TResult Function( HomeDeleteNoteEvent value)?  deleteNote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeGetNotesEvent() when getNotes != null:
return getNotes(_that);case HomeCreateNoteEvent() when createNote != null:
return createNote(_that);case HomeUpdateNoteEvent() when updateNote != null:
return updateNote(_that);case HomeDeleteNoteEvent() when deleteNote != null:
return deleteNote(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeGetNotesEvent value)  getNotes,required TResult Function( HomeCreateNoteEvent value)  createNote,required TResult Function( HomeUpdateNoteEvent value)  updateNote,required TResult Function( HomeDeleteNoteEvent value)  deleteNote,}){
final _that = this;
switch (_that) {
case HomeGetNotesEvent():
return getNotes(_that);case HomeCreateNoteEvent():
return createNote(_that);case HomeUpdateNoteEvent():
return updateNote(_that);case HomeDeleteNoteEvent():
return deleteNote(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeGetNotesEvent value)?  getNotes,TResult? Function( HomeCreateNoteEvent value)?  createNote,TResult? Function( HomeUpdateNoteEvent value)?  updateNote,TResult? Function( HomeDeleteNoteEvent value)?  deleteNote,}){
final _that = this;
switch (_that) {
case HomeGetNotesEvent() when getNotes != null:
return getNotes(_that);case HomeCreateNoteEvent() when createNote != null:
return createNote(_that);case HomeUpdateNoteEvent() when updateNote != null:
return updateNote(_that);case HomeDeleteNoteEvent() when deleteNote != null:
return deleteNote(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getNotes,TResult Function( NoteEntity note)?  createNote,TResult Function( NoteEntity note)?  updateNote,TResult Function( NoteEntity note)?  deleteNote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeGetNotesEvent() when getNotes != null:
return getNotes();case HomeCreateNoteEvent() when createNote != null:
return createNote(_that.note);case HomeUpdateNoteEvent() when updateNote != null:
return updateNote(_that.note);case HomeDeleteNoteEvent() when deleteNote != null:
return deleteNote(_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getNotes,required TResult Function( NoteEntity note)  createNote,required TResult Function( NoteEntity note)  updateNote,required TResult Function( NoteEntity note)  deleteNote,}) {final _that = this;
switch (_that) {
case HomeGetNotesEvent():
return getNotes();case HomeCreateNoteEvent():
return createNote(_that.note);case HomeUpdateNoteEvent():
return updateNote(_that.note);case HomeDeleteNoteEvent():
return deleteNote(_that.note);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getNotes,TResult? Function( NoteEntity note)?  createNote,TResult? Function( NoteEntity note)?  updateNote,TResult? Function( NoteEntity note)?  deleteNote,}) {final _that = this;
switch (_that) {
case HomeGetNotesEvent() when getNotes != null:
return getNotes();case HomeCreateNoteEvent() when createNote != null:
return createNote(_that.note);case HomeUpdateNoteEvent() when updateNote != null:
return updateNote(_that.note);case HomeDeleteNoteEvent() when deleteNote != null:
return deleteNote(_that.note);case _:
  return null;

}
}

}

/// @nodoc


class HomeGetNotesEvent implements HomeEvent {
  const HomeGetNotesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeGetNotesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.getNotes()';
}


}




/// @nodoc


class HomeCreateNoteEvent implements HomeEvent {
  const HomeCreateNoteEvent(this.note);
  

 final  NoteEntity note;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCreateNoteEventCopyWith<HomeCreateNoteEvent> get copyWith => _$HomeCreateNoteEventCopyWithImpl<HomeCreateNoteEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCreateNoteEvent&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'HomeEvent.createNote(note: $note)';
}


}

/// @nodoc
abstract mixin class $HomeCreateNoteEventCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeCreateNoteEventCopyWith(HomeCreateNoteEvent value, $Res Function(HomeCreateNoteEvent) _then) = _$HomeCreateNoteEventCopyWithImpl;
@useResult
$Res call({
 NoteEntity note
});




}
/// @nodoc
class _$HomeCreateNoteEventCopyWithImpl<$Res>
    implements $HomeCreateNoteEventCopyWith<$Res> {
  _$HomeCreateNoteEventCopyWithImpl(this._self, this._then);

  final HomeCreateNoteEvent _self;
  final $Res Function(HomeCreateNoteEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(HomeCreateNoteEvent(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteEntity,
  ));
}


}

/// @nodoc


class HomeUpdateNoteEvent implements HomeEvent {
  const HomeUpdateNoteEvent(this.note);
  

 final  NoteEntity note;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUpdateNoteEventCopyWith<HomeUpdateNoteEvent> get copyWith => _$HomeUpdateNoteEventCopyWithImpl<HomeUpdateNoteEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUpdateNoteEvent&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'HomeEvent.updateNote(note: $note)';
}


}

/// @nodoc
abstract mixin class $HomeUpdateNoteEventCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeUpdateNoteEventCopyWith(HomeUpdateNoteEvent value, $Res Function(HomeUpdateNoteEvent) _then) = _$HomeUpdateNoteEventCopyWithImpl;
@useResult
$Res call({
 NoteEntity note
});




}
/// @nodoc
class _$HomeUpdateNoteEventCopyWithImpl<$Res>
    implements $HomeUpdateNoteEventCopyWith<$Res> {
  _$HomeUpdateNoteEventCopyWithImpl(this._self, this._then);

  final HomeUpdateNoteEvent _self;
  final $Res Function(HomeUpdateNoteEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(HomeUpdateNoteEvent(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteEntity,
  ));
}


}

/// @nodoc


class HomeDeleteNoteEvent implements HomeEvent {
  const HomeDeleteNoteEvent(this.note);
  

 final  NoteEntity note;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDeleteNoteEventCopyWith<HomeDeleteNoteEvent> get copyWith => _$HomeDeleteNoteEventCopyWithImpl<HomeDeleteNoteEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDeleteNoteEvent&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'HomeEvent.deleteNote(note: $note)';
}


}

/// @nodoc
abstract mixin class $HomeDeleteNoteEventCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeDeleteNoteEventCopyWith(HomeDeleteNoteEvent value, $Res Function(HomeDeleteNoteEvent) _then) = _$HomeDeleteNoteEventCopyWithImpl;
@useResult
$Res call({
 NoteEntity note
});




}
/// @nodoc
class _$HomeDeleteNoteEventCopyWithImpl<$Res>
    implements $HomeDeleteNoteEventCopyWith<$Res> {
  _$HomeDeleteNoteEventCopyWithImpl(this._self, this._then);

  final HomeDeleteNoteEvent _self;
  final $Res Function(HomeDeleteNoteEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(HomeDeleteNoteEvent(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteEntity,
  ));
}


}

// dart format on
