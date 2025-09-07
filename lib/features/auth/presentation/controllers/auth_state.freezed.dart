// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitialState value)?  initial,TResult Function( AuthLoadingState value)?  loading,TResult Function( AuthSuccessfullyLoggedInState value)?  successfullyLoggedIn,TResult Function( AuthResetPasswordSentState value)?  resetPasswordSent,TResult Function( AuthErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitialState() when initial != null:
return initial(_that);case AuthLoadingState() when loading != null:
return loading(_that);case AuthSuccessfullyLoggedInState() when successfullyLoggedIn != null:
return successfullyLoggedIn(_that);case AuthResetPasswordSentState() when resetPasswordSent != null:
return resetPasswordSent(_that);case AuthErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitialState value)  initial,required TResult Function( AuthLoadingState value)  loading,required TResult Function( AuthSuccessfullyLoggedInState value)  successfullyLoggedIn,required TResult Function( AuthResetPasswordSentState value)  resetPasswordSent,required TResult Function( AuthErrorState value)  error,}){
final _that = this;
switch (_that) {
case AuthInitialState():
return initial(_that);case AuthLoadingState():
return loading(_that);case AuthSuccessfullyLoggedInState():
return successfullyLoggedIn(_that);case AuthResetPasswordSentState():
return resetPasswordSent(_that);case AuthErrorState():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitialState value)?  initial,TResult? Function( AuthLoadingState value)?  loading,TResult? Function( AuthSuccessfullyLoggedInState value)?  successfullyLoggedIn,TResult? Function( AuthResetPasswordSentState value)?  resetPasswordSent,TResult? Function( AuthErrorState value)?  error,}){
final _that = this;
switch (_that) {
case AuthInitialState() when initial != null:
return initial(_that);case AuthLoadingState() when loading != null:
return loading(_that);case AuthSuccessfullyLoggedInState() when successfullyLoggedIn != null:
return successfullyLoggedIn(_that);case AuthResetPasswordSentState() when resetPasswordSent != null:
return resetPasswordSent(_that);case AuthErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  successfullyLoggedIn,TResult Function()?  resetPasswordSent,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitialState() when initial != null:
return initial();case AuthLoadingState() when loading != null:
return loading();case AuthSuccessfullyLoggedInState() when successfullyLoggedIn != null:
return successfullyLoggedIn();case AuthResetPasswordSentState() when resetPasswordSent != null:
return resetPasswordSent();case AuthErrorState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  successfullyLoggedIn,required TResult Function()  resetPasswordSent,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AuthInitialState():
return initial();case AuthLoadingState():
return loading();case AuthSuccessfullyLoggedInState():
return successfullyLoggedIn();case AuthResetPasswordSentState():
return resetPasswordSent();case AuthErrorState():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  successfullyLoggedIn,TResult? Function()?  resetPasswordSent,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AuthInitialState() when initial != null:
return initial();case AuthLoadingState() when loading != null:
return loading();case AuthSuccessfullyLoggedInState() when successfullyLoggedIn != null:
return successfullyLoggedIn();case AuthResetPasswordSentState() when resetPasswordSent != null:
return resetPasswordSent();case AuthErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitialState implements AuthState {
  const AuthInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoadingState implements AuthState {
  const AuthLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthSuccessfullyLoggedInState implements AuthState {
  const AuthSuccessfullyLoggedInState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSuccessfullyLoggedInState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.successfullyLoggedIn()';
}


}




/// @nodoc


class AuthResetPasswordSentState implements AuthState {
  const AuthResetPasswordSentState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResetPasswordSentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.resetPasswordSent()';
}


}




/// @nodoc


class AuthErrorState implements AuthState {
  const AuthErrorState({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorStateCopyWith<AuthErrorState> get copyWith => _$AuthErrorStateCopyWithImpl<AuthErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthErrorStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorStateCopyWith(AuthErrorState value, $Res Function(AuthErrorState) _then) = _$AuthErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthErrorStateCopyWithImpl<$Res>
    implements $AuthErrorStateCopyWith<$Res> {
  _$AuthErrorStateCopyWithImpl(this._self, this._then);

  final AuthErrorState _self;
  final $Res Function(AuthErrorState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
