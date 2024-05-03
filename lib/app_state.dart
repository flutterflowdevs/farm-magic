import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _LanguageList = prefs
              .getStringList('ff_LanguageList')
              ?.map((x) {
                try {
                  return LanguageStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _LanguageList;
    });
    _safeInit(() {
      _selectedLanguageCode =
          prefs.getString('ff_selectedLanguageCode') ?? _selectedLanguageCode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _weatherList = [
    jsonDecode('{}'),
    jsonDecode('{}'),
    jsonDecode('{}'),
    jsonDecode('{}'),
    jsonDecode('{}')
  ];
  List<dynamic> get weatherList => _weatherList;
  set weatherList(List<dynamic> value) {
    _weatherList = value;
  }

  void addToWeatherList(dynamic value) {
    _weatherList.add(value);
  }

  void removeFromWeatherList(dynamic value) {
    _weatherList.remove(value);
  }

  void removeAtIndexFromWeatherList(int index) {
    _weatherList.removeAt(index);
  }

  void updateWeatherListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _weatherList[index] = updateFn(_weatherList[index]);
  }

  void insertAtIndexInWeatherList(int index, dynamic value) {
    _weatherList.insert(index, value);
  }

  List<LanguageStruct> _LanguageList = [
    LanguageStruct.fromSerializableMap(jsonDecode(
        '{\"lang_name\":\"English\",\"lang_code\":\"en\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/lz7w1luuuw5f/United-kingdom_flag_icon_round.svg.png\"}')),
    LanguageStruct.fromSerializableMap(jsonDecode(
        '{\"lang_name\":\"हिंदी\",\"lang_code\":\"hi\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/haasya3shprf/india-flag-round-shape-png.webp\"}')),
    LanguageStruct.fromSerializableMap(jsonDecode(
        '{\"lang_name\":\"Portuguese\",\"lang_code\":\"pt\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/cs8y1j202cet/portugal-flag-logo-circle-thumbnail-removebg-preview.png\"}')),
    LanguageStruct.fromSerializableMap(jsonDecode(
        '{\"lang_name\":\"Swahili\",\"lang_code\":\"sw\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/wpvkzwsapuu7/-kenya-national-flag-flag-miscellaneous--removebg-preview.png\"}'))
  ];
  List<LanguageStruct> get LanguageList => _LanguageList;
  set LanguageList(List<LanguageStruct> value) {
    _LanguageList = value;
    prefs.setStringList(
        'ff_LanguageList', value.map((x) => x.serialize()).toList());
  }

  void addToLanguageList(LanguageStruct value) {
    _LanguageList.add(value);
    prefs.setStringList(
        'ff_LanguageList', _LanguageList.map((x) => x.serialize()).toList());
  }

  void removeFromLanguageList(LanguageStruct value) {
    _LanguageList.remove(value);
    prefs.setStringList(
        'ff_LanguageList', _LanguageList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLanguageList(int index) {
    _LanguageList.removeAt(index);
    prefs.setStringList(
        'ff_LanguageList', _LanguageList.map((x) => x.serialize()).toList());
  }

  void updateLanguageListAtIndex(
    int index,
    LanguageStruct Function(LanguageStruct) updateFn,
  ) {
    _LanguageList[index] = updateFn(_LanguageList[index]);
    prefs.setStringList(
        'ff_LanguageList', _LanguageList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLanguageList(int index, LanguageStruct value) {
    _LanguageList.insert(index, value);
    prefs.setStringList(
        'ff_LanguageList', _LanguageList.map((x) => x.serialize()).toList());
  }

  String _selectedLanguageCode = 'en';
  String get selectedLanguageCode => _selectedLanguageCode;
  set selectedLanguageCode(String value) {
    _selectedLanguageCode = value;
    prefs.setString('ff_selectedLanguageCode', value);
  }

  dynamic _cropList = jsonDecode(
      '[{\"name\":\"Wheat\",\"img\":\"https://origin.club/media/catalog/product/cache/86eaafd287624d270d87c663dd3976d5/w/h/wheat_whole_2__1.jpg\"},{\"name\":\"Rice\",\"img\":\"https://www.shutterstock.com/image-photo/rice-bowl-on-white-background-600nw-710865547.jpg\"},{\"name\":\"Corn\",\"img\":\"https://img.freepik.com/premium-photo/corn-white-background_59226-73.jpg\"},{\"name\":\"Barley\",\"img\":\"https://png.pngtree.com/background/20220722/original/pngtree-barley-in-the-bamboo-basket-bowl-of-grain-and-miscellaneous-grains-picture-image_1712327.jpg\"},{\"name\":\"Soybeans\",\"img\":\"https://png.pngtree.com/background/20220722/original/pngtree-soybean-white-background-photography-picture-image_1712939.jpg\"},{\"name\":\"Cotton\",\"img\":\"https://png.pngtree.com/thumb_back/fh260/background/20210911/pngtree-a-bunch-of-cotton-is-placed-on-a-white-background-image_850510.jpg\"},{\"name\":\"Potatoes\",\"img\":\"https://i.pinimg.com/736x/33/7e/fa/337efa818550fce97fa5991ea513c16b.jpg\"},{\"name\":\"Sugarcane\",\"img\":\"https://img.freepik.com/premium-photo/sugar-cane-white-background_51524-24635.jpg\"},{\"name\":\"Tomatoes\",\"img\":\"https://urjaseeds.com/cdn/shop/products/CherryTomatoWHiteBackground_900x.jpg?v=1590760881\"},{\"name\":\"Peppers\",\"img\":\"https://media.istockphoto.com/id/1130564105/photo/sweet-pepper-paprika-isolated-on-white-background-clipping-path-full-depth-of-field.jpg?s=612x612&w=0&k=20&c=m_01GdGMntpr6B3tiplqxbtPN8zTKN1xfucAaBu3Mkw=\"}]');
  dynamic get cropList => _cropList;
  set cropList(dynamic value) {
    _cropList = value;
  }

  dynamic _animalList = jsonDecode(
      '[{\"name\":\"Cow\",\"img\":\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKaAr1ot61LAPG3LGUQL2rCsv-Q0LAd9dSjhWuFyTPxw&s\"},{\"name\":\"Chicken\",\"img\":\"https://cdn.britannica.com/18/137318-050-29F7072E/rooster-Rhode-Island-Red-roosters-chicken-domestication.jpg\"},{\"name\":\"Pig\",\"img\":\"https://media.4-paws.org/f/b/9/e/fb9eaf496f739315766331e91bddde8936375550/VP0113037-1927x1333.jpg\"},{\"name\":\"Sheep\",\"img\":\"https://cdn.hswstatic.com/gif/gettyimages-1401374620.jpg\"},{\"name\":\"Goat\",\"img\":\"https://www.farmersalmanac.com/wp-content/uploads/2020/11/Raising-Backyard-Goats-Tips-i834732994-1184x630.jpeg\"},{\"name\":\"Horse\",\"img\":\"https://cdn.cdnparenting.com/articles/2019/05/08123232/1175510683-H-1024x700.webp\"},{\"name\":\"Duck\",\"img\":\"https://cdn.download.ams.birds.cornell.edu/api/v1/asset/308743931/900\"},{\"name\":\"Turkey\",\"img\":\"https://www.allaboutbirds.org/guide/assets/photo/311368611-480px.jpg\"},{\"name\":\"Rabbit\",\"img\":\"https://www.pbs.org/wnet/nature/files/2020/04/2-rabbits-eating-grass-at-daytime-33152.jpg\"},{\"name\":\"Donkey\",\"img\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Donkey_in_Clovelly%2C_North_Devon%2C_England.jpg/640px-Donkey_in_Clovelly%2C_North_Devon%2C_England.jpg\"}]');
  dynamic get animalList => _animalList;
  set animalList(dynamic value) {
    _animalList = value;
  }

  LatLng? _defaultLatLong = const LatLng(30.5927599, 114.30525);
  LatLng? get defaultLatLong => _defaultLatLong;
  set defaultLatLong(LatLng? value) {
    _defaultLatLong = value;
  }

  dynamic _weatherErrorCode = jsonDecode(
      '[{\"1000\":[{\"name\":\"Sunny\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/bsl0wzto21zx/Sunny.gif\"}]},{\"1100\":[{\"name\":\"Mostly Clear\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/bsl0wzto21zx/Sunny.gif\"}]},{\"1101\":[{\"name\":\"Partly Cloudy\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/icu0sx4o9kvi/cloudy.gif\"}]},{\"1102\":[{\"name\":\"Mostly Cloudy\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/gfe56qm434cr/mostly_cloudy.gif\"}]},{\"1001\":[{\"name\":\"Cloudy\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/gfe56qm434cr/mostly_cloudy.gif\"}]},{\"2000\":[{\"name\":\"Mist\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/wxrd1es5sdbs/mist.gif\"}]},{\"2100\":[{\"name\":\"Light mist\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/wxrd1es5sdbs/mist.gif\"}]},{\"4000\":[{\"name\":\"Drizzle\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/lr7qksvetvpm/Rain_with_storm.gif\"}]},{\"4001\":[{\"name\":\"Rain\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/ktbifpj2o16b/Rain.gif\"}]},{\"4200\":[{\"name\":\"Light Rain\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/ktbifpj2o16b/Rain.gif\"}]},{\"4201\":[{\"name\":\"Heavy Rain\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/ktbifpj2o16b/Rain.gif\"}]},{\"5000\":[{\"name\":\"Snow\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/w9qt6h7bwk7a/snow.gif\"}]},{\"5001\":[{\"name\":\"Flurries\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/w9qt6h7bwk7a/snow.gif\"}]},{\"5100\":[{\"name\":\"Light Snow\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/w9qt6h7bwk7a/snow.gif\"}]},{\"5101\":[{\"name\":\"Heavy Snow\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/w9qt6h7bwk7a/snow.gif\"}]},{\"6000\":[{\"name\":\"Light Snow\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/w9qt6h7bwk7a/snow.gif\"}]},{\"6001\":[{\"name\":\"Freezing Rain\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/ktbifpj2o16b/Rain.gif\"}]},{\"6200\":[{\"name\":\"Light Freezing Rain\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/g2r3zqec67wn/rain_with_sun.gif\"}]},{\"6201\":[{\"name\":\"Heavy Freezing Rain\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/ktbifpj2o16b/Rain.gif\"}]},{\"7000\":[{\"name\":\"Light Snow\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/w9qt6h7bwk7a/snow.gif\"}]},{\"7101\":[{\"name\":\"Light Snow\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/w9qt6h7bwk7a/snow.gif\"}]},{\"7102\":[{\"name\":\"Light Snow\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/w9qt6h7bwk7a/snow.gif\"}]},{\"8000\":[{\"name\":\"Thunderstorm\",\"image_url\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/lr7qksvetvpm/Rain_with_storm.gif\"}]}]');
  dynamic get weatherErrorCode => _weatherErrorCode;
  set weatherErrorCode(dynamic value) {
    _weatherErrorCode = value;
  }

  dynamic _emptyJson = jsonDecode('{}');
  dynamic get emptyJson => _emptyJson;
  set emptyJson(dynamic value) {
    _emptyJson = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
