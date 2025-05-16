// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tire_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TireScreenStore on _TireScreenStore, Store {
  late final _$tireCardsAtom =
      Atom(name: '_TireScreenStore.tireCards', context: context);

  @override
  GetAllTiresModel get tireCards {
    _$tireCardsAtom.reportRead();
    return super.tireCards;
  }

  @override
  set tireCards(GetAllTiresModel value) {
    _$tireCardsAtom.reportWrite(value, super.tireCards, () {
      super.tireCards = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TireScreenStore.isLoading', context: context);

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
      Atom(name: '_TireScreenStore.errorMessage', context: context);

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

  late final _$pageNumberAtom =
      Atom(name: '_TireScreenStore.pageNumber', context: context);

  @override
  int get pageNumber {
    _$pageNumberAtom.reportRead();
    return super.pageNumber;
  }

  @override
  set pageNumber(int value) {
    _$pageNumberAtom.reportWrite(value, super.pageNumber, () {
      super.pageNumber = value;
    });
  }

  late final _$getAllTiresAsyncAction =
      AsyncAction('_TireScreenStore.getAllTires', context: context);

  @override
  Future<void> getAllTires(int pageNumber) {
    return _$getAllTiresAsyncAction.run(() => super.getAllTires(pageNumber));
  }

  late final _$_TireScreenStoreActionController =
      ActionController(name: '_TireScreenStore', context: context);

  @override
  void setPageNumberOneMore() {
    final _$actionInfo = _$_TireScreenStoreActionController.startAction(
        name: '_TireScreenStore.setPageNumberOneMore');
    try {
      return super.setPageNumberOneMore();
    } finally {
      _$_TireScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageNumberOneLess() {
    final _$actionInfo = _$_TireScreenStoreActionController.startAction(
        name: '_TireScreenStore.setPageNumberOneLess');
    try {
      return super.setPageNumberOneLess();
    } finally {
      _$_TireScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tireCards: ${tireCards},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
pageNumber: ${pageNumber}
    ''';
  }
}
