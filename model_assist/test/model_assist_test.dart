import 'package:test/test.dart';

import 'package:model_assist/src/generator.dart';

void main() {
  test('create children visitor', () {
    final visitor = ChildrenVisitor();
    expect(visitor.sb.toString(), '');
  });
}
