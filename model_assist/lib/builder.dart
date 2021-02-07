import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:model_assist/src/generator.dart';

Builder modelAssistBuilder(BuilderOptions options) =>
    LibraryBuilder(ModelAssistGenerator(), generatedExtension: '.model_assist.g.dart');
