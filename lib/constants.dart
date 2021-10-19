

// Routes
const String SPLASH = '/splash';
const String AUTH = '/auth';
const String RESET_PASSWORD = '/reset-password';
const String CONNECT_TO_CAMERA = '/connect-to-camera';
const String RECORDING = '/recording';
const String EVENT_DETAILS = '/event-details';
const String CAMERA_HOME = '/camera-home';
const String UPLOADING_REQUIRMENTS = '/uploading-requirments';
const String CREATE_TEAM = '/create-team';
const String SEARCH_TEAM = '/search_team';
const String EDIT_EVENT_VIDEO = '/edit-event-video';
const String ABOUT_CAMERA = '/about-camera';
const String SWITCH_CAMERA = '/switch-camera';
const String CHECK_UPDATE = '/check-firmware-update';
const String FIRST_RECORDING = '/first-recording';
const String PREVIEW_VIDEO = '/preview-video';
const String WIFI_LIST = '/wifi-list';
const String WIFI_PASSWORD = '/wifi-password';
const String CONNECT_TO_WIFI = '/connect-to-wifi';

enum Environment {
  DEV,
  STAGE,
  PROD,
  MOCK_DEV,
}
enum AuthenticationMode {
  B2C,
  B2B,
}
final RegExp prefixPix = RegExp(r'^Pix-[a-zA-Z0-9_\-=@,\.;]+$');
//Generic callback

typedef VoidCallback = void Function();
typedef ValueCallback<T> = void Function(T);
typedef AlertCallback<T, D> = void Function(T, D);
typedef ValueGetter<T> = T Function();
typedef ValueParser<T, D> = T Function(D);
bool isStringEmptyOrNull(String? string) => string?.isEmpty ?? true;

extension SafeString on String? {
  bool get isEmptyOrNull => this?.isEmpty ?? true;

  String getSafeString(String defaltString) => isEmptyOrNull ? defaltString : this!;

  String? getNotEmptyStringOrNull() => isEmptyOrNull ? null : this;
}
