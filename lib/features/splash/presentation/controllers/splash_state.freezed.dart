// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplashInitialState value)?  initial,TResult Function( SplashUserIDFoundState value)?  userIDFound,TResult Function( SplashUserIDNotFoundState value)?  userIDNotFound,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplashInitialState() when initial != null:
return initial(_that);case SplashUserIDFoundState() when userIDFound != null:
return userIDFound(_that);case SplashUserIDNotFoundState() when userIDNotFound != null:
return userIDNotFound(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplashInitialState value)  initial,required TResult Function( SplashUserIDFoundState value)  userIDFound,required TResult Function( SplashUserIDNotFoundState value)  userIDNotFound,}){
final _that = this;
switch (_that) {
case SplashInitialState():
return initial(_that);case SplashUserIDFoundState():
return userIDFound(_that);case SplashUserIDNotFoundState():
return userIDNotFound(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplashInitialState value)?  initial,TResult? Function( SplashUserIDFoundState value)?  userIDFound,TResult? Function( SplashUserIDNotFoundState value)?  userIDNotFound,}){
final _that = this;
switch (_that) {
case SplashInitialState() when initial != null:
return initial(_that);case SplashUserIDFoundState() when userIDFound != null:
return userIDFound(_that);case SplashUserIDNotFoundState() when userIDNotFound != null:
return userIDNotFound(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String userID)?  userIDFound,TResult Function()?  userIDNotFound,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SplashInitialState() when initial != null:
return initial();case SplashUserIDFoundState() when userIDFound != null:
return userIDFound(_that.userID);case SplashUserIDNotFoundState() when userIDNotFound != null:
return userIDNotFound();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String userID)  userIDFound,required TResult Function()  userIDNotFound,}) {final _that = this;
switch (_that) {
case SplashInitialState():
return initial();case SplashUserIDFoundState():
return userIDFound(_that.userID);case SplashUserIDNotFoundState():
return userIDNotFound();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String userID)?  userIDFound,TResult? Function()?  userIDNotFound,}) {final _that = this;
switch (_that) {
case SplashInitialState() when initial != null:
return initial();case SplashUserIDFoundState() when userIDFound != null:
return userIDFound(_that.userID);case SplashUserIDNotFoundState() when userIDNotFound != null:
return userIDNotFound();case _:
  return null;

}
}

}

/// @nodoc


class SplashInitialState implements SplashState {
  const SplashInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initial()';
}


}




/// @nodoc


class SplashUserIDFoundState implements SplashState {
  const SplashUserIDFoundState({required this.userID});
  

 final  String userID;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashUserIDFoundStateCopyWith<SplashUserIDFoundState> get copyWith => _$SplashUserIDFoundStateCopyWithImpl<SplashUserIDFoundState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashUserIDFoundState&&(identical(other.userID, userID) || other.userID == userID));
}


@override
int get hashCode => Object.hash(runtimeType,userID);

@override
String toString() {
  return 'SplashState.userIDFound(userID: $userID)';
}


}

/// @nodoc
abstract mixin class $SplashUserIDFoundStateCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory $SplashUserIDFoundStateCopyWith(SplashUserIDFoundState value, $Res Function(SplashUserIDFoundState) _then) = _$SplashUserIDFoundStateCopyWithImpl;
@useResult
$Res call({
 String userID
});




}
/// @nodoc
class _$SplashUserIDFoundStateCopyWithImpl<$Res>
    implements $SplashUserIDFoundStateCopyWith<$Res> {
  _$SplashUserIDFoundStateCopyWithImpl(this._self, this._then);

  final SplashUserIDFoundState _self;
  final $Res Function(SplashUserIDFoundState) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userID = null,}) {
  return _then(SplashUserIDFoundState(
userID: null == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SplashUserIDNotFoundState implements SplashState {
  const SplashUserIDNotFoundState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashUserIDNotFoundState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.userIDNotFound()';
}


}




// dart format on
