import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:model_assist_annotation/model_assist_annotation.dart';
import 'package:source_gen/source_gen.dart';


class ModelAssistGenerator extends GeneratorForAnnotation<ClassInfo> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {

    // 引数から ClassInfo のアノテーション情報を取得する。
    final ChildrenVisitor elementVisitor = ChildrenVisitor();
    final Element value = annotation.read('reference').typeValue.element;
    elementVisitor.addInfo(value, 'annotation ClassInfo');
    elementVisitor._className = element.name;

    // アノテーションが付加された要素の内部情報を全走査して取得する。
    elementVisitor.addInfo(element, '${element.runtimeType}');
    element.visitChildren(elementVisitor);

    // 引数の element は、アノテーションが付加された要素のみのため、
    // ソースファイル全体を持っている LibraryElement から内部情報を全走査して取得する。
    final LibraryElement library = await buildStep.inputLibrary;
    final ChildrenVisitor libraryVisitor = ChildrenVisitor();
    library.visitChildren(libraryVisitor);

    elementVisitor._importPackage = '${library.identifier}';

    return '${elementVisitor.createSupportCode()}\n';
  // return '/*\n'
  //         '${elementVisitor.sb.toString()}\n'
  //         '${libraryVisitor.sb.toString()}'
  //         '*/';
  }
}

class ChildrenVisitor extends ElementVisitor<dynamic>{
  final TypeChecker _classChecker = const TypeChecker.fromRuntime(ClassInfo);
  final TypeChecker _fieldChecker = const TypeChecker.fromRuntime(FieldInfo);
  final StringBuffer sb = StringBuffer();
  int count = 0;

  String _importPackage;
  String _className;
  String _itemNameName;
  String _itemNameType;
  String _itemPriceName;
  String _itemPriceType;

  String createSupportCode() {
    return '''
import '$_importPackage';

class ${_className}Base {
  ${_className} base;
  ${_className}Base(${_itemNameType} name, ${_itemPriceType} price) {
    base = ${_className}(name, price);
  }
  void display() {
    print('\$\{base.${_itemNameName}} \$\{base.${_itemPriceName}} yen');
  }
}
''';
  }
  void addInfo(Element element, String type) {
    final String info = '[${count++}] $type=${element.toString()}\n';
    sb.write(info);
    log.info(info);
  }

  void addImportInfo(ImportElement element, String type) {
    final String info = '[${count++}] $type=${element.toString()} ${element.uri}\n';
    sb.write(info);
    log.info(info);
  }

  @override
  void visitClassElement(ClassElement element) {
    // log.info('ClassElement=${element.toString()}[${count++}]\n');
    if (_classChecker.hasAnnotationOf(element)) {
      final Element value = _classChecker.firstAnnotationOf(element)
          .getField('reference').toTypeValue().element;
      addInfo(value, 'annotation ClassInfo');
      _className = element.name;
    }
    addInfo(element, 'ClassElement');
    return element.visitChildren(this);
  }

  @override
  void visitCompilationUnitElement(CompilationUnitElement element) {
    addInfo(element, 'CompilationUnitElement');
    return element.visitChildren(this);
  }

  @override
  void visitConstructorElement(ConstructorElement element) {
    addInfo(element, 'ConstructorElement');
    return element.visitChildren(this);
  }

  @override
  void visitExportElement(ExportElement element) {
    addInfo(element, 'ExportElement');
    return element.visitChildren(this);
  }

  @override
  void visitExtensionElement(ExtensionElement element) {
    addInfo(element, 'ExtensionElement');
    return element.visitChildren(this);
  }

  @override
  void visitFieldElement(FieldElement element) {
    if (_fieldChecker.hasAnnotationOf(element)) {
      final Element value = _fieldChecker.firstAnnotationOf(element)
          .getField('reference').toTypeValue().element;
      addInfo(value, 'annotation FieldInfo');
      if (value.name == 'ItemName') {
        _itemNameName = element.name;
        _itemNameType = element.type.getDisplayString(withNullability: false);
      }
      if (value.name == 'ItemPrice') {
        _itemPriceName = element.name;
        _itemPriceType = element.type.getDisplayString(withNullability: false);
      }
    }
    addInfo(element, 'FieldElement');
    return element.visitChildren(this);
  }

  @override
  void visitFieldFormalParameterElement(FieldFormalParameterElement element) {
    addInfo(element, 'FieldFormalParameterElement');
    return element.visitChildren(this);
  }

  @override
  void visitFunctionElement(FunctionElement element) {
    addInfo(element, 'FunctionElement');
    return element.visitChildren(this);
  }

  @override
  void visitFunctionTypeAliasElement(FunctionTypeAliasElement element) {
    addInfo(element, 'FunctionTypeAliasElement');
    return element.visitChildren(this);
  }

  @override
  void visitGenericFunctionTypeElement(GenericFunctionTypeElement element) {
    addInfo(element, 'GenericFunctionTypeElement');
    return element.visitChildren(this);
  }

  @override
  void visitImportElement(ImportElement element) {
    addImportInfo(element, 'ImportElement');
    return element.visitChildren(this);
  }

  @override
  void visitLabelElement(LabelElement element) {
    addInfo(element, 'LabelElement');
    return element.visitChildren(this);
  }

  @override
  void visitLibraryElement(LibraryElement element) {
    addInfo(element, 'LibraryElement');
    return element.visitChildren(this);
  }

  @override
  void visitLocalVariableElement(LocalVariableElement element) {
    addInfo(element, 'LocalVariableElement');
    return element.visitChildren(this);
  }

  @override
  void visitMethodElement(MethodElement element) {
    addInfo(element, 'MethodElement');
    return element.visitChildren(this);
  }

  @override
  void visitMultiplyDefinedElement(MultiplyDefinedElement element) {
    addInfo(element, 'MultiplyDefinedElement');
    return element.visitChildren(this);
  }

  @override
  void visitParameterElement(ParameterElement element) {
    addInfo(element, 'ParameterElement');
    return element.visitChildren(this);
  }

  @override
  void visitPrefixElement(PrefixElement element) {
    addInfo(element, 'PrefixElement');
    return element.visitChildren(this);
  }

  @override
  void visitPropertyAccessorElement(PropertyAccessorElement element) {
    addInfo(element, 'PropertyAccessorElement');
    return element.visitChildren(this);
  }

  @override
  void visitTopLevelVariableElement(TopLevelVariableElement element) {
    addInfo(element, 'TopLevelVariableElement');
    return element.visitChildren(this);
  }

  @override
  void visitTypeParameterElement(TypeParameterElement element) {
    addInfo(element, 'TypeParameterElement');
    return element.visitChildren(this);
  }
}
