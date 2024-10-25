// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MarketEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SymbolListResponseModel> list)
        updateListOfSymbol,
    required TResult Function(LoadingStatuses status) updateScreenStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SymbolListResponseModel> list)? updateListOfSymbol,
    TResult? Function(LoadingStatuses status)? updateScreenStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SymbolListResponseModel> list)? updateListOfSymbol,
    TResult Function(LoadingStatuses status)? updateScreenStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateListOfSymbol value) updateListOfSymbol,
    required TResult Function(_UpdateScreenStatus value) updateScreenStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateListOfSymbol value)? updateListOfSymbol,
    TResult? Function(_UpdateScreenStatus value)? updateScreenStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateListOfSymbol value)? updateListOfSymbol,
    TResult Function(_UpdateScreenStatus value)? updateScreenStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketEventCopyWith<$Res> {
  factory $MarketEventCopyWith(
          MarketEvent value, $Res Function(MarketEvent) then) =
      _$MarketEventCopyWithImpl<$Res, MarketEvent>;
}

/// @nodoc
class _$MarketEventCopyWithImpl<$Res, $Val extends MarketEvent>
    implements $MarketEventCopyWith<$Res> {
  _$MarketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateListOfSymbolImplCopyWith<$Res> {
  factory _$$UpdateListOfSymbolImplCopyWith(_$UpdateListOfSymbolImpl value,
          $Res Function(_$UpdateListOfSymbolImpl) then) =
      __$$UpdateListOfSymbolImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SymbolListResponseModel> list});
}

/// @nodoc
class __$$UpdateListOfSymbolImplCopyWithImpl<$Res>
    extends _$MarketEventCopyWithImpl<$Res, _$UpdateListOfSymbolImpl>
    implements _$$UpdateListOfSymbolImplCopyWith<$Res> {
  __$$UpdateListOfSymbolImplCopyWithImpl(_$UpdateListOfSymbolImpl _value,
      $Res Function(_$UpdateListOfSymbolImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$UpdateListOfSymbolImpl(
      null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SymbolListResponseModel>,
    ));
  }
}

/// @nodoc

class _$UpdateListOfSymbolImpl implements _UpdateListOfSymbol {
  const _$UpdateListOfSymbolImpl(final List<SymbolListResponseModel> list)
      : _list = list;

  final List<SymbolListResponseModel> _list;
  @override
  List<SymbolListResponseModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'MarketEvent.updateListOfSymbol(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateListOfSymbolImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of MarketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateListOfSymbolImplCopyWith<_$UpdateListOfSymbolImpl> get copyWith =>
      __$$UpdateListOfSymbolImplCopyWithImpl<_$UpdateListOfSymbolImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SymbolListResponseModel> list)
        updateListOfSymbol,
    required TResult Function(LoadingStatuses status) updateScreenStatus,
  }) {
    return updateListOfSymbol(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SymbolListResponseModel> list)? updateListOfSymbol,
    TResult? Function(LoadingStatuses status)? updateScreenStatus,
  }) {
    return updateListOfSymbol?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SymbolListResponseModel> list)? updateListOfSymbol,
    TResult Function(LoadingStatuses status)? updateScreenStatus,
    required TResult orElse(),
  }) {
    if (updateListOfSymbol != null) {
      return updateListOfSymbol(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateListOfSymbol value) updateListOfSymbol,
    required TResult Function(_UpdateScreenStatus value) updateScreenStatus,
  }) {
    return updateListOfSymbol(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateListOfSymbol value)? updateListOfSymbol,
    TResult? Function(_UpdateScreenStatus value)? updateScreenStatus,
  }) {
    return updateListOfSymbol?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateListOfSymbol value)? updateListOfSymbol,
    TResult Function(_UpdateScreenStatus value)? updateScreenStatus,
    required TResult orElse(),
  }) {
    if (updateListOfSymbol != null) {
      return updateListOfSymbol(this);
    }
    return orElse();
  }
}

abstract class _UpdateListOfSymbol implements MarketEvent {
  const factory _UpdateListOfSymbol(final List<SymbolListResponseModel> list) =
      _$UpdateListOfSymbolImpl;

  List<SymbolListResponseModel> get list;

  /// Create a copy of MarketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateListOfSymbolImplCopyWith<_$UpdateListOfSymbolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateScreenStatusImplCopyWith<$Res> {
  factory _$$UpdateScreenStatusImplCopyWith(_$UpdateScreenStatusImpl value,
          $Res Function(_$UpdateScreenStatusImpl) then) =
      __$$UpdateScreenStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoadingStatuses status});
}

/// @nodoc
class __$$UpdateScreenStatusImplCopyWithImpl<$Res>
    extends _$MarketEventCopyWithImpl<$Res, _$UpdateScreenStatusImpl>
    implements _$$UpdateScreenStatusImplCopyWith<$Res> {
  __$$UpdateScreenStatusImplCopyWithImpl(_$UpdateScreenStatusImpl _value,
      $Res Function(_$UpdateScreenStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$UpdateScreenStatusImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatuses,
    ));
  }
}

/// @nodoc

class _$UpdateScreenStatusImpl implements _UpdateScreenStatus {
  const _$UpdateScreenStatusImpl(this.status);

  @override
  final LoadingStatuses status;

  @override
  String toString() {
    return 'MarketEvent.updateScreenStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateScreenStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of MarketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateScreenStatusImplCopyWith<_$UpdateScreenStatusImpl> get copyWith =>
      __$$UpdateScreenStatusImplCopyWithImpl<_$UpdateScreenStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SymbolListResponseModel> list)
        updateListOfSymbol,
    required TResult Function(LoadingStatuses status) updateScreenStatus,
  }) {
    return updateScreenStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SymbolListResponseModel> list)? updateListOfSymbol,
    TResult? Function(LoadingStatuses status)? updateScreenStatus,
  }) {
    return updateScreenStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SymbolListResponseModel> list)? updateListOfSymbol,
    TResult Function(LoadingStatuses status)? updateScreenStatus,
    required TResult orElse(),
  }) {
    if (updateScreenStatus != null) {
      return updateScreenStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateListOfSymbol value) updateListOfSymbol,
    required TResult Function(_UpdateScreenStatus value) updateScreenStatus,
  }) {
    return updateScreenStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateListOfSymbol value)? updateListOfSymbol,
    TResult? Function(_UpdateScreenStatus value)? updateScreenStatus,
  }) {
    return updateScreenStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateListOfSymbol value)? updateListOfSymbol,
    TResult Function(_UpdateScreenStatus value)? updateScreenStatus,
    required TResult orElse(),
  }) {
    if (updateScreenStatus != null) {
      return updateScreenStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateScreenStatus implements MarketEvent {
  const factory _UpdateScreenStatus(final LoadingStatuses status) =
      _$UpdateScreenStatusImpl;

  LoadingStatuses get status;

  /// Create a copy of MarketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateScreenStatusImplCopyWith<_$UpdateScreenStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MarketState {
  List<SymbolListResponseModel> get allSymbolList =>
      throw _privateConstructorUsedError;
  LoadingStatuses get loadingStatus => throw _privateConstructorUsedError;

  /// Create a copy of MarketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketStateCopyWith<MarketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketStateCopyWith<$Res> {
  factory $MarketStateCopyWith(
          MarketState value, $Res Function(MarketState) then) =
      _$MarketStateCopyWithImpl<$Res, MarketState>;
  @useResult
  $Res call(
      {List<SymbolListResponseModel> allSymbolList,
      LoadingStatuses loadingStatus});
}

/// @nodoc
class _$MarketStateCopyWithImpl<$Res, $Val extends MarketState>
    implements $MarketStateCopyWith<$Res> {
  _$MarketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSymbolList = null,
    Object? loadingStatus = null,
  }) {
    return _then(_value.copyWith(
      allSymbolList: null == allSymbolList
          ? _value.allSymbolList
          : allSymbolList // ignore: cast_nullable_to_non_nullable
              as List<SymbolListResponseModel>,
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatuses,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketStateImplCopyWith<$Res>
    implements $MarketStateCopyWith<$Res> {
  factory _$$MarketStateImplCopyWith(
          _$MarketStateImpl value, $Res Function(_$MarketStateImpl) then) =
      __$$MarketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SymbolListResponseModel> allSymbolList,
      LoadingStatuses loadingStatus});
}

/// @nodoc
class __$$MarketStateImplCopyWithImpl<$Res>
    extends _$MarketStateCopyWithImpl<$Res, _$MarketStateImpl>
    implements _$$MarketStateImplCopyWith<$Res> {
  __$$MarketStateImplCopyWithImpl(
      _$MarketStateImpl _value, $Res Function(_$MarketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSymbolList = null,
    Object? loadingStatus = null,
  }) {
    return _then(_$MarketStateImpl(
      allSymbolList: null == allSymbolList
          ? _value._allSymbolList
          : allSymbolList // ignore: cast_nullable_to_non_nullable
              as List<SymbolListResponseModel>,
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatuses,
    ));
  }
}

/// @nodoc

class _$MarketStateImpl implements _MarketState {
  const _$MarketStateImpl(
      {final List<SymbolListResponseModel> allSymbolList = const [],
      this.loadingStatus = LoadingStatuses.idl})
      : _allSymbolList = allSymbolList;

  final List<SymbolListResponseModel> _allSymbolList;
  @override
  @JsonKey()
  List<SymbolListResponseModel> get allSymbolList {
    if (_allSymbolList is EqualUnmodifiableListView) return _allSymbolList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allSymbolList);
  }

  @override
  @JsonKey()
  final LoadingStatuses loadingStatus;

  @override
  String toString() {
    return 'MarketState(allSymbolList: $allSymbolList, loadingStatus: $loadingStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allSymbolList, _allSymbolList) &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_allSymbolList), loadingStatus);

  /// Create a copy of MarketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketStateImplCopyWith<_$MarketStateImpl> get copyWith =>
      __$$MarketStateImplCopyWithImpl<_$MarketStateImpl>(this, _$identity);
}

abstract class _MarketState implements MarketState {
  const factory _MarketState(
      {final List<SymbolListResponseModel> allSymbolList,
      final LoadingStatuses loadingStatus}) = _$MarketStateImpl;

  @override
  List<SymbolListResponseModel> get allSymbolList;
  @override
  LoadingStatuses get loadingStatus;

  /// Create a copy of MarketState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketStateImplCopyWith<_$MarketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
