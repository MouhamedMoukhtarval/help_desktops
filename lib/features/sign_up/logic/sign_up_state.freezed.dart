// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpState<$T>()';
}


}

/// @nodoc
class $SignUpStateCopyWith<T,$Res>  {
$SignUpStateCopyWith(SignUpState<T> _, $Res Function(SignUpState<T>) __);
}


/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns<T> on SignUpState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( SignupLoading<T> value)?  sginupLoading,TResult Function( SignupSuccess<T> value)?  sginupSuccess,TResult Function( SginupError<T> value)?  sginupError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SignupLoading() when sginupLoading != null:
return sginupLoading(_that);case SignupSuccess() when sginupSuccess != null:
return sginupSuccess(_that);case SginupError() when sginupError != null:
return sginupError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( SignupLoading<T> value)  sginupLoading,required TResult Function( SignupSuccess<T> value)  sginupSuccess,required TResult Function( SginupError<T> value)  sginupError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SignupLoading():
return sginupLoading(_that);case SignupSuccess():
return sginupSuccess(_that);case SginupError():
return sginupError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( SignupLoading<T> value)?  sginupLoading,TResult? Function( SignupSuccess<T> value)?  sginupSuccess,TResult? Function( SginupError<T> value)?  sginupError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SignupLoading() when sginupLoading != null:
return sginupLoading(_that);case SignupSuccess() when sginupSuccess != null:
return sginupSuccess(_that);case SginupError() when sginupError != null:
return sginupError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sginupLoading,TResult Function( SignUpResponseBody signupRB)?  sginupSuccess,TResult Function( String apiErrorsModel)?  sginupError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SignupLoading() when sginupLoading != null:
return sginupLoading();case SignupSuccess() when sginupSuccess != null:
return sginupSuccess(_that.signupRB);case SginupError() when sginupError != null:
return sginupError(_that.apiErrorsModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sginupLoading,required TResult Function( SignUpResponseBody signupRB)  sginupSuccess,required TResult Function( String apiErrorsModel)  sginupError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SignupLoading():
return sginupLoading();case SignupSuccess():
return sginupSuccess(_that.signupRB);case SginupError():
return sginupError(_that.apiErrorsModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sginupLoading,TResult? Function( SignUpResponseBody signupRB)?  sginupSuccess,TResult? Function( String apiErrorsModel)?  sginupError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SignupLoading() when sginupLoading != null:
return sginupLoading();case SignupSuccess() when sginupSuccess != null:
return sginupSuccess(_that.signupRB);case SginupError() when sginupError != null:
return sginupError(_that.apiErrorsModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements SignUpState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpState<$T>.initial()';
}


}




/// @nodoc


class SignupLoading<T> implements SignUpState<T> {
  const SignupLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpState<$T>.sginupLoading()';
}


}




/// @nodoc


class SignupSuccess<T> implements SignUpState<T> {
  const SignupSuccess(this.signupRB);
  

 final  SignUpResponseBody signupRB;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupSuccessCopyWith<T, SignupSuccess<T>> get copyWith => _$SignupSuccessCopyWithImpl<T, SignupSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupSuccess<T>&&(identical(other.signupRB, signupRB) || other.signupRB == signupRB));
}


@override
int get hashCode => Object.hash(runtimeType,signupRB);

@override
String toString() {
  return 'SignUpState<$T>.sginupSuccess(signupRB: $signupRB)';
}


}

/// @nodoc
abstract mixin class $SignupSuccessCopyWith<T,$Res> implements $SignUpStateCopyWith<T, $Res> {
  factory $SignupSuccessCopyWith(SignupSuccess<T> value, $Res Function(SignupSuccess<T>) _then) = _$SignupSuccessCopyWithImpl;
@useResult
$Res call({
 SignUpResponseBody signupRB
});




}
/// @nodoc
class _$SignupSuccessCopyWithImpl<T,$Res>
    implements $SignupSuccessCopyWith<T, $Res> {
  _$SignupSuccessCopyWithImpl(this._self, this._then);

  final SignupSuccess<T> _self;
  final $Res Function(SignupSuccess<T>) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? signupRB = null,}) {
  return _then(SignupSuccess<T>(
null == signupRB ? _self.signupRB : signupRB // ignore: cast_nullable_to_non_nullable
as SignUpResponseBody,
  ));
}


}

/// @nodoc


class SginupError<T> implements SignUpState<T> {
  const SginupError(this.apiErrorsModel);
  

 final  String apiErrorsModel;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SginupErrorCopyWith<T, SginupError<T>> get copyWith => _$SginupErrorCopyWithImpl<T, SginupError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SginupError<T>&&(identical(other.apiErrorsModel, apiErrorsModel) || other.apiErrorsModel == apiErrorsModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorsModel);

@override
String toString() {
  return 'SignUpState<$T>.sginupError(apiErrorsModel: $apiErrorsModel)';
}


}

/// @nodoc
abstract mixin class $SginupErrorCopyWith<T,$Res> implements $SignUpStateCopyWith<T, $Res> {
  factory $SginupErrorCopyWith(SginupError<T> value, $Res Function(SginupError<T>) _then) = _$SginupErrorCopyWithImpl;
@useResult
$Res call({
 String apiErrorsModel
});




}
/// @nodoc
class _$SginupErrorCopyWithImpl<T,$Res>
    implements $SginupErrorCopyWith<T, $Res> {
  _$SginupErrorCopyWithImpl(this._self, this._then);

  final SginupError<T> _self;
  final $Res Function(SginupError<T>) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorsModel = null,}) {
  return _then(SginupError<T>(
null == apiErrorsModel ? _self.apiErrorsModel : apiErrorsModel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
