// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_clima.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerClima on ControllerClimaBase, Store {
  final _$cidadeAtom = Atom(name: 'ControllerClimaBase.cidade');

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$mapClimaAtom = Atom(name: 'ControllerClimaBase.mapClima');

  @override
  ModelClima get mapClima {
    _$mapClimaAtom.reportRead();
    return super.mapClima;
  }

  @override
  set mapClima(ModelClima value) {
    _$mapClimaAtom.reportWrite(value, super.mapClima, () {
      super.mapClima = value;
    });
  }

  final _$getClimaByCityAsyncAction =
      AsyncAction('ControllerClimaBase.getClimaByCity');

  @override
  Future<void> getClimaByCity() {
    return _$getClimaByCityAsyncAction.run(() => super.getClimaByCity());
  }

  @override
  String toString() {
    return '''
cidade: ${cidade},
mapClima: ${mapClima}
    ''';
  }
}
