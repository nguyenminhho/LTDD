void main() {
  Object obj = 'Hello';

  if (obj is String) {
    print('obj la String');
  }

  if (obj is! int) {
    print('obj ko la int');
  }

  String str = obj as String;
  print(str.toUpperCase());
}
