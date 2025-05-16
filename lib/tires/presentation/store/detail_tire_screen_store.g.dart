// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_tire_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailTireScreenStore on _DetailTireScreenStore, Store {
  late final _$detailTireModelAtom =
      Atom(name: '_DetailTireScreenStore.detailTireModel', context: context);

  @override
  GetDetailTiresModel get detailTireModel {
    _$detailTireModelAtom.reportRead();
    return super.detailTireModel;
  }

  @override
  set detailTireModel(GetDetailTiresModel value) {
    _$detailTireModelAtom.reportWrite(value, super.detailTireModel, () {
      super.detailTireModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_DetailTireScreenStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_DetailTireScreenStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getDetailTireAsyncAction =
      AsyncAction('_DetailTireScreenStore.getDetailTire', context: context);

  @override
  Future<void> getDetailTire(int id) {
    return _$getDetailTireAsyncAction.run(() => super.getDetailTire(id));
  }

  @override
  String toString() {
    return '''
detailTireModel: ${detailTireModel},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
