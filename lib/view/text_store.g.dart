// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextStore on AbstractTextStore, Store {
  late final _$observableTextListAtom =
      Atom(name: 'AbstractTextStore.observableTextList', context: context);

  @override
  ObservableList<String> get observableTextList {
    _$observableTextListAtom.reportRead();
    return super.observableTextList;
  }

  @override
  set observableTextList(ObservableList<String> value) {
    _$observableTextListAtom.reportWrite(value, super.observableTextList, () {
      super.observableTextList = value;
    });
  }

  late final _$AbstractTextStoreActionController =
      ActionController(name: 'AbstractTextStore', context: context);

  @override
  void addText(String text) {
    final _$actionInfo = _$AbstractTextStoreActionController.startAction(
        name: 'AbstractTextStore.addText');
    try {
      return super.addText(text);
    } finally {
      _$AbstractTextStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editText(int indexText, String newText) {
    final _$actionInfo = _$AbstractTextStoreActionController.startAction(
        name: 'AbstractTextStore.editText');
    try {
      return super.editText(indexText, newText);
    } finally {
      _$AbstractTextStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeText(int indexText) {
    final _$actionInfo = _$AbstractTextStoreActionController.startAction(
        name: 'AbstractTextStore.removeText');
    try {
      return super.removeText(indexText);
    } finally {
      _$AbstractTextStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableTextList: ${observableTextList}
    ''';
  }
}
