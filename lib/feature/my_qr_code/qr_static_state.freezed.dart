// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_static_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QRStaticState {
  List<QRStatic> get qrStatic => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QRStaticStateCopyWith<QRStaticState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRStaticStateCopyWith<$Res> {
  factory $QRStaticStateCopyWith(
          QRStaticState value, $Res Function(QRStaticState) then) =
      _$QRStaticStateCopyWithImpl<$Res, QRStaticState>;
  @useResult
  $Res call({List<QRStatic> qrStatic, bool isLoading});
}

/// @nodoc
class _$QRStaticStateCopyWithImpl<$Res, $Val extends QRStaticState>
    implements $QRStaticStateCopyWith<$Res> {
  _$QRStaticStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrStatic = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      qrStatic: null == qrStatic
          ? _value.qrStatic
          : qrStatic // ignore: cast_nullable_to_non_nullable
              as List<QRStatic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QRStaticStateImplCopyWith<$Res>
    implements $QRStaticStateCopyWith<$Res> {
  factory _$$QRStaticStateImplCopyWith(
          _$QRStaticStateImpl value, $Res Function(_$QRStaticStateImpl) then) =
      __$$QRStaticStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<QRStatic> qrStatic, bool isLoading});
}

/// @nodoc
class __$$QRStaticStateImplCopyWithImpl<$Res>
    extends _$QRStaticStateCopyWithImpl<$Res, _$QRStaticStateImpl>
    implements _$$QRStaticStateImplCopyWith<$Res> {
  __$$QRStaticStateImplCopyWithImpl(
      _$QRStaticStateImpl _value, $Res Function(_$QRStaticStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrStatic = null,
    Object? isLoading = null,
  }) {
    return _then(_$QRStaticStateImpl(
      qrStatic: null == qrStatic
          ? _value._qrStatic
          : qrStatic // ignore: cast_nullable_to_non_nullable
              as List<QRStatic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QRStaticStateImpl implements _QRStaticState {
  _$QRStaticStateImpl(
      {final List<QRStatic> qrStatic = const [], this.isLoading = true})
      : _qrStatic = qrStatic;

  final List<QRStatic> _qrStatic;
  @override
  @JsonKey()
  List<QRStatic> get qrStatic {
    if (_qrStatic is EqualUnmodifiableListView) return _qrStatic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qrStatic);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'QRStaticState(qrStatic: $qrStatic, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QRStaticStateImpl &&
            const DeepCollectionEquality().equals(other._qrStatic, _qrStatic) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_qrStatic), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QRStaticStateImplCopyWith<_$QRStaticStateImpl> get copyWith =>
      __$$QRStaticStateImplCopyWithImpl<_$QRStaticStateImpl>(this, _$identity);
}

abstract class _QRStaticState implements QRStaticState {
  factory _QRStaticState(
      {final List<QRStatic> qrStatic,
      final bool isLoading}) = _$QRStaticStateImpl;

  @override
  List<QRStatic> get qrStatic;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$QRStaticStateImplCopyWith<_$QRStaticStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
