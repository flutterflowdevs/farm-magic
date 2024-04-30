import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? taText = '',
  }) =>
      [enText, hiText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'shprqzpg': {
      'en': 'Hi, ',
      'hi': 'नमस्ते,',
      'ta': 'வணக்கம்,',
    },
    '8h0nglqo': {
      'en': '\nExplore Farm Magic ',
      'hi': '\nफार्म मैजिक का अन्वेषण करें',
      'ta': '\nபண்ணை மேஜிக்கை ஆராயுங்கள்',
    },
    'kf12c3yv': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // Onboarding
  {
    'raiejvye': {
      'en': 'Farmers',
      'hi': 'किसानों',
      'ta': 'விவசாயிகள்',
    },
    'co9cuclt': {
      'en':
          'A farmer is a person engaged in agriculture, raising living organisms for food or raw materials.[1] The term usually applies to people who do some combination of raising field crops, orchards, vineyards, poultry, or other livestock.',
      'hi':
          'किसान वह व्यक्ति होता है जो कृषि में लगा होता है, भोजन या कच्चे माल के लिए जीवित जीवों को पालता है।[1] यह शब्द आमतौर पर उन लोगों पर लागू होता है जो खेत की फ़सलों, बागों, अंगूर के बागों, मुर्गी पालन या अन्य पशुधन को पालने का कुछ संयोजन करते हैं।',
      'ta':
          'ஒரு விவசாயி என்பது விவசாயத்தில் ஈடுபட்டுள்ள ஒரு நபர், உணவு அல்லது மூலப்பொருட்களுக்காக உயிரினங்களை வளர்க்கிறார்.[1] வயல் பயிர்கள், பழத்தோட்டங்கள், திராட்சைத் தோட்டங்கள், கோழி அல்லது பிற கால்நடைகளை வளர்ப்பதில் சில சேர்க்கைகளைச் செய்பவர்களுக்கு இந்த சொல் பொதுவாகப் பொருந்தும்.',
    },
    'b9lp1kl9': {
      'en': 'Agri Experts',
      'hi': 'कृषि विशेषज्ञ',
      'ta': 'வேளாண் நிபுணர்கள்',
    },
    'juf07jfx': {
      'en':
          'Agricultural Scientist is the one who is a specialist in analyzing farming methods and production methods to enhance safety and crop yield.',
      'hi':
          'कृषि वैज्ञानिक वह व्यक्ति होता है जो सुरक्षा और फसल उपज बढ़ाने के लिए खेती के तरीकों और उत्पादन विधियों का विश्लेषण करने में विशेषज्ञ होता है।',
      'ta':
          'வேளாண் விஞ்ஞானி பாதுகாப்பு மற்றும் பயிர் விளைச்சலை அதிகரிக்க விவசாய முறைகள் மற்றும் உற்பத்தி முறைகளை பகுப்பாய்வு செய்வதில் நிபுணத்துவம் பெற்றவர்.',
    },
    '8ek3xt24': {
      'en': 'Agri Study',
      'hi': 'कृषि अध्ययन',
      'ta': 'வேளாண் படிப்பு',
    },
    'hfmhkcy5': {
      'en':
          'Agriculture course is an academic discipline of Science that involves the study of various scientific, technical and business subjects related to Agriculture, Horticulture, Farm Management, Poultry Farming, Dairy Farming, Agricultural Biotechnology, etc',
      'hi':
          'कृषि पाठ्यक्रम विज्ञान का एक अकादमिक अनुशासन है जिसमें कृषि, बागवानी, फार्म प्रबंधन, मुर्गीपालन, डेयरी फार्मिंग, कृषि जैव प्रौद्योगिकी आदि से संबंधित विभिन्न वैज्ञानिक, तकनीकी और व्यावसायिक विषयों का अध्ययन शामिल है।',
      'ta':
          'வேளாண்மைப் பாடமானது, வேளாண்மை, தோட்டக்கலை, பண்ணை மேலாண்மை, கோழிப் பண்ணை, பால் பண்ணை, வேளாண் உயிரித் தொழில்நுட்பம் போன்றவற்றுடன் தொடர்புடைய பல்வேறு அறிவியல், தொழில்நுட்ப மற்றும் வணிகப் பாடங்களைப் படிப்பதை உள்ளடக்கிய ஒரு அறிவியல் துறையாகும்.',
    },
    'm2fwl0gn': {
      'en': 'Agri Store',
      'hi': 'एग्री स्टोर',
      'ta': 'அக்ரி ஸ்டோர்',
    },
    'm5dsgxsj': {
      'en':
          'A supermarket is a self-service shop offering a wide variety of food, beverages and household products, organized into sections. This kind of store is larger and has a wider selection than earlier grocery stores, but is smaller and more limited in the range of merchandise than  big-box market.',
      'hi':
          'सुपरमार्केट एक स्व-सेवा दुकान है जो विभिन्न प्रकार के खाद्य पदार्थ, पेय पदार्थ और घरेलू उत्पाद प्रदान करती है, जिन्हें खंडों में व्यवस्थित किया जाता है। इस तरह की दुकान पहले की किराने की दुकानों की तुलना में बड़ी होती है और इसमें व्यापक चयन होता है, लेकिन यह बड़े बॉक्स बाज़ार की तुलना में छोटी और माल की सीमा में अधिक सीमित होती है।',
      'ta':
          'பல்பொருள் அங்காடி என்பது பலவகையான உணவு, பானங்கள் மற்றும் வீட்டுப் பொருட்களை வழங்கும் ஒரு சுய-சேவைக் கடை ஆகும். இந்த வகையான கடை பெரியது மற்றும் முந்தைய மளிகைக் கடைகளை விட பரந்த தேர்வைக் கொண்டுள்ளது.',
    },
    'kzywycrm': {
      'en': ' Next ',
      'hi': 'अगला',
      'ta': 'அடுத்தது',
    },
    'p7uqcp6x': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // Login
  {
    'g6z2dbw7': {
      'en': 'Welcome back!',
      'hi': 'वापसी पर स्वागत है!',
      'ta': 'மீண்டும் வருக!',
    },
    'db4zj6vr': {
      'en': 'Let\'s login for explore continues',
      'hi': 'आइए लॉगिन करें अन्वेषण जारी है',
      'ta': 'ஆய்வு தொடர்வதற்கு உள்நுழைவோம்',
    },
    'c6f7hxu3': {
      'en': 'example@gmail.com',
      'hi': 'उदाहरण@gmail.com',
      'ta': 'example@gmail.com',
    },
    '4m9tqn0j': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
    },
    'zx2mumoh': {
      'en': 'Forgot password?',
      'hi': 'पासवर्ड भूल गए?',
      'ta': 'கடவுச்சொல்லை மறந்துவிட்டீர்களா?',
    },
    'y5byvsgg': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'ta': 'உள்நுழைய',
    },
    'bbxhsxaj': {
      'en': 'Or',
      'hi': 'या',
      'ta': 'அல்லது',
    },
    'ysy3ukmv': {
      'en': 'Connect using',
      'hi': 'का उपयोग करके कनेक्ट करें',
      'ta': 'பயன்படுத்தி இணைக்கவும்',
    },
    '6y114b2p': {
      'en': 'Don\'t have an account ?',
      'hi': 'क्या आपके पास खाता नहीं है?',
      'ta': 'கணக்கு இல்லையா?',
    },
    'e8eey7qb': {
      'en': ' Sign up',
      'hi': 'साइन अप करें',
      'ta': 'பதிவு செய்யவும்',
    },
    'e2asjfmn': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // SignUp
  {
    'pwnh2znq': {
      'en': 'Let\'s Get Started',
      'hi': 'आएँ शुरू करें',
      'ta': 'தொடங்குவோம்',
    },
    'c8nr1ttp': {
      'en': 'Create an account to get all features',
      'hi': 'सभी सुविधाएँ पाने के लिए खाता बनाएँ',
      'ta': 'அனைத்து அம்சங்களையும் பெற ஒரு கணக்கை உருவாக்கவும்',
    },
    'swf4bk5h': {
      'en': 'Name',
      'hi': 'नाम',
      'ta': 'பெயர்',
    },
    'fe1c5q9a': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
      'ta': 'மின்னஞ்சல் முகவரி',
    },
    'o9cq3ezq': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'ta': 'கடவுச்சொல்',
    },
    'qs9o8pme': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'ta': 'கடவுச்சொல்லை உறுதிப்படுத்தவும்',
    },
    'y5ibwg73': {
      'en': 'Andhra Pradesh',
      'hi': 'आंध्र प्रदेश',
      'ta': 'ஆந்திரப் பிரதேசம்',
    },
    'dqu0ri9j': {
      'en': 'Arunachal Pradesh',
      'hi': 'अरुणाचल प्रदेश',
      'ta': 'அருணாச்சல பிரதேசம்',
    },
    '45qd67dt': {
      'en': 'Assam',
      'hi': 'असम',
      'ta': 'அசாம்',
    },
    'z8ogfxox': {
      'en': 'Bihar',
      'hi': 'बिहार',
      'ta': 'பீகார்',
    },
    'mo0d2qr0': {
      'en': 'Chhattisgarh',
      'hi': 'छत्तीसगढ',
      'ta': 'சத்தீஸ்கர்',
    },
    'hwl6h5rw': {
      'en': 'Goa',
      'hi': 'गोवा',
      'ta': 'கோவா',
    },
    'xdw2j7fp': {
      'en': 'Gujarat',
      'hi': 'गुजरात',
      'ta': 'குஜராத்',
    },
    'op9etm98': {
      'en': 'Haryana',
      'hi': 'हरयाणा',
      'ta': 'ஹரியானா',
    },
    'zmve6xc4': {
      'en': 'Himachal Pradesh',
      'hi': 'हिमाचल प्रदेश',
      'ta': 'ஹிமாச்சல பிரதேசம்',
    },
    'pyqtxlsq': {
      'en': 'Jharkhand',
      'hi': 'झारखंड',
      'ta': 'ஜார்கண்ட்',
    },
    '8q2p5rb3': {
      'en': 'Karnataka',
      'hi': 'कर्नाटक',
      'ta': 'கர்நாடகா',
    },
    'ohhvuyem': {
      'en': 'Kerala',
      'hi': 'केरल',
      'ta': 'கேரளா',
    },
    'feylt012': {
      'en': 'Madhya Pradesh',
      'hi': 'मध्य प्रदेश',
      'ta': 'மத்திய பிரதேசம்',
    },
    '58bhb7gb': {
      'en': 'Maharashtra',
      'hi': 'महाराष्ट्र',
      'ta': 'மகாராஷ்டிரா',
    },
    '6ikb6gy6': {
      'en': 'Manipur',
      'hi': 'मणिपुर',
      'ta': 'மணிப்பூர்',
    },
    'wsitizyr': {
      'en': 'Meghalaya',
      'hi': 'मेघालय',
      'ta': 'மேகாலயா',
    },
    'jacaw7vp': {
      'en': 'Mizoram',
      'hi': 'मिजोरम',
      'ta': 'மிசோரம்',
    },
    'oka8mi8p': {
      'en': 'Nagaland',
      'hi': 'नगालैंड',
      'ta': 'நாகாலாந்து',
    },
    '8mgt5iva': {
      'en': 'Odisha',
      'hi': 'ओडिशा',
      'ta': 'ஒடிசா',
    },
    'ynrqq1ra': {
      'en': 'Punjab',
      'hi': 'पंजाब',
      'ta': 'பஞ்சாப்',
    },
    't7oitik4': {
      'en': 'Rajasthan',
      'hi': 'राजस्थान Rajasthan',
      'ta': 'ராஜஸ்தான்',
    },
    'o7oj5jvl': {
      'en': 'Sikkim',
      'hi': 'सिक्किम',
      'ta': 'சிக்கிம்',
    },
    'tf4d6dm9': {
      'en': 'Tamil Nadu',
      'hi': 'तमिलनाडु',
      'ta': 'தமிழ்நாடு',
    },
    'wtq49ujq': {
      'en': 'Telangana',
      'hi': 'तेलंगाना',
      'ta': 'தெலுங்கானா',
    },
    '53k3wctf': {
      'en': 'Tripura',
      'hi': 'त्रिपुरा',
      'ta': 'திரிபுரா',
    },
    'jfcxz7z6': {
      'en': 'Uttar Pradesh',
      'hi': 'उतार प्रदेश।',
      'ta': 'உத்தரப்பிரதேசம்',
    },
    '2ugzdtet': {
      'en': 'Uttarakhand',
      'hi': 'उत्तराखंड',
      'ta': 'உத்தரகாண்ட்',
    },
    'irgmlfh8': {
      'en': 'West Bengal',
      'hi': 'पश्चिम बंगाल',
      'ta': 'மேற்கு வங்காளம்',
    },
    '4cor8tl6': {
      'en': 'Select state...',
      'hi': 'राज्य चुनें...',
      'ta': 'மாநிலத்தைத் தேர்ந்தெடு...',
    },
    '27audshe': {
      'en': 'Search your state...',
      'hi': 'अपना राज्य खोजें...',
      'ta': 'உங்கள் மாநிலத்தைத் தேடுங்கள்...',
    },
    '4i1rqic3': {
      'en': 'City',
      'hi': 'शहर',
      'ta': 'நகரம்',
    },
    '7ajnm9mh': {
      'en': 'Sign Up',
      'hi': 'साइन अप करें',
      'ta': 'பதிவு செய்யவும்',
    },
    'loq8cetj': {
      'en': 'Already have an account?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'ta': 'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
    },
    'kdssalg4': {
      'en': ' Login',
      'hi': 'लॉग इन करें',
      'ta': 'உள்நுழைய',
    },
    '6i7a4xsm': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // ChatPage
  {
    '5r2h7n51': {
      'en': 'Chat With AI',
      'hi': 'AI के साथ चैट करें',
      'ta': 'AI உடன் அரட்டையடிக்கவும்',
    },
    '98va4eou': {
      'en': 'Message',
      'hi': 'संदेश',
      'ta': 'செய்தி',
    },
    'y7y88ofa': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // ProfilePage
  {
    'l4z5aiuz': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'ta': 'சுயவிவரம்',
    },
    'hje48fx0': {
      'en': 'Language',
      'hi': 'भाषा',
      'ta': 'மொழி',
    },
    '0z0m17yt': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
      'ta': 'தனியுரிமைக் கொள்கை',
    },
    '80e5pyet': {
      'en': 'Terms & Conditions',
      'hi': 'नियम एवं शर्तें',
      'ta': 'விதிமுறைகளும் நிபந்தனைகளும்',
    },
    'tfgv3cwt': {
      'en': 'Log out',
      'hi': 'लॉग आउट',
      'ta': 'வெளியேறு',
    },
    'ot2uip2d': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // NavigationWrapper
  {
    'tvotfyu6': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // FogotPassword
  {
    'rlmy5zr0': {
      'en': 'Go back',
      'hi': 'वापस जाओ',
      'ta': 'திரும்பி போ',
    },
    '0utqhskh': {
      'en': 'A link will be shared to your email Id',
      'hi': 'आपके ईमेल आईडी पर एक लिंक साझा किया जाएगा',
      'ta': 'உங்கள் மின்னஞ்சல் ஐடிக்கு இணைப்பு பகிரப்படும்',
    },
    '2vow8t0i': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
      'ta': 'மின்னஞ்சல் முகவரி',
    },
    'rqucux3c': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
      'ta': 'இணைப்பை அனுப்பவும்',
    },
    'jxn30qpa': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // EditProfile
  {
    '9l7gr7vl': {
      'en': 'Name',
      'hi': 'नाम',
      'ta': 'பெயர்',
    },
    'tzsytltq': {
      'en': 'Name',
      'hi': 'नाम',
      'ta': 'பெயர்',
    },
    'b1rik077': {
      'en': 'Email',
      'hi': 'ईमेल',
      'ta': 'மின்னஞ்சல்',
    },
    'k0m87vg0': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
      'ta': 'மின்னஞ்சல் முகவரி',
    },
    '6hr68myw': {
      'en': 'State',
      'hi': 'राज्य',
      'ta': 'நிலை',
    },
    'dhgxiqh8': {
      'en': 'Andhra Pradesh',
      'hi': 'आंध्र प्रदेश',
      'ta': 'ஆந்திரப் பிரதேசம்',
    },
    'obxk71ya': {
      'en': 'Arunachal Pradesh',
      'hi': 'अरुणाचल प्रदेश',
      'ta': 'அருணாச்சல பிரதேசம்',
    },
    '4bq8l7q8': {
      'en': 'Assam',
      'hi': 'असम',
      'ta': 'அசாம்',
    },
    'a34ui43v': {
      'en': 'Bihar',
      'hi': 'बिहार',
      'ta': 'பீகார்',
    },
    'uv1ezvrr': {
      'en': 'Chhattisgarh',
      'hi': 'छत्तीसगढ',
      'ta': 'சத்தீஸ்கர்',
    },
    'ghmjefor': {
      'en': 'Goa',
      'hi': 'गोवा',
      'ta': 'கோவா',
    },
    'l054t2my': {
      'en': 'Gujarat',
      'hi': 'गुजरात',
      'ta': 'குஜராத்',
    },
    '9pqs1hls': {
      'en': 'Haryana',
      'hi': 'हरयाणा',
      'ta': 'ஹரியானா',
    },
    'nl0aehhw': {
      'en': 'Himachal Pradesh',
      'hi': 'हिमाचल प्रदेश',
      'ta': 'ஹிமாச்சல பிரதேசம்',
    },
    '2sbni61r': {
      'en': 'Jharkhand',
      'hi': 'झारखंड',
      'ta': 'ஜார்கண்ட்',
    },
    't6gaa248': {
      'en': 'Karnataka',
      'hi': 'कर्नाटक',
      'ta': 'கர்நாடகா',
    },
    'evamc7cg': {
      'en': 'Kerala',
      'hi': 'केरल',
      'ta': 'கேரளா',
    },
    'toi3az7u': {
      'en': 'Madhya Pradesh',
      'hi': 'मध्य प्रदेश',
      'ta': 'மத்திய பிரதேசம்',
    },
    'kzax1h6a': {
      'en': 'Maharashtra',
      'hi': 'महाराष्ट्र',
      'ta': 'மகாராஷ்டிரா',
    },
    '9k3woquo': {
      'en': 'Manipur',
      'hi': 'मणिपुर',
      'ta': 'மணிப்பூர்',
    },
    'doejikk4': {
      'en': 'Meghalaya',
      'hi': 'मेघालय',
      'ta': 'மேகாலயா',
    },
    'ei379ywm': {
      'en': 'Mizoram',
      'hi': 'मिजोरम',
      'ta': 'மிசோரம்',
    },
    '8vfvskij': {
      'en': 'Nagaland',
      'hi': 'नगालैंड',
      'ta': 'நாகாலாந்து',
    },
    'woja0w7s': {
      'en': 'Odisha',
      'hi': 'ओडिशा',
      'ta': 'ஒடிசா',
    },
    'xz5252yw': {
      'en': 'Punjab',
      'hi': 'पंजाब',
      'ta': 'பஞ்சாப்',
    },
    'eupmc1ky': {
      'en': 'Rajasthan',
      'hi': 'राजस्थान Rajasthan',
      'ta': 'ராஜஸ்தான்',
    },
    '6jlqgxpf': {
      'en': 'Sikkim',
      'hi': 'सिक्किम',
      'ta': 'சிக்கிம்',
    },
    '9gjg3jp8': {
      'en': 'Tamil Nadu',
      'hi': 'तमिलनाडु',
      'ta': 'தமிழ்நாடு',
    },
    'l8l9t2zl': {
      'en': 'Telangana',
      'hi': 'तेलंगाना',
      'ta': 'தெலுங்கானா',
    },
    'w2m3zusj': {
      'en': 'Tripura',
      'hi': 'त्रिपुरा',
      'ta': 'திரிபுரா',
    },
    '42rrjqp4': {
      'en': 'Uttar Pradesh',
      'hi': 'उतार प्रदेश।',
      'ta': 'உத்தரப்பிரதேசம்',
    },
    'go3llrc5': {
      'en': 'Uttarakhand',
      'hi': 'उत्तराखंड',
      'ta': 'உத்தரகாண்ட்',
    },
    'v9a9e7gw': {
      'en': 'West Bengal',
      'hi': 'पश्चिम बंगाल',
      'ta': 'மேற்கு வங்காளம்',
    },
    '4ryh3u94': {
      'en': 'Select state...',
      'hi': 'राज्य चुनें...',
      'ta': 'மாநிலத்தைத் தேர்ந்தெடு...',
    },
    'c6ewu5d2': {
      'en': 'Search your state...',
      'hi': 'अपना राज्य खोजें...',
      'ta': 'உங்கள் மாநிலத்தைத் தேடுங்கள்...',
    },
    '6urgmu88': {
      'en': 'City',
      'hi': 'शहर',
      'ta': 'நகரம்',
    },
    'wdtar0yd': {
      'en': 'City (eg. Jaipur)',
      'hi': 'शहर (जैसे जयपुर)',
      'ta': 'நகரம் (எ.கா. ஜெய்ப்பூர்)',
    },
    '2136rzfu': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'ta': 'மாற்றங்களை சேமியுங்கள்',
    },
    'yrtjmrhj': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // DiseaseDetection
  {
    'wasya3uo': {
      'en': 'Please choose one from below to identify disease.',
      'hi': 'कृपया रोग की पहचान करने के लिए नीचे से एक का चयन करें।',
      'ta': 'நோயைக் கண்டறிய கீழே உள்ள ஒன்றைத் தேர்ந்தெடுக்கவும்.',
    },
    'lxfcv7m1': {
      'en': 'Farm Animal',
      'hi': 'खेत के प्राणी',
      'ta': 'விவசாய விலங்கு',
    },
    '2q6r0mel': {
      'en': 'Crop Plant',
      'hi': 'फसल पौधा',
      'ta': 'பயிர் ஆலை',
    },
    '6av8d1ri': {
      'en': 'Next',
      'hi': 'अगला',
      'ta': 'அடுத்தது',
    },
    'kmjqoj6s': {
      'en': 'Upload a photo',
      'hi': 'फोटो अपलोड करें',
      'ta': 'ஒரு புகைப்படத்தை பதிவேற்ற',
    },
    'fz3on1v5': {
      'en': 'upload Image',
      'hi': 'तस्विर अपलोड करना',
      'ta': 'படத்தை பதிவேற்றம் செய்யவும்',
    },
    '87rrlq12': {
      'en': 'Next',
      'hi': 'अगला',
      'ta': 'அடுத்தது',
    },
    '3l9gb30t': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'pahz8yl1': {
      'en': 'Search',
      'hi': 'खोज',
      'ta': 'தேடு',
    },
    '7l3v3dul': {
      'en': 'Crops',
      'hi': 'फसलें',
      'ta': 'பயிர்கள்',
    },
    '8hpwqf1i': {
      'en': 'Next',
      'hi': 'अगला',
      'ta': 'அடுத்தது',
    },
    'wgk98gg0': {
      'en': 'Uploaded Photo',
      'hi': 'अपलोड की गई तस्वीर',
      'ta': 'பதிவேற்றப்பட்ட புகைப்படம்',
    },
    'dc5f3afd': {
      'en': 'Ask your Question/Problem',
      'hi': 'अपना प्रश्न/समस्या पूछें',
      'ta': 'உங்கள் கேள்வி/பிரச்சினையைக் கேளுங்கள்',
    },
    'pukwwi83': {
      'en': 'write your disease symptoms',
      'hi': 'अपनी बीमारी के लक्षण लिखें',
      'ta': 'உங்கள் நோய் அறிகுறிகளை எழுதுங்கள்',
    },
    'wqu88es8': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'irwgl5oi': {
      'en': 'Next',
      'hi': 'अगला',
      'ta': 'அடுத்தது',
    },
    'pign68cz': {
      'en': 'Save to Home',
      'hi': 'होम पर सहेजें',
      'ta': 'வீட்டில் சேமிக்கவும்',
    },
    'a3ikjgzq': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // TermsAndConditions
  {
    'y1izfs2v': {
      'en': 'Terms And Conditions',
      'hi': 'नियम और शर्तें',
      'ta': 'விதிமுறைகள் மற்றும் நிபந்தனைகள்',
    },
    'z8ypllso': {
      'en':
          'Welcome to Farmers-Help! These Terms and Conditions (\"Terms\") govern your use of our mobile app and services provided therein (\"App\"). By accessing or using the App, you agree to be bound by these Terms.',
      'hi':
          'फार्मर्स-हेल्प में आपका स्वागत है! ये नियम और शर्तें (\"नियम\") हमारे मोबाइल ऐप और उसमें दी गई सेवाओं (\"ऐप\") के आपके उपयोग को नियंत्रित करती हैं। ऐप तक पहुँचने या उसका उपयोग करके, आप इन शर्तों से बंधे होने के लिए सहमत होते हैं।',
      'ta':
          'விவசாயிகளுக்கு வரவேற்கிறோம்-உதவி! இந்த விதிமுறைகள் மற்றும் நிபந்தனைகள் (\"விதிமுறைகள்\") எங்கள் மொபைல் ஆப்ஸ் மற்றும் அதில் வழங்கப்பட்ட சேவைகளின் (\"ஆப்\") உங்கள் பயன்பாட்டை நிர்வகிக்கிறது. பயன்பாட்டை அணுகுவதன் மூலம் அல்லது பயன்படுத்துவதன் மூலம், இந்த விதிமுறைகளுக்குக் கட்டுப்படுவதை ஒப்புக்கொள்கிறீர்கள்.',
    },
    'pigo9fqp': {
      'en': '1. Acceptance of Terms',
      'hi': '1. शर्तों की स्वीकृति',
      'ta': '1. விதிமுறைகளை ஏற்றுக்கொள்வது',
    },
    'tr65c0jj': {
      'en':
          'By accessing or using the App, you agree to comply with these Terms. If you do not agree with any part of these Terms, you may not use the App.',
      'hi':
          'ऐप तक पहुँचने या उसका उपयोग करके, आप इन शर्तों का पालन करने के लिए सहमत होते हैं। यदि आप इन शर्तों के किसी भी भाग से सहमत नहीं हैं, तो आप ऐप का उपयोग नहीं कर सकते हैं।',
      'ta':
          'பயன்பாட்டை அணுகுவதன் மூலம் அல்லது பயன்படுத்துவதன் மூலம், இந்த விதிமுறைகளுக்கு இணங்க ஒப்புக்கொள்கிறீர்கள். இந்த விதிமுறைகளின் எந்தப் பகுதியையும் நீங்கள் ஏற்கவில்லை என்றால், நீங்கள் பயன்பாட்டைப் பயன்படுத்த முடியாது.',
    },
    '6e5ousa1': {
      'en': '2. Services',
      'hi': '2. सेवाएं',
      'ta': '2. சேவைகள்',
    },
    '0j6jxr9x': {
      'en':
          'Our App provides various services aimed at assisting farmers in growing their plants and crops more effectively. These services include but are not limited to:\n\na) Providing agricultural advice and recommendations based on data analysis and AI technology.\n\nb) Offering tools and resources for plant care, pest management, and crop optimization.\n\nc) Facilitating communication and collaboration among farmers and agricultural experts.\n\nd) Providing access to educational content, tutorials, and training materials related to farming practices.',
      'hi':
          'हमारा ऐप किसानों को उनके पौधों और फसलों को अधिक प्रभावी ढंग से उगाने में सहायता करने के उद्देश्य से विभिन्न सेवाएँ प्रदान करता है। इन सेवाओं में शामिल हैं, लेकिन इन्हीं तक सीमित नहीं हैं:\n\na) डेटा विश्लेषण और AI तकनीक के आधार पर कृषि सलाह और सिफारिशें प्रदान करना।\n\nb) पौधों की देखभाल, कीट प्रबंधन और फसल अनुकूलन के लिए उपकरण और संसाधन प्रदान करना।\n\nc) किसानों और कृषि विशेषज्ञों के बीच संचार और सहयोग को सुविधाजनक बनाना।\n\nd) खेती के तरीकों से संबंधित शैक्षिक सामग्री, ट्यूटोरियल और प्रशिक्षण सामग्री तक पहुँच प्रदान करना।',
      'ta':
          'எங்கள் பயன்பாடு விவசாயிகள் தங்கள் தாவரங்கள் மற்றும் பயிர்களை மிகவும் திறம்பட வளர்ப்பதற்கு உதவுவதை நோக்கமாகக் கொண்ட பல்வேறு சேவைகளை வழங்குகிறது. இந்த சேவைகளில் பின்வருவன அடங்கும் ஆனால் அவை மட்டும் அல்ல:\n\na) தரவு பகுப்பாய்வு மற்றும் AI தொழில்நுட்பத்தின் அடிப்படையில் விவசாய ஆலோசனைகள் மற்றும் பரிந்துரைகளை வழங்குதல்.\n\nb) தாவர பராமரிப்பு, பூச்சி மேலாண்மை மற்றும் பயிர் தேர்வுமுறைக்கான கருவிகள் மற்றும் வளங்களை வழங்குதல்.\n\nc) விவசாயிகள் மற்றும் விவசாய நிபுணர்களிடையே தொடர்பு மற்றும் ஒத்துழைப்பை எளிதாக்குதல்.\n\nd) விவசாய நடைமுறைகள் தொடர்பான கல்வி உள்ளடக்கம், பயிற்சிகள் மற்றும் பயிற்சிப் பொருட்களுக்கான அணுகலை வழங்குதல்.',
    },
    'sqos998x': {
      'en': '3. User Conduct',
      'hi': '3. उपयोगकर्ता का आचरण',
      'ta': '3. பயனர் நடத்தை',
    },
    'uv1kqfl2': {
      'en':
          'You agree to use the App in compliance with all applicable laws, regulations, and these Terms. You shall not:\n\na) Use the App for any unlawful or unauthorized purpose.\n\n b) Interfere with or disrupt the operation of the App or any servers or networks connected to the App.\n\nc)  Transmit any viruses, malware, or harmful code through the App.\n\nd)  Impersonate any person or entity, or falsely state or misrepresent your affiliation with any person or entity.',
      'hi':
          'आप सभी लागू कानूनों, विनियमों और इन शर्तों के अनुपालन में ऐप का उपयोग करने के लिए सहमत हैं। आपको ये नहीं करना चाहिए:\n\na) किसी भी गैरकानूनी या अनधिकृत उद्देश्य के लिए ऐप का उपयोग करना।\n\nb) ऐप या ऐप से जुड़े किसी भी सर्वर या नेटवर्क के संचालन में हस्तक्षेप या बाधा डालना।\n\nc) ऐप के माध्यम से कोई भी वायरस, मैलवेयर या हानिकारक कोड प्रसारित करना।\n\nd) किसी व्यक्ति या संस्था का प्रतिरूपण करना, या किसी व्यक्ति या संस्था के साथ अपने जुड़ाव को गलत तरीके से बताना या गलत तरीके से प्रस्तुत करना।',
      'ta':
          'பொருந்தக்கூடிய அனைத்து சட்டங்கள், விதிமுறைகள் மற்றும் இந்த விதிமுறைகளுக்கு இணங்க பயன்பாட்டைப் பயன்படுத்த ஒப்புக்கொள்கிறீர்கள். நீங்கள் வேண்டாம்:\n\nஅ) எந்தவொரு சட்டவிரோத அல்லது அங்கீகரிக்கப்படாத நோக்கத்திற்காக பயன்பாட்டைப் பயன்படுத்தவும்.\n\n ஆ) ஆப்ஸ் அல்லது ஆப்ஸுடன் இணைக்கப்பட்டுள்ள சர்வர்கள் அல்லது நெட்வொர்க்குகளின் செயல்பாட்டில் குறுக்கிடலாம் அல்லது சீர்குலைக்கலாம்.\n\nc) ஆப்ஸ் மூலம் ஏதேனும் வைரஸ்கள், தீம்பொருள் அல்லது தீங்கு விளைவிக்கும் குறியீட்டை அனுப்பவும்.\n\nஈ) எந்தவொரு நபராகவோ அல்லது நிறுவனமாகவோ ஆள்மாறாட்டம் செய்தல், அல்லது எந்தவொரு நபர் அல்லது நிறுவனத்துடனான உங்கள் தொடர்பை தவறாகக் குறிப்பிடுதல் அல்லது தவறாகக் குறிப்பிடுதல்.',
    },
    'p3lsfyva': {
      'en': '4. Privacy Policy',
      'hi': '4. गोपनीयता नीति',
      'ta': '4. தனியுரிமைக் கொள்கை',
    },
    'jmwsokit': {
      'en':
          'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and disclose your personal information when you use our App.',
      'hi':
          'आपकी गोपनीयता हमारे लिए महत्वपूर्ण है। कृपया हमारी गोपनीयता नीति की समीक्षा करें ताकि आप समझ सकें कि जब आप हमारे ऐप का उपयोग करते हैं तो हम आपकी व्यक्तिगत जानकारी कैसे एकत्रित करते हैं, उसका उपयोग करते हैं और उसका खुलासा करते हैं।',
      'ta':
          'உங்கள் தனியுரிமை எங்களுக்கு முக்கியம். எங்கள் பயன்பாட்டை நீங்கள் பயன்படுத்தும் போது உங்கள் தனிப்பட்ட தகவலை நாங்கள் எவ்வாறு சேகரிக்கிறோம், பயன்படுத்துகிறோம் மற்றும் வெளியிடுகிறோம் என்பதைப் புரிந்துகொள்ள, எங்கள் தனியுரிமைக் கொள்கையை மதிப்பாய்வு செய்யவும்.',
    },
    'oapkzluj': {
      'en': '5. Intellectual Property',
      'hi': '5. बौद्धिक संपदा',
      'ta': '5. அறிவுசார் சொத்து',
    },
    '4nh4zyf6': {
      'en':
          'All content, trademarks, logos, and intellectual property rights displayed on the App are owned by us or our licensors. You may not use, reproduce, or distribute any content from the App without our prior written consent.',
      'hi':
          'ऐप पर प्रदर्शित सभी सामग्री, ट्रेडमार्क, लोगो और बौद्धिक संपदा अधिकार हमारे या हमारे लाइसेंसधारकों के स्वामित्व में हैं। आप हमारी पूर्व लिखित सहमति के बिना ऐप से किसी भी सामग्री का उपयोग, पुनरुत्पादन या वितरण नहीं कर सकते हैं।',
      'ta':
          'பயன்பாட்டில் காட்டப்படும் அனைத்து உள்ளடக்கம், வர்த்தக முத்திரைகள், லோகோக்கள் மற்றும் அறிவுசார் சொத்துரிமைகள் எங்களுக்கு அல்லது எங்கள் உரிமதாரர்களுக்கு சொந்தமானது. எங்களின் முன் எழுத்துப்பூர்வ அனுமதியின்றி பயன்பாட்டிலிருந்து எந்த உள்ளடக்கத்தையும் நீங்கள் பயன்படுத்தவோ, மீண்டும் உருவாக்கவோ அல்லது விநியோகிக்கவோ கூடாது.',
    },
    'gtpyrzqm': {
      'en': '6. Disclaimer of Warranties',
      'hi': '6. वारंटी का अस्वीकरण',
      'ta': '6. உத்தரவாதங்களின் மறுப்பு',
    },
    'vcoxohub': {
      'en':
          'The App and its services are provided on an \"as-is\" and \"as-available\" basis, without warranties of any kind, either express or implied. We do not guarantee the accuracy, reliability, or completeness of any information provided through the App.',
      'hi':
          'ऐप और इसकी सेवाएँ \"जैसी हैं\" और \"जैसी उपलब्ध हैं\" के आधार पर प्रदान की जाती हैं, बिना किसी प्रकार की वारंटी के, चाहे वह व्यक्त हो या निहित। हम ऐप के माध्यम से प्रदान की गई किसी भी जानकारी की सटीकता, विश्वसनीयता या पूर्णता की गारंटी नहीं देते हैं।',
      'ta':
          'ஆப்ஸ் மற்றும் அதன் சேவைகள் \"உள்ளது\" மற்றும் \"கிடைக்கக்கூடியவை\" அடிப்படையில், வெளிப்படையான அல்லது மறைமுகமாக எந்தவிதமான உத்தரவாதங்களும் இல்லாமல் வழங்கப்படுகின்றன. பயன்பாட்டின் மூலம் வழங்கப்படும் எந்த தகவலின் துல்லியம், நம்பகத்தன்மை அல்லது முழுமைக்கு நாங்கள் உத்தரவாதம் அளிப்பதில்லை.',
    },
    'kn2akgjm': {
      'en': '7. Limitation of Liability',
      'hi': '7. दायित्व की सीमा',
      'ta': '7. பொறுப்பு வரம்பு',
    },
    'wi8me3ac': {
      'en':
          'In no event shall we be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App or its services, even if we have been advised of the possibility of such damages.',
      'hi':
          'किसी भी स्थिति में हम आपके द्वारा ऐप या इसकी सेवाओं के उपयोग से उत्पन्न या उससे संबंधित किसी भी अप्रत्यक्ष, आकस्मिक, विशेष या परिणामी क्षति के लिए उत्तरदायी नहीं होंगे, भले ही हमें ऐसी क्षति की संभावना के बारे में सूचित किया गया हो।',
      'ta':
          'ஆப்ஸ் அல்லது அதன் சேவைகளைப் பயன்படுத்துவதால் அல்லது அது தொடர்பாக ஏற்படும் மறைமுக, தற்செயலான, சிறப்பு அல்லது அதன் விளைவாக ஏற்படும் சேதங்களுக்கு நாங்கள் பொறுப்பாக மாட்டோம், அத்தகைய சேதங்களின் சாத்தியம் குறித்து எங்களுக்கு அறிவுறுத்தப்பட்டிருந்தாலும் கூட.',
    },
    'vagod26l': {
      'en': '8. Governing Law',
      'hi': '8. शासन कानून',
      'ta': '8. ஆளும் சட்டம்',
    },
    'l6czqexq': {
      'en':
          'These Terms shall be governed by and construed in accordance with the laws, without regard to its conflict of law provisions.',
      'hi':
          'ये नियम कानून के प्रावधानों के टकराव की परवाह किए बिना, कानून के अनुसार शासित और व्याख्या किए जाएंगे।',
      'ta':
          'இந்த விதிமுறைகள் சட்ட விதிகளின் முரண்பாட்டைப் பொருட்படுத்தாமல், சட்டங்களுக்கு இணங்க நிர்வகிக்கப்படும் மற்றும் நிர்வகிக்கப்படும்.',
    },
    '3vagjl2p': {
      'en': '9. Changes to Terms',
      'hi': '9. शर्तों में परिवर्तन',
      'ta': '9. விதிமுறைகளில் மாற்றங்கள்',
    },
    'usq9fi6m': {
      'en':
          'We reserve the right to modify or update these Terms at any time. Your continued use of the App after any changes indicates your acceptance of the modified Terms.',
      'hi':
          'हम किसी भी समय इन शर्तों को संशोधित या अपडेट करने का अधिकार सुरक्षित रखते हैं। किसी भी बदलाव के बाद ऐप का आपका निरंतर उपयोग संशोधित शर्तों की आपकी स्वीकृति को दर्शाता है।',
      'ta':
          'இந்த விதிமுறைகளை எந்த நேரத்திலும் மாற்ற அல்லது புதுப்பிக்க எங்களுக்கு உரிமை உள்ளது. ஏதேனும் மாற்றங்களுக்குப் பிறகு நீங்கள் பயன்பாட்டைத் தொடர்ந்து பயன்படுத்துவது, மாற்றியமைக்கப்பட்ட விதிமுறைகளை நீங்கள் ஏற்றுக்கொண்டதைக் குறிக்கிறது.',
    },
    'hwfh5blt': {
      'en': '10. Contact Us',
      'hi': '10. हमसे संपर्क करें',
      'ta': '10. எங்களை தொடர்பு கொள்ளவும்',
    },
    'xvark6qh': {
      'en':
          'If you have any questions or concerns about these Terms, please contact us at info@flutterflowdevs.com.',
      'hi':
          'यदि आपके पास इन शर्तों के बारे में कोई प्रश्न या चिंता है, तो कृपया हमसे info@flutterflowdevs.com पर संपर्क करें।',
      'ta':
          'இந்த விதிமுறைகளைப் பற்றி ஏதேனும் கேள்விகள் அல்லது கவலைகள் இருந்தால், info@flutterflowdevs.com இல் எங்களைத் தொடர்பு கொள்ளவும்.',
    },
    'wm2ouy0a': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // PrivacyAndPolicy
  {
    'jffi62ux': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
      'ta': 'தனியுரிமைக் கொள்கை',
    },
    'bufhn50m': {
      'en':
          'At Farm Help, we value the privacy and security of our users. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our ecommerce app and services. By accessing or using our app, you consent to the practices described in this policy.',
      'hi':
          'फ़ार्म हेल्प में, हम अपने उपयोगकर्ताओं की गोपनीयता और सुरक्षा को महत्व देते हैं। यह गोपनीयता नीति बताती है कि जब आप हमारे ईकॉमर्स ऐप और सेवाओं का उपयोग करते हैं तो हम आपकी व्यक्तिगत जानकारी कैसे एकत्रित करते हैं, उसका उपयोग करते हैं और उसकी सुरक्षा करते हैं। हमारे ऐप तक पहुँचने या उसका उपयोग करके, आप इस नीति में वर्णित प्रथाओं के लिए सहमति देते हैं।',
      'ta':
          'பண்ணை உதவியில், எங்கள் பயனர்களின் தனியுரிமை மற்றும் பாதுகாப்பை நாங்கள் மதிக்கிறோம். இந்த தனியுரிமைக் கொள்கையானது, எங்கள் இணையவழி ஆப்ஸ் மற்றும் சேவைகளை நீங்கள் பயன்படுத்தும் போது, ​​உங்கள் தனிப்பட்ட தகவல்களை நாங்கள் எவ்வாறு சேகரிக்கிறோம், பயன்படுத்துகிறோம் மற்றும் பாதுகாப்போம் என்பதை கோடிட்டுக் காட்டுகிறது. எங்கள் பயன்பாட்டை அணுகுவதன் மூலம் அல்லது பயன்படுத்துவதன் மூலம், இந்தக் கொள்கையில் விவரிக்கப்பட்டுள்ள நடைமுறைகளுக்கு நீங்கள் ஒப்புக்கொள்கிறீர்கள்.',
    },
    'fsye8mee': {
      'en': '1. Information We Collect:',
      'hi': '1. हमारे द्वारा एकत्रित जानकारी:',
      'ta': '1. நாங்கள் சேகரிக்கும் தகவல்:',
    },
    '05natrgr': {
      'en':
          'i) Personal Information: When you create an account, place an order, or interact with our app, we may collect personal information such as your name, email address, shipping address, and payment details.\n\nii) Usage Information: We gather information about how you use our app, including the pages you visit, products you view, and interactions with features or advertisements.',
      'hi':
          'i) व्यक्तिगत जानकारी: जब आप कोई खाता बनाते हैं, कोई ऑर्डर देते हैं, या हमारे ऐप से इंटरैक्ट करते हैं, तो हम आपका नाम, ईमेल पता, शिपिंग पता और भुगतान विवरण जैसी व्यक्तिगत जानकारी एकत्र कर सकते हैं।\n\nii) उपयोग की जानकारी: हम इस बारे में जानकारी एकत्र करते हैं कि आप हमारे ऐप का उपयोग कैसे करते हैं, जिसमें आपके द्वारा देखे जाने वाले पेज, आपके द्वारा देखे जाने वाले उत्पाद और सुविधाओं या विज्ञापनों के साथ इंटरैक्शन शामिल हैं।',
      'ta':
          'i) தனிப்பட்ட தகவல்: நீங்கள் ஒரு கணக்கை உருவாக்கும்போது, ​​ஆர்டர் செய்யும்போது அல்லது எங்கள் ஆப்ஸுடன் தொடர்பு கொள்ளும்போது, ​​உங்கள் பெயர், மின்னஞ்சல் முகவரி, ஷிப்பிங் முகவரி மற்றும் கட்டண விவரங்கள் போன்ற தனிப்பட்ட தகவல்களை நாங்கள் சேகரிக்கலாம்.\n\nii) பயன்பாட்டுத் தகவல்: நீங்கள் பார்வையிடும் பக்கங்கள், நீங்கள் பார்க்கும் தயாரிப்புகள் மற்றும் அம்சங்கள் அல்லது விளம்பரங்களுடனான தொடர்புகள் உட்பட, எங்கள் பயன்பாட்டை எவ்வாறு பயன்படுத்துகிறீர்கள் என்பது பற்றிய தகவலை நாங்கள் சேகரிக்கிறோம்.',
    },
    'fv7ynkr1': {
      'en': '2. How We Use Your Information:',
      'hi': '2. हम आपकी जानकारी का उपयोग कैसे करते हैं:',
      'ta': '2. உங்கள் தகவலை நாங்கள் எவ்வாறு பயன்படுத்துகிறோம்:',
    },
    'n1snpnqh': {
      'en':
          'i) Personalization: We use your information to provide personalized experiences, such as displaying relevant products, recommendations, or tailored marketing communications.\n\nii) Order Processing: We use your information to process and fulfill your orders, including payment processing, shipping, and customer support.\n\niii) Communication: We may contact you with order updates, promotional offers, or important service announcements. You can opt-out of receiving marketing communications at any time.\n\niv) Improving Our Services: We analyze usage data to improve our app, enhance user experience, and optimize our product offerings.',
      'hi':
          'i) वैयक्तिकरण: हम आपकी जानकारी का उपयोग वैयक्तिकृत अनुभव प्रदान करने के लिए करते हैं, जैसे कि प्रासंगिक उत्पाद, अनुशंसाएँ या अनुरूपित विपणन संचार प्रदर्शित करना।\n\nii) ऑर्डर प्रोसेसिंग: हम आपके ऑर्डर को प्रोसेस करने और पूरा करने के लिए आपकी जानकारी का उपयोग करते हैं, जिसमें भुगतान प्रोसेसिंग, शिपिंग और ग्राहक सहायता शामिल है।\n\niii) संचार: हम ऑर्डर अपडेट, प्रचार ऑफ़र या महत्वपूर्ण सेवा घोषणाओं के साथ आपसे संपर्क कर सकते हैं। आप किसी भी समय मार्केटिंग संचार प्राप्त करने से ऑप्ट-आउट कर सकते हैं।\n\niv) हमारी सेवाओं में सुधार: हम अपने ऐप को बेहतर बनाने, उपयोगकर्ता अनुभव को बढ़ाने और अपने उत्पाद ऑफ़रिंग को अनुकूलित करने के लिए उपयोग डेटा का विश्लेषण करते हैं।',
      'ta':
          'i) தனிப்பயனாக்கம்: தொடர்புடைய தயாரிப்புகள், பரிந்துரைகள் அல்லது வடிவமைக்கப்பட்ட சந்தைப்படுத்தல் தகவல்தொடர்புகளைக் காண்பிப்பது போன்ற தனிப்பயனாக்கப்பட்ட அனுபவங்களை வழங்க உங்கள் தகவலைப் பயன்படுத்துகிறோம்.\n\nii) ஆர்டர் செயலாக்கம்: கட்டணச் செயலாக்கம், ஷிப்பிங் மற்றும் வாடிக்கையாளர் ஆதரவு உள்ளிட்ட உங்கள் ஆர்டர்களைச் செயல்படுத்தவும் நிறைவேற்றவும் உங்கள் தகவலைப் பயன்படுத்துகிறோம்.\n\niii) தொடர்பு: ஆர்டர் புதுப்பிப்புகள், விளம்பரச் சலுகைகள் அல்லது முக்கியமான சேவை அறிவிப்புகளுடன் நாங்கள் உங்களைத் தொடர்பு கொள்ளலாம். நீங்கள் எந்த நேரத்திலும் மார்க்கெட்டிங் தகவல்தொடர்புகளைப் பெறுவதைத் தவிர்க்கலாம்.\n\niv) எங்கள் சேவைகளை மேம்படுத்துதல்: எங்கள் பயன்பாட்டை மேம்படுத்தவும், பயனர் அனுபவத்தை மேம்படுத்தவும், எங்கள் தயாரிப்பு சலுகைகளை மேம்படுத்தவும் பயன்பாட்டுத் தரவை நாங்கள் பகுப்பாய்வு செய்கிறோம்.',
    },
    'kl2msotj': {
      'en': '3. Information Sharing:',
      'hi': '3. सूचना साझा करना:',
      'ta': '3. தகவல் பகிர்வு:',
    },
    'bv8zhplh': {
      'en':
          'i) Third-Party Service Providers: We may share your information with trusted third-party service providers who assist us in operating our app, processing payments, or delivering products.\n\nii) Legal Requirements: We may disclose your information in response to legal processes or when required by law to protect our rights, safety, or the rights and safety of others.',
      'hi':
          'i) तृतीय-पक्ष सेवा प्रदाता: हम आपकी जानकारी को विश्वसनीय तृतीय-पक्ष सेवा प्रदाताओं के साथ साझा कर सकते हैं जो हमारे ऐप को संचालित करने, भुगतान संसाधित करने या उत्पाद वितरित करने में हमारी सहायता करते हैं।\n\nii) कानूनी आवश्यकताएँ: हम कानूनी प्रक्रियाओं के जवाब में या हमारे अधिकारों, सुरक्षा या दूसरों के अधिकारों और सुरक्षा की रक्षा के लिए कानून द्वारा आवश्यक होने पर आपकी जानकारी का खुलासा कर सकते हैं।',
      'ta':
          'i) மூன்றாம் தரப்பு சேவை வழங்குநர்கள்: எங்கள் பயன்பாட்டை இயக்க, பணம் செலுத்துதல் அல்லது தயாரிப்புகளை வழங்குதல் ஆகியவற்றில் எங்களுக்கு உதவும் நம்பகமான மூன்றாம் தரப்பு சேவை வழங்குநர்களுடன் உங்கள் தகவலை நாங்கள் பகிர்ந்து கொள்ளலாம்.\n\nii) சட்டத் தேவைகள்: சட்டப்பூர்வ செயல்முறைகளுக்குப் பதிலளிக்கும் வகையில் அல்லது எங்கள் உரிமைகள், பாதுகாப்பு அல்லது பிறரின் உரிமைகள் மற்றும் பாதுகாப்பைப் பாதுகாக்க சட்டத்தால் தேவைப்படும்போது உங்கள் தகவலை நாங்கள் வெளியிடலாம்.',
    },
    'zdmejttk': {
      'en': '4. Data Security:',
      'hi': '4. डेटा सुरक्षा:',
      'ta': '4. தரவு பாதுகாப்பு:',
    },
    '9myv36dr': {
      'en':
          'i) We employ industry-standard security measures to protect your personal information from unauthorized access, misuse, or loss.\n\nii) However, please note that no data transmission or storage system can be guaranteed to be 100% secure. We cannot ensure the absolute security of your information.',
      'hi':
          'i) हम आपकी व्यक्तिगत जानकारी को अनधिकृत पहुँच, दुरुपयोग या हानि से बचाने के लिए उद्योग-मानक सुरक्षा उपाय अपनाते हैं।\n\nii) हालाँकि, कृपया ध्यान दें कि किसी भी डेटा ट्रांसमिशन या स्टोरेज सिस्टम की 100% सुरक्षा की गारंटी नहीं दी जा सकती। हम आपकी जानकारी की पूर्ण सुरक्षा सुनिश्चित नहीं कर सकते।',
      'ta':
          'i) அங்கீகரிக்கப்படாத அணுகல், தவறான பயன்பாடு அல்லது இழப்பு ஆகியவற்றிலிருந்து உங்கள் தனிப்பட்ட தகவலைப் பாதுகாக்க, தொழில்துறை-தரமான பாதுகாப்பு நடவடிக்கைகளை நாங்கள் பயன்படுத்துகிறோம்.\n\nii) இருப்பினும், தரவு பரிமாற்றம் அல்லது சேமிப்பக அமைப்பு 100% பாதுகாப்பானது என்று உத்தரவாதம் அளிக்க முடியாது என்பதை நினைவில் கொள்ளவும். உங்கள் தகவலின் முழுமையான பாதுகாப்பை எங்களால் உறுதிப்படுத்த முடியாது.',
    },
    'rs4cp7vf': {
      'en': '5. Your Choices:',
      'hi': '5. आपके विकल्प:',
      'ta': '5. உங்கள் விருப்பங்கள்:',
    },
    'q9rtvb5l': {
      'en':
          'i) Account Settings: You can review and update your account information and communication preferences by accessing your account settings.\n\nii) Cookies and Tracking Technologies: You have the option to manage cookies and tracking technologies through your device or browser settings.\n',
      'hi':
          'i) खाता सेटिंग: आप अपनी खाता सेटिंग तक पहुँच कर अपनी खाता जानकारी और संचार प्राथमिकताओं की समीक्षा और अद्यतन कर सकते हैं।\n\nii) कुकीज़ और ट्रैकिंग प्रौद्योगिकियाँ: आपके पास अपनी डिवाइस या ब्राउज़र सेटिंग के माध्यम से कुकीज़ और ट्रैकिंग तकनीकों को प्रबंधित करने का विकल्प है।',
      'ta':
          'i) கணக்கு அமைப்புகள்: உங்கள் கணக்கு அமைப்புகளை அணுகுவதன் மூலம் உங்கள் கணக்குத் தகவல் மற்றும் தகவல் தொடர்பு விருப்பங்களை மதிப்பாய்வு செய்து புதுப்பிக்கலாம்.\n\nii) குக்கீகள் மற்றும் கண்காணிப்பு தொழில்நுட்பங்கள்: உங்கள் சாதனம் அல்லது உலாவி அமைப்புகள் மூலம் குக்கீகள் மற்றும் கண்காணிப்பு தொழில்நுட்பங்களை நிர்வகிக்க உங்களுக்கு விருப்பம் உள்ளது.',
    },
    '8ukg0unv': {
      'en': '6. Children\'s Privacy:',
      'hi': '6. बच्चों की गोपनीयता:',
      'ta': '6. குழந்தைகளின் தனியுரிமை:',
    },
    'e8tc87q0': {
      'en':
          'Our app is not intended for individuals under the age of 13. We do not knowingly collect personal information from children. If you become aware that your child has provided us with personal information, please contact us to have it removed.',
      'hi':
          'हमारा ऐप 13 वर्ष से कम आयु के व्यक्तियों के लिए नहीं है। हम जानबूझकर बच्चों से व्यक्तिगत जानकारी एकत्र नहीं करते हैं। यदि आपको पता चलता है कि आपके बच्चे ने हमें व्यक्तिगत जानकारी प्रदान की है, तो कृपया इसे हटाने के लिए हमसे संपर्क करें।',
      'ta':
          'எங்கள் பயன்பாடு 13 வயதுக்குட்பட்ட நபர்களுக்காக அல்ல. குழந்தைகளிடமிருந்து தனிப்பட்ட தகவல்களை நாங்கள் தெரிந்தே சேகரிப்பதில்லை. உங்கள் குழந்தை எங்களுக்குத் தனிப்பட்ட தகவலை வழங்கியது உங்களுக்குத் தெரிந்தால், அதை அகற்ற எங்களைத் தொடர்பு கொள்ளவும்.',
    },
    'ys7czstm': {
      'en': '7. Updates to this Policy:',
      'hi': '7. इस नीति में अद्यतन:',
      'ta': '7. இந்தக் கொள்கைக்கான புதுப்பிப்புகள்:',
    },
    '5rjme14h': {
      'en':
          'We may update this Privacy Policy from time to time. We encourage you to review the latest version whenever you use our app.',
      'hi':
          'हम समय-समय पर इस गोपनीयता नीति को अपडेट कर सकते हैं। हम आपको प्रोत्साहित करते हैं कि जब भी आप हमारे ऐप का उपयोग करें तो नवीनतम संस्करण की समीक्षा करें।',
      'ta':
          'இந்த தனியுரிமைக் கொள்கையை நாங்கள் அவ்வப்போது புதுப்பிக்கலாம். எங்கள் பயன்பாட்டை நீங்கள் பயன்படுத்தும் போதெல்லாம் சமீபத்திய பதிப்பை மதிப்பாய்வு செய்ய நாங்கள் உங்களை ஊக்குவிக்கிறோம்.',
    },
    '1uo0odbw': {
      'en': '8. Governing Law',
      'hi': '8. शासन कानून',
      'ta': '8. ஆளும் சட்டம்',
    },
    '69a1l9v3': {
      'en':
          'These Terms shall be governed by and construed in accordance with the laws, without regard to its conflict of law provisions.',
      'hi':
          'ये नियम कानून के प्रावधानों के टकराव की परवाह किए बिना, कानून के अनुसार शासित और व्याख्या किए जाएंगे।',
      'ta':
          'இந்த விதிமுறைகள் சட்ட விதிகளின் முரண்பாட்டைப் பொருட்படுத்தாமல், சட்டங்களுக்கு இணங்க நிர்வகிக்கப்படும் மற்றும் நிர்வகிக்கப்படும்.',
    },
    'yu4uslo6': {
      'en':
          'If you have any questions or concerns regarding our Privacy Policy, please contact us at info@flutterflowdevs.com.',
      'hi':
          'यदि आपको हमारी गोपनीयता नीति के बारे में कोई प्रश्न या चिंता है, तो कृपया हमसे info@flutterflowdevs.com पर संपर्क करें।',
      'ta':
          'எங்கள் தனியுரிமைக் கொள்கை தொடர்பாக ஏதேனும் கேள்விகள் அல்லது கவலைகள் இருந்தால், info@flutterflowdevs.com இல் எங்களைத் தொடர்பு கொள்ளவும்.',
    },
    'x165g42y': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // DiagnosesList
  {
    '82ef15ru': {
      'en': 'Diagnoses List',
      'hi': 'निदान सूची',
      'ta': 'நோய் கண்டறிதல் பட்டியல்',
    },
    'zx66ppit': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // DiagnoseDetail
  {
    '27slxazp': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // HomePageCopy
  {
    '465kh3x8': {
      'en': 'Hi, ',
      'hi': '',
      'ta': '',
    },
    'oxujtuvg': {
      'en': '!',
      'hi': '',
      'ta': '',
    },
    'pfw2shqe': {
      'en': '\nExplore Help',
      'hi': '',
      'ta': '',
    },
    '03ay1k3k': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // DiseasesDetectCopy
  {
    'pcm18hrk': {
      'en': 'Upload  a photo',
      'hi': 'फोटो अपलोड करें',
      'ta': 'ஒரு புகைப்படத்தை பதிவேற்ற',
    },
    'drhdwu9u': {
      'en': 'upload Image',
      'hi': 'तस्विर अपलोड करना',
      'ta': 'படத்தை பதிவேற்றம் செய்யவும்',
    },
    'rqb6kpgr': {
      'en': 'Ask your Question/Problem',
      'hi': 'अपना प्रश्न/समस्या पूछें',
      'ta': 'உங்கள் கேள்வி/பிரச்சினையைக் கேளுங்கள்',
    },
    '5023ggtp': {
      'en': 'write your disease symptoms',
      'hi': '',
      'ta': '',
    },
    'ibnc3nxk': {
      'en': 'Next',
      'hi': 'अगला',
      'ta': 'அடுத்தது',
    },
    '42ubhfla': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // VideoPromptPage
  {
    'apzt2bqo': {
      'en': 'Video Prompt Page',
      'hi': 'वीडियो प्रॉम्प्ट पेज',
      'ta': 'வீடியோ ப்ராம்ட் பக்கம்',
    },
    '9s810xqk': {
      'en': 'Static',
      'hi': 'स्थिर',
      'ta': 'நிலையான',
    },
    '5p1hxm0o': {
      'en': 'Prompt One, Hello flutterflow deverlopers',
      'hi': 'संकेत एक, नमस्कार फ़्लटरफ़्लो डेवलपर्स',
      'ta': 'ப்ராம்ட் ஒன், ஹலோ ஃப்ளட்டர்ஃப்ளோ டெவெர்லப்பர்ஸ்',
    },
    'ttkyenwa': {
      'en': 'Prompt Two, Hello flutterflow deverlopers',
      'hi': 'संकेत दो, नमस्कार फ़्लटरफ़्लो डेवलपर्स',
      'ta': 'ப்ராம்ட் டூ, ஹலோ ஃப்ளட்டர்ஃப்ளோ டெவெர்லப்பர்ஸ்',
    },
    'zqonng1d': {
      'en': 'Prompt Three, Hello flutterflow deverlopers',
      'hi': 'संकेत तीन, नमस्कार फ़्लटरफ़्लो डेवलपर्स',
      'ta': 'ப்ராம்ட் த்ரீ, ஹலோ ஃப்ளட்டர்ஃப்ளோ டெவலப்பர்ஸ்',
    },
    'a7wr3bj3': {
      'en': 'Prompt Four, Hello flutterflow deverlopers',
      'hi': 'संकेत चार, नमस्कार फ़्लटरफ़्लो डेवलपर्स',
      'ta': 'ப்ராம்ப்ட் ஃபோர், ஹலோ ஃப்ளட்டர்ஃப்ளோ டெவெர்லப்பர்ஸ்',
    },
    'rqf0rdcw': {
      'en': 'Write down your question...',
      'hi': 'अपना प्रश्न लिखें...',
      'ta': 'உங்கள் கேள்வியை எழுதுங்கள்...',
    },
    'm016gkdc': {
      'en': 'Go',
      'hi': 'जाना',
      'ta': 'போ',
    },
    'mr825jdr': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // GeneratedVideoPage
  {
    '2iy66jom': {
      'en': 'Generated Video Page',
      'hi': 'उत्पन्न वीडियो पृष्ठ',
      'ta': 'உருவாக்கப்பட்ட வீடியோ பக்கம்',
    },
    'qb7jddbc': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // Demo
  {
    'zh1g7dgq': {
      'en': 'Hello World',
      'hi': '',
      'ta': '',
    },
    'gy82r67a': {
      'en': 'Page Title',
      'hi': '',
      'ta': '',
    },
    'owbbpypd': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // Categories_Container
  {
    '0dfwxmrk': {
      'en': 'Crop Practice',
      'hi': 'फसल अभ्यास',
      'ta': '',
    },
    'gut4px3q': {
      'en': 'Machinary',
      'hi': 'मशीनरी',
      'ta': '',
    },
    'ilspg6wd': {
      'en': 'Machinary',
      'hi': 'मशीनरी',
      'ta': '',
    },
    'lfubb9ab': {
      'en': 'CROP PRACTICE',
      'hi': 'फसल अभ्यास',
      'ta': '',
    },
    '3325x5jo': {
      'en':
          'It is a long established fact that a reader will be distracted by ',
      'hi': 'यह एक स्थापित तथ्य है कि एक पाठक का ध्यान भटक जाएगा।',
      'ta': '',
    },
  },
  // Search_TextField
  {
    'qjuzq5fy': {
      'en': 'Search',
      'hi': 'खोज',
      'ta': '',
    },
  },
  // Weather_Container
  {
    'hpr41url': {
      'en': 'Today\'s weather updates ',
      'hi': 'आज का मौसम अपडेट',
      'ta': 'இன்றைய வானிலை அறிவிப்புகள்',
    },
    'srtbbyrr': {
      'en': 'Max : ',
      'hi': 'अधिकतम :',
      'ta': '',
    },
    'lm142kby': {
      'en': 'Min : ',
      'hi': 'न्यूनतम :',
      'ta': '',
    },
  },
  // Categories_Container1
  {
    'aj26bz4k': {
      'en': 'Services',
      'hi': 'सेवाएं',
      'ta': 'சேவைகள்',
    },
    'w8vkn1kp': {
      'en': 'Identify Disease',
      'hi': 'रोग की पहचान करें',
      'ta': 'நோயை அடையாளம் காணவும்',
    },
    'l8imtss0': {
      'en': 'Farming Tutorial ',
      'hi': 'खेती ट्यूटोरियल',
      'ta': 'விவசாய பயிற்சி',
    },
    '7nc4qll9': {
      'en': 'Virtual Assistant',
      'hi': 'आभासी सहायक',
      'ta': 'மெய்நிகர் உதவியாளர்',
    },
  },
  // yourDiagnoses
  {
    'gx5cg41g': {
      'en': 'Your Diagnoses',
      'hi': 'आपका निदान',
      'ta': 'உங்கள் நோயறிதல்கள்',
    },
    'm1a19t9k': {
      'en': 'View all',
      'hi': 'सभी को देखें',
      'ta': 'அனைத்தையும் காட்டு',
    },
  },
  // emptyListView
  {
    'b1512vpb': {
      'en': 'No Diagnose Result Available',
      'hi': 'कोई निदान परिणाम उपलब्ध नहीं',
      'ta': 'நோய் கண்டறிதல் முடிவுகள் கிடைக்கவில்லை',
    },
  },
  // Miscellaneous
  {
    'qbw2uwy3': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'ncpny661': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'qphmdu7a': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'avgarw5k': {
      'en':
          'In order to get speech to text working, this app requires permission to access the microphone',
      'hi': '',
      'ta': '',
    },
    'g0d0ddu8': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'qjkdtxsb': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'vt6i22hl': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'nyl84g2t': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'i8lovdx4': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '6z5t8q8q': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'q2enafjv': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'ilh1hh6v': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'hxxlix1o': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'e05dsw9s': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'jxra8ubc': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'j8kh1ojv': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '117ipk0m': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'jb9k4mtq': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'usfu6ort': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'cq92h1dr': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '5ew8zins': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '2hpzt78w': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'wvasxgjm': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'wgehw5cs': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'xn5jtjdz': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'u8ype0jb': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'vzvhu878': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '2vz70vgd': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'beep3tn8': {
      'en': '',
      'hi': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
