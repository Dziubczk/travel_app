// Routes
const String SPLASH = '/splash';
const String HOME = '/home';
const String MEW = '/mew';
const String COVID = '/covid';

typedef VoidCallback = void Function();
typedef ValueCallback<T> = void Function(T);
typedef AlertCallback<T, D> = void Function(T, D);
typedef ValueGetter<T> = T Function();
typedef ValueParser<T, D> = T Function(D);

bool isStringEmptyOrNull(String? string) => string?.isEmpty ?? true;

extension SafeString on String? {
  bool get isEmptyOrNull => this?.isEmpty ?? true;

  String getSafeString(String defaltString) =>
      isEmptyOrNull ? defaltString : this!;

  String? getNotEmptyStringOrNull() => isEmptyOrNull ? null : this;
}
