// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {

 String get email;
/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventCopyWith<AuthEvent> get copyWith => _$AuthEventCopyWithImpl<AuthEvent>(this as AuthEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthEventCopyWith<$Res>  {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) _then) = _$AuthEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthEventCopyWithImpl<$Res>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._self, this._then);

  final AuthEvent _self;
  final $Res Function(AuthEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthLoginEvent value)?  login,TResult Function( AuthRegisterEvent value)?  register,TResult Function( AuthSendResetLinkEvent value)?  sendResetLink,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthLoginEvent() when login != null:
return login(_that);case AuthRegisterEvent() when register != null:
return register(_that);case AuthSendResetLinkEvent() when sendResetLink != null:
return sendResetLink(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthLoginEvent value)  login,required TResult Function( AuthRegisterEvent value)  register,required TResult Function( AuthSendResetLinkEvent value)  sendResetLink,}){
final _that = this;
switch (_that) {
case AuthLoginEvent():
return login(_that);case AuthRegisterEvent():
return register(_that);case AuthSendResetLinkEvent():
return sendResetLink(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthLoginEvent value)?  login,TResult? Function( AuthRegisterEvent value)?  register,TResult? Function( AuthSendResetLinkEvent value)?  sendResetLink,}){
final _that = this;
switch (_that) {
case AuthLoginEvent() when login != null:
return login(_that);case AuthRegisterEvent() when register != null:
return register(_that);case AuthSendResetLinkEvent() when sendResetLink != null:
return sendResetLink(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  login,TResult Function( String email,  String password,  String name,  String confirmPassword)?  register,TResult Function( String email)?  sendResetLink,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthLoginEvent() when login != null:
return login(_that.email,_that.password);case AuthRegisterEvent() when register != null:
return register(_that.email,_that.password,_that.name,_that.confirmPassword);case AuthSendResetLinkEvent() when sendResetLink != null:
return sendResetLink(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  login,required TResult Function( String email,  String password,  String name,  String confirmPassword)  register,required TResult Function( String email)  sendResetLink,}) {final _that = this;
switch (_that) {
case AuthLoginEvent():
return login(_that.email,_that.password);case AuthRegisterEvent():
return register(_that.email,_that.password,_that.name,_that.confirmPassword);case AuthSendResetLinkEvent():
return sendResetLink(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  login,TResult? Function( String email,  String password,  String name,  String confirmPassword)?  register,TResult? Function( String email)?  sendResetLink,}) {final _that = this;
switch (_that) {
case AuthLoginEvent() when login != null:
return login(_that.email,_that.password);case AuthRegisterEvent() when register != null:
return register(_that.email,_that.password,_that.name,_that.confirmPassword);case AuthSendResetLinkEvent() when sendResetLink != null:
return sendResetLink(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class AuthLoginEvent implements AuthEvent {
  const AuthLoginEvent({required this.email, required this.password});
  

@override final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginEventCopyWith<AuthLoginEvent> get copyWith => _$AuthLoginEventCopyWithImpl<AuthLoginEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.login(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthLoginEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthLoginEventCopyWith(AuthLoginEvent value, $Res Function(AuthLoginEvent) _then) = _$AuthLoginEventCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$AuthLoginEventCopyWithImpl<$Res>
    implements $AuthLoginEventCopyWith<$Res> {
  _$AuthLoginEventCopyWithImpl(this._self, this._then);

  final AuthLoginEvent _self;
  final $Res Function(AuthLoginEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(AuthLoginEvent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthRegisterEvent implements AuthEvent {
  const AuthRegisterEvent({required this.email, required this.password, required this.name, required this.confirmPassword});
  

@override final  String email;
 final  String password;
 final  String name;
 final  String confirmPassword;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRegisterEventCopyWith<AuthRegisterEvent> get copyWith => _$AuthRegisterEventCopyWithImpl<AuthRegisterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRegisterEvent&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,name,confirmPassword);

@override
String toString() {
  return 'AuthEvent.register(email: $email, password: $password, name: $name, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $AuthRegisterEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthRegisterEventCopyWith(AuthRegisterEvent value, $Res Function(AuthRegisterEvent) _then) = _$AuthRegisterEventCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String name, String confirmPassword
});




}
/// @nodoc
class _$AuthRegisterEventCopyWithImpl<$Res>
    implements $AuthRegisterEventCopyWith<$Res> {
  _$AuthRegisterEventCopyWithImpl(this._self, this._then);

  final AuthRegisterEvent _self;
  final $Res Function(AuthRegisterEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? name = null,Object? confirmPassword = null,}) {
  return _then(AuthRegisterEvent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthSendResetLinkEvent implements AuthEvent {
  const AuthSendResetLinkEvent({required this.email});
  

@override final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSendResetLinkEventCopyWith<AuthSendResetLinkEvent> get copyWith => _$AuthSendResetLinkEventCopyWithImpl<AuthSendResetLinkEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSendResetLinkEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.sendResetLink(email: $email)';
}


}

/// @nodoc
abstract mixin class $AuthSendResetLinkEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSendResetLinkEventCopyWith(AuthSendResetLinkEvent value, $Res Function(AuthSendResetLinkEvent) _then) = _$AuthSendResetLinkEventCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AuthSendResetLinkEventCopyWithImpl<$Res>
    implements $AuthSendResetLinkEventCopyWith<$Res> {
  _$AuthSendResetLinkEventCopyWithImpl(this._self, this._then);

  final AuthSendResetLinkEvent _self;
  final $Res Function(AuthSendResetLinkEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(AuthSendResetLinkEvent(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
