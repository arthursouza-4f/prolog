// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConectionStore on _ConectionStore, Store {
  Computed<bool>? _$isConnectedComputed;

  @override
  bool get isConnected =>
      (_$isConnectedComputed ??= Computed<bool>(() => super.isConnected,
              name: '_ConectionStore.isConnected'))
          .value;

  @override
  String toString() {
    return '''
isConnected: ${isConnected}
    ''';
  }
}
