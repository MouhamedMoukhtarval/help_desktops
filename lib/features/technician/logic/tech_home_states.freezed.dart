// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tech_home_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TechHomeStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TechHomeStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TechHomeStates()';
}


}

/// @nodoc
class $TechHomeStatesCopyWith<$Res>  {
$TechHomeStatesCopyWith(TechHomeStates _, $Res Function(TechHomeStates) __);
}


/// Adds pattern-matching-related methods to [TechHomeStates].
extension TechHomeStatesPatterns on TechHomeStates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Success value)?  success,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Success value)  success,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Success value)?  success,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TicketStartWorkResponse? ticketSWR,  List<TicketResponse?>? tickets,  String selectedStatus,  String selectedPriority,  DateTime? dateFrom,  DateTime? dateTo)?  success,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.ticketSWR,_that.tickets,_that.selectedStatus,_that.selectedPriority,_that.dateFrom,_that.dateTo);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TicketStartWorkResponse? ticketSWR,  List<TicketResponse?>? tickets,  String selectedStatus,  String selectedPriority,  DateTime? dateFrom,  DateTime? dateTo)  success,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.ticketSWR,_that.tickets,_that.selectedStatus,_that.selectedPriority,_that.dateFrom,_that.dateTo);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TicketStartWorkResponse? ticketSWR,  List<TicketResponse?>? tickets,  String selectedStatus,  String selectedPriority,  DateTime? dateFrom,  DateTime? dateTo)?  success,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.ticketSWR,_that.tickets,_that.selectedStatus,_that.selectedPriority,_that.dateFrom,_that.dateTo);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements TechHomeStates {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TechHomeStates.initial()';
}


}




/// @nodoc


class Loading implements TechHomeStates {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TechHomeStates.loading()';
}


}




/// @nodoc


class Success implements TechHomeStates {
  const Success({this.ticketSWR, final  List<TicketResponse?>? tickets, this.selectedStatus = 'active', this.selectedPriority = 'all', this.dateFrom, this.dateTo}): _tickets = tickets;
  

 final  TicketStartWorkResponse? ticketSWR;
 final  List<TicketResponse?>? _tickets;
 List<TicketResponse?>? get tickets {
  final value = _tickets;
  if (value == null) return null;
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@JsonKey() final  String selectedStatus;
@JsonKey() final  String selectedPriority;
 final  DateTime? dateFrom;
 final  DateTime? dateTo;

/// Create a copy of TechHomeStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&(identical(other.ticketSWR, ticketSWR) || other.ticketSWR == ticketSWR)&&const DeepCollectionEquality().equals(other._tickets, _tickets)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.selectedPriority, selectedPriority) || other.selectedPriority == selectedPriority)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo));
}


@override
int get hashCode => Object.hash(runtimeType,ticketSWR,const DeepCollectionEquality().hash(_tickets),selectedStatus,selectedPriority,dateFrom,dateTo);

@override
String toString() {
  return 'TechHomeStates.success(ticketSWR: $ticketSWR, tickets: $tickets, selectedStatus: $selectedStatus, selectedPriority: $selectedPriority, dateFrom: $dateFrom, dateTo: $dateTo)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $TechHomeStatesCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 TicketStartWorkResponse? ticketSWR, List<TicketResponse?>? tickets, String selectedStatus, String selectedPriority, DateTime? dateFrom, DateTime? dateTo
});




}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of TechHomeStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ticketSWR = freezed,Object? tickets = freezed,Object? selectedStatus = null,Object? selectedPriority = null,Object? dateFrom = freezed,Object? dateTo = freezed,}) {
  return _then(Success(
ticketSWR: freezed == ticketSWR ? _self.ticketSWR : ticketSWR // ignore: cast_nullable_to_non_nullable
as TicketStartWorkResponse?,tickets: freezed == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<TicketResponse?>?,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String,selectedPriority: null == selectedPriority ? _self.selectedPriority : selectedPriority // ignore: cast_nullable_to_non_nullable
as String,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class Error implements TechHomeStates {
  const Error(this.message);
  

 final  String? message;

/// Create a copy of TechHomeStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TechHomeStates.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $TechHomeStatesCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of TechHomeStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(Error(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
