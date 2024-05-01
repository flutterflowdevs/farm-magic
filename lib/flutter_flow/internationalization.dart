import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'pt', 'sw'];

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
    String? ptText = '',
    String? swText = '',
  }) =>
      [enText, hiText, ptText, swText][languageIndex] ?? '';

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
      'pt': 'Oi,',
      'sw': 'Habari,',
    },
    '8h0nglqo': {
      'en': '\nExplore Farm Magic  ',
      'hi': '\nफार्म मैजिक का अन्वेषण करें',
      'pt': '\nExplore a magia da fazenda',
      'sw': '\nGundua Uchawi wa Shamba',
    },
    'kf12c3yv': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // Onboarding
  {
    'raiejvye': {
      'en': 'Farmers',
      'hi': 'किसानों',
      'pt': 'Agricultores',
      'sw': 'Wakulima',
    },
    'co9cuclt': {
      'en':
          'A farmer is a person engaged in agriculture, raising living organisms for food or raw materials.[1] The term usually applies to people who do some combination of raising field crops, orchards, vineyards, poultry, or other livestock.',
      'hi':
          'किसान वह व्यक्ति होता है जो कृषि में लगा होता है, भोजन या कच्चे माल के लिए जीवित जीवों को पालता है।[1] यह शब्द आमतौर पर उन लोगों पर लागू होता है जो खेत की फ़सलों, बागों, अंगूर के बागों, मुर्गी पालन या अन्य पशुधन को पालने का कुछ संयोजन करते हैं।',
      'pt':
          'Um agricultor é uma pessoa envolvida na agricultura, criando organismos vivos para alimentação ou matéria-prima.[1] O termo geralmente se aplica a pessoas que fazem alguma combinação de cultivo de culturas arvenses, pomares, vinhedos, aves ou outros animais.',
      'sw':
          'Mkulima ni mtu anayejishughulisha na kilimo, akiinua viumbe hai kwa ajili ya chakula au malighafi.[1] Neno hili kwa kawaida hutumika kwa watu ambao hufanya mchanganyiko fulani wa kukuza mazao ya shambani, bustani, mizabibu, kuku, au mifugo mingine.',
    },
    'b9lp1kl9': {
      'en': 'Agri Experts',
      'hi': 'कृषि विशेषज्ञ',
      'pt': 'Especialistas agrícolas',
      'sw': 'Wataalamu wa Kilimo',
    },
    'juf07jfx': {
      'en':
          'Agricultural Scientist is the one who is a specialist in analyzing farming methods and production methods to enhance safety and crop yield.',
      'hi':
          'कृषि वैज्ञानिक वह व्यक्ति होता है जो सुरक्षा और फसल उपज बढ़ाने के लिए खेती के तरीकों और उत्पादन विधियों का विश्लेषण करने में विशेषज्ञ होता है।',
      'pt':
          'Cientista Agrícola é aquele que é especialista na análise de métodos agrícolas e de produção para aumentar a segurança e o rendimento das culturas.',
      'sw':
          'Mwanasayansi wa Kilimo ndiye mtaalamu wa kuchambua mbinu za kilimo na mbinu za uzalishaji ili kuimarisha usalama na mavuno ya mazao.',
    },
    '8ek3xt24': {
      'en': 'Agri Study',
      'hi': 'कृषि अध्ययन',
      'pt': 'Estudo Agrícola',
      'sw': 'Utafiti wa Kilimo',
    },
    'hfmhkcy5': {
      'en':
          'Agriculture course is an academic discipline of Science that involves the study of various scientific, technical and business subjects related to Agriculture, Horticulture, Farm Management, Poultry Farming, Dairy Farming, Agricultural Biotechnology, etc',
      'hi':
          'कृषि पाठ्यक्रम विज्ञान का एक अकादमिक अनुशासन है जिसमें कृषि, बागवानी, फार्म प्रबंधन, मुर्गीपालन, डेयरी फार्मिंग, कृषि जैव प्रौद्योगिकी आदि से संबंधित विभिन्न वैज्ञानिक, तकनीकी और व्यावसायिक विषयों का अध्ययन शामिल है।',
      'pt':
          'O curso de Agricultura é uma disciplina acadêmica de Ciências que envolve o estudo de diversas disciplinas científicas, técnicas e empresariais relacionadas à Agricultura, Horticultura, Gestão Agrícola, Avicultura, Produção Leiteira, Biotecnologia Agrícola, etc.',
      'sw':
          'Kozi ya Kilimo ni taaluma ya taaluma ya Sayansi inayohusisha masomo mbalimbali ya kisayansi, ufundi na biashara yanayohusiana na Kilimo, Kilimo cha bustani, Usimamizi wa Mashamba, Ufugaji wa kuku, Ufugaji wa Maziwa, Kilimo Bioteknolojia, n.k.',
    },
    'm2fwl0gn': {
      'en': 'Agri Store',
      'hi': 'एग्री स्टोर',
      'pt': 'Agri Store',
      'sw': 'Hifadhi ya Kilimo',
    },
    'm5dsgxsj': {
      'en':
          'A supermarket is a self-service shop offering a wide variety of food, beverages and household products, organized into sections. This kind of store is larger and has a wider selection than earlier grocery stores, but is smaller and more limited in the range of merchandise than  big-box market.',
      'hi':
          'सुपरमार्केट एक स्व-सेवा दुकान है जो विभिन्न प्रकार के खाद्य पदार्थ, पेय पदार्थ और घरेलू उत्पाद प्रदान करती है, जिन्हें खंडों में व्यवस्थित किया जाता है। इस तरह की दुकान पहले की किराने की दुकानों की तुलना में बड़ी होती है और इसमें व्यापक चयन होता है, लेकिन यह बड़े बॉक्स बाज़ार की तुलना में छोटी और माल की सीमा में अधिक सीमित होती है।',
      'pt':
          'Um supermercado é uma loja self-service que oferece uma grande variedade de alimentos, bebidas e produtos domésticos, organizados em seções. Esse tipo de loja é maior e tem uma seleção mais ampla do que os supermercados anteriores, mas é menor e mais limitado na variedade de mercadorias do que o mercado grande.',
      'sw':
          'Duka kuu ni duka la kujihudumia linalotoa aina mbalimbali za vyakula, vinywaji na bidhaa za nyumbani, zilizopangwa katika sehemu. Duka la aina hii ni kubwa na lina chaguo pana zaidi kuliko maduka ya awali ya mboga, lakini ni ndogo na yenye ukomo zaidi katika anuwai ya bidhaa kuliko soko la sanduku kubwa.',
    },
    'kzywycrm': {
      'en': ' Next ',
      'hi': 'अगला',
      'pt': 'Próximo',
      'sw': 'Inayofuata',
    },
    'p7uqcp6x': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // Login
  {
    'g6z2dbw7': {
      'en': 'Welcome back!',
      'hi': 'वापसी पर स्वागत है!',
      'pt': 'Bem vindo de volta!',
      'sw': 'Karibu tena!',
    },
    'db4zj6vr': {
      'en': 'Let\'s login for explore continues',
      'hi': 'आइए लॉगिन करें अन्वेषण जारी है',
      'pt': 'Vamos fazer login para explorar continua',
      'sw': 'Hebu tuingie ili kuchunguza inaendelea',
    },
    'c6f7hxu3': {
      'en': 'example@gmail.com',
      'hi': 'उदाहरण@gmail.com',
      'pt': 'exemplo@gmail.com',
      'sw': 'mfano@gmail.com',
    },
    '4m9tqn0j': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'pt': 'Senha',
      'sw': 'Nenosiri',
    },
    'zx2mumoh': {
      'en': 'Forgot password?',
      'hi': 'पासवर्ड भूल गए?',
      'pt': 'Esqueceu sua senha?',
      'sw': 'Umesahau nywila?',
    },
    'y5byvsgg': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'pt': 'Conecte-se',
      'sw': 'Ingia',
    },
    'bbxhsxaj': {
      'en': 'Or',
      'hi': 'या',
      'pt': 'Ou',
      'sw': 'Au',
    },
    'ysy3ukmv': {
      'en': 'Connect using',
      'hi': 'का उपयोग करके कनेक्ट करें',
      'pt': 'Conecte-se usando',
      'sw': 'Unganisha kwa kutumia',
    },
    '6y114b2p': {
      'en': 'Don\'t have an account ?',
      'hi': 'क्या आपके पास खाता नहीं है?',
      'pt': 'Não tem uma conta?',
      'sw': 'Je, huna akaunti?',
    },
    'e8eey7qb': {
      'en': ' Sign up',
      'hi': 'साइन अप करें',
      'pt': 'Inscrever-se',
      'sw': 'Jisajili',
    },
    'e2asjfmn': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // SignUp
  {
    'pwnh2znq': {
      'en': 'Let\'s Get Started',
      'hi': 'आएँ शुरू करें',
      'pt': 'Vamos começar',
      'sw': 'Tuanze',
    },
    'c8nr1ttp': {
      'en': 'Create an account to get all features',
      'hi': 'सभी सुविधाएँ पाने के लिए खाता बनाएँ',
      'pt': 'Crie uma conta para obter todos os recursos',
      'sw': 'Fungua akaunti ili kupata vipengele vyote',
    },
    'swf4bk5h': {
      'en': 'Name',
      'hi': 'नाम',
      'pt': 'Nome',
      'sw': 'Jina',
    },
    'fe1c5q9a': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
      'pt': 'Identificação do email',
      'sw': 'Kitambulisho cha barua pepe',
    },
    'o9cq3ezq': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'pt': 'Senha',
      'sw': 'Nenosiri',
    },
    'qs9o8pme': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'pt': 'Confirme sua senha',
      'sw': 'Thibitisha Nenosiri',
    },
    'y5ibwg73': {
      'en': 'Andhra Pradesh',
      'hi': 'आंध्र प्रदेश',
      'pt': 'Andhra Pradesh',
      'sw': 'Andhra Pradesh',
    },
    'dqu0ri9j': {
      'en': 'Arunachal Pradesh',
      'hi': 'अरुणाचल प्रदेश',
      'pt': 'Arunachal Pradesh',
      'sw': 'Arunachal Pradesh',
    },
    '45qd67dt': {
      'en': 'Assam',
      'hi': 'असम',
      'pt': 'Assão',
      'sw': 'Assam',
    },
    'z8ogfxox': {
      'en': 'Bihar',
      'hi': 'बिहार',
      'pt': 'Bihar',
      'sw': 'Bihar',
    },
    'mo0d2qr0': {
      'en': 'Chhattisgarh',
      'hi': 'छत्तीसगढ',
      'pt': 'Chattisgarh',
      'sw': 'Chhattisgarh',
    },
    'hwl6h5rw': {
      'en': 'Goa',
      'hi': 'गोवा',
      'pt': 'Goa',
      'sw': 'Goa',
    },
    'xdw2j7fp': {
      'en': 'Gujarat',
      'hi': 'गुजरात',
      'pt': 'Gujarat',
      'sw': 'Kigujarat',
    },
    'op9etm98': {
      'en': 'Haryana',
      'hi': 'हरयाणा',
      'pt': 'Hariana',
      'sw': 'Haryana',
    },
    'zmve6xc4': {
      'en': 'Himachal Pradesh',
      'hi': 'हिमाचल प्रदेश',
      'pt': 'Himachal Pradesh',
      'sw': 'Himachal Pradesh',
    },
    'pyqtxlsq': {
      'en': 'Jharkhand',
      'hi': 'झारखंड',
      'pt': 'Jharkhand',
      'sw': 'Jharkhand',
    },
    '8q2p5rb3': {
      'en': 'Karnataka',
      'hi': 'कर्नाटक',
      'pt': 'Karnataka',
      'sw': 'Karnataka',
    },
    'ohhvuyem': {
      'en': 'Kerala',
      'hi': 'केरल',
      'pt': 'Querala',
      'sw': 'Kerala',
    },
    'feylt012': {
      'en': 'Madhya Pradesh',
      'hi': 'मध्य प्रदेश',
      'pt': 'Madhya Pradesh',
      'sw': 'Madhya Pradesh',
    },
    '58bhb7gb': {
      'en': 'Maharashtra',
      'hi': 'महाराष्ट्र',
      'pt': 'Maharashtra',
      'sw': 'Maharashtra',
    },
    '6ikb6gy6': {
      'en': 'Manipur',
      'hi': 'मणिपुर',
      'pt': 'Manipur',
      'sw': 'Manipur',
    },
    'wsitizyr': {
      'en': 'Meghalaya',
      'hi': 'मेघालय',
      'pt': 'Meghalaya',
      'sw': 'Meghalaya',
    },
    'jacaw7vp': {
      'en': 'Mizoram',
      'hi': 'मिजोरम',
      'pt': 'Mizoram',
      'sw': 'Mizoramu',
    },
    'oka8mi8p': {
      'en': 'Nagaland',
      'hi': 'नगालैंड',
      'pt': 'Nagalândia',
      'sw': 'Nagaland',
    },
    '8mgt5iva': {
      'en': 'Odisha',
      'hi': 'ओडिशा',
      'pt': 'Orissa',
      'sw': 'Odisha',
    },
    'ynrqq1ra': {
      'en': 'Punjab',
      'hi': 'पंजाब',
      'pt': 'Punjab',
      'sw': 'Punjab',
    },
    't7oitik4': {
      'en': 'Rajasthan',
      'hi': 'राजस्थान Rajasthan',
      'pt': 'Rajastão',
      'sw': 'Rajasthan',
    },
    'o7oj5jvl': {
      'en': 'Sikkim',
      'hi': 'सिक्किम',
      'pt': 'Siquim',
      'sw': 'Sikkim',
    },
    'tf4d6dm9': {
      'en': 'Tamil Nadu',
      'hi': 'तमिलनाडु',
      'pt': 'Tâmil Nadu',
      'sw': 'Kitamil Nadu',
    },
    'wtq49ujq': {
      'en': 'Telangana',
      'hi': 'तेलंगाना',
      'pt': 'Telangana',
      'sw': 'Telangana',
    },
    '53k3wctf': {
      'en': 'Tripura',
      'hi': 'त्रिपुरा',
      'pt': 'Tripura',
      'sw': 'Tripura',
    },
    'jfcxz7z6': {
      'en': 'Uttar Pradesh',
      'hi': 'उतार प्रदेश।',
      'pt': 'Utar Pradesh',
      'sw': 'Uttar Pradesh',
    },
    '2ugzdtet': {
      'en': 'Uttarakhand',
      'hi': 'उत्तराखंड',
      'pt': 'Uttarakhand',
      'sw': 'Uttarakhand',
    },
    'irgmlfh8': {
      'en': 'West Bengal',
      'hi': 'पश्चिम बंगाल',
      'pt': 'Bengala Ocidental',
      'sw': 'Bengal Magharibi',
    },
    '4cor8tl6': {
      'en': 'Select state...',
      'hi': 'राज्य चुनें...',
      'pt': 'Selecione o estado...',
      'sw': 'Chagua jimbo...',
    },
    '27audshe': {
      'en': 'Search your state...',
      'hi': 'अपना राज्य खोजें...',
      'pt': 'Pesquise seu estado...',
      'sw': 'Tafuta jimbo lako...',
    },
    '4i1rqic3': {
      'en': 'City',
      'hi': 'शहर',
      'pt': 'Cidade',
      'sw': 'Jiji',
    },
    '7ajnm9mh': {
      'en': 'Sign Up',
      'hi': 'साइन अप करें',
      'pt': 'Inscrever-se',
      'sw': 'Jisajili',
    },
    'loq8cetj': {
      'en': 'Already have an account?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'pt': 'já tem uma conta?',
      'sw': 'Je, tayari una akaunti?',
    },
    'kdssalg4': {
      'en': ' Login',
      'hi': 'लॉग इन करें',
      'pt': 'Conecte-se',
      'sw': 'Ingia',
    },
    '6i7a4xsm': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // ChatPage
  {
    '5r2h7n51': {
      'en': 'Chat With AI',
      'hi': 'AI के साथ चैट करें',
      'pt': 'Converse com IA',
      'sw': 'Sogoa na AI',
    },
    '98va4eou': {
      'en': 'Message',
      'hi': 'संदेश',
      'pt': 'Mensagem',
      'sw': 'Ujumbe',
    },
    'y7y88ofa': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // ProfilePage
  {
    'l4z5aiuz': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'pt': 'Perfil',
      'sw': 'Wasifu',
    },
    'hje48fx0': {
      'en': 'Language',
      'hi': 'भाषा',
      'pt': 'Linguagem',
      'sw': 'Lugha',
    },
    '0z0m17yt': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
      'pt': 'política de Privacidade',
      'sw': 'Sera ya Faragha',
    },
    '80e5pyet': {
      'en': 'Terms & Conditions',
      'hi': 'नियम एवं शर्तें',
      'pt': 'termos e Condições',
      'sw': 'Sheria na Masharti',
    },
    'oz12gd0g': {
      'en': 'Farm Tutorial History',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'tfgv3cwt': {
      'en': 'Log out',
      'hi': 'लॉग आउट',
      'pt': 'Sair',
      'sw': 'Toka nje',
    },
    'ot2uip2d': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // NavigationWrapper
  {
    'tvotfyu6': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // FogotPassword
  {
    'rlmy5zr0': {
      'en': 'Go back',
      'hi': 'वापस जाओ',
      'pt': 'Volte',
      'sw': 'Rudi nyuma',
    },
    '0utqhskh': {
      'en': 'A link will be shared to your email Id',
      'hi': 'आपके ईमेल आईडी पर एक लिंक साझा किया जाएगा',
      'pt': 'Um link será compartilhado com seu ID de e-mail',
      'sw': 'Kiungo kitashirikiwa kwa kitambulisho chako cha barua pepe',
    },
    '2vow8t0i': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
      'pt': 'Identificação do email',
      'sw': 'Kitambulisho cha barua pepe',
    },
    'rqucux3c': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
      'pt': 'Enviar Link',
      'sw': 'Tuma Kiungo',
    },
    'jxn30qpa': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // EditProfile
  {
    '9l7gr7vl': {
      'en': 'Name',
      'hi': 'नाम',
      'pt': 'Nome',
      'sw': 'Jina',
    },
    'tzsytltq': {
      'en': 'Name',
      'hi': 'नाम',
      'pt': 'Nome',
      'sw': 'Jina',
    },
    'b1rik077': {
      'en': 'Email',
      'hi': 'ईमेल',
      'pt': 'E-mail',
      'sw': 'Barua pepe',
    },
    'k0m87vg0': {
      'en': 'Email Id',
      'hi': 'ईमेल आईडी',
      'pt': 'Identificação do email',
      'sw': 'Kitambulisho cha barua pepe',
    },
    '6hr68myw': {
      'en': 'State',
      'hi': 'राज्य',
      'pt': 'Estado',
      'sw': 'Jimbo',
    },
    'dhgxiqh8': {
      'en': 'Andhra Pradesh',
      'hi': 'आंध्र प्रदेश',
      'pt': 'Andhra Pradesh',
      'sw': 'Andhra Pradesh',
    },
    'obxk71ya': {
      'en': 'Arunachal Pradesh',
      'hi': 'अरुणाचल प्रदेश',
      'pt': 'Arunachal Pradesh',
      'sw': 'Arunachal Pradesh',
    },
    '4bq8l7q8': {
      'en': 'Assam',
      'hi': 'असम',
      'pt': 'Assão',
      'sw': 'Assam',
    },
    'a34ui43v': {
      'en': 'Bihar',
      'hi': 'बिहार',
      'pt': 'Bihar',
      'sw': 'Bihar',
    },
    'uv1ezvrr': {
      'en': 'Chhattisgarh',
      'hi': 'छत्तीसगढ',
      'pt': 'Chattisgarh',
      'sw': 'Chhattisgarh',
    },
    'ghmjefor': {
      'en': 'Goa',
      'hi': 'गोवा',
      'pt': 'Goa',
      'sw': 'Goa',
    },
    'l054t2my': {
      'en': 'Gujarat',
      'hi': 'गुजरात',
      'pt': 'Gujarat',
      'sw': 'Kigujarat',
    },
    '9pqs1hls': {
      'en': 'Haryana',
      'hi': 'हरयाणा',
      'pt': 'Hariana',
      'sw': 'Haryana',
    },
    'nl0aehhw': {
      'en': 'Himachal Pradesh',
      'hi': 'हिमाचल प्रदेश',
      'pt': 'Himachal Pradesh',
      'sw': 'Himachal Pradesh',
    },
    '2sbni61r': {
      'en': 'Jharkhand',
      'hi': 'झारखंड',
      'pt': 'Jharkhand',
      'sw': 'Jharkhand',
    },
    't6gaa248': {
      'en': 'Karnataka',
      'hi': 'कर्नाटक',
      'pt': 'Karnataka',
      'sw': 'Karnataka',
    },
    'evamc7cg': {
      'en': 'Kerala',
      'hi': 'केरल',
      'pt': 'Querala',
      'sw': 'Kerala',
    },
    'toi3az7u': {
      'en': 'Madhya Pradesh',
      'hi': 'मध्य प्रदेश',
      'pt': 'Madhya Pradesh',
      'sw': 'Madhya Pradesh',
    },
    'kzax1h6a': {
      'en': 'Maharashtra',
      'hi': 'महाराष्ट्र',
      'pt': 'Maharashtra',
      'sw': 'Maharashtra',
    },
    '9k3woquo': {
      'en': 'Manipur',
      'hi': 'मणिपुर',
      'pt': 'Manipur',
      'sw': 'Manipur',
    },
    'doejikk4': {
      'en': 'Meghalaya',
      'hi': 'मेघालय',
      'pt': 'Meghalaya',
      'sw': 'Meghalaya',
    },
    'ei379ywm': {
      'en': 'Mizoram',
      'hi': 'मिजोरम',
      'pt': 'Mizoram',
      'sw': 'Mizoramu',
    },
    '8vfvskij': {
      'en': 'Nagaland',
      'hi': 'नगालैंड',
      'pt': 'Nagalândia',
      'sw': 'Nagaland',
    },
    'woja0w7s': {
      'en': 'Odisha',
      'hi': 'ओडिशा',
      'pt': 'Orissa',
      'sw': 'Odisha',
    },
    'xz5252yw': {
      'en': 'Punjab',
      'hi': 'पंजाब',
      'pt': 'Punjab',
      'sw': 'Punjab',
    },
    'eupmc1ky': {
      'en': 'Rajasthan',
      'hi': 'राजस्थान Rajasthan',
      'pt': 'Rajastão',
      'sw': 'Rajasthan',
    },
    '6jlqgxpf': {
      'en': 'Sikkim',
      'hi': 'सिक्किम',
      'pt': 'Siquim',
      'sw': 'Sikkim',
    },
    '9gjg3jp8': {
      'en': 'Tamil Nadu',
      'hi': 'तमिलनाडु',
      'pt': 'Tâmil Nadu',
      'sw': 'Kitamil Nadu',
    },
    'l8l9t2zl': {
      'en': 'Telangana',
      'hi': 'तेलंगाना',
      'pt': 'Telangana',
      'sw': 'Telangana',
    },
    'w2m3zusj': {
      'en': 'Tripura',
      'hi': 'त्रिपुरा',
      'pt': 'Tripura',
      'sw': 'Tripura',
    },
    '42rrjqp4': {
      'en': 'Uttar Pradesh',
      'hi': 'उतार प्रदेश।',
      'pt': 'Utar Pradesh',
      'sw': 'Uttar Pradesh',
    },
    'go3llrc5': {
      'en': 'Uttarakhand',
      'hi': 'उत्तराखंड',
      'pt': 'Uttarakhand',
      'sw': 'Uttarakhand',
    },
    'v9a9e7gw': {
      'en': 'West Bengal',
      'hi': 'पश्चिम बंगाल',
      'pt': 'Bengala Ocidental',
      'sw': 'Bengal Magharibi',
    },
    '4ryh3u94': {
      'en': 'Select state...',
      'hi': 'राज्य चुनें...',
      'pt': 'Selecione o estado...',
      'sw': 'Chagua jimbo...',
    },
    'c6ewu5d2': {
      'en': 'Search your state...',
      'hi': 'अपना राज्य खोजें...',
      'pt': 'Pesquise seu estado...',
      'sw': 'Tafuta jimbo lako...',
    },
    '6urgmu88': {
      'en': 'City',
      'hi': 'शहर',
      'pt': 'Cidade',
      'sw': 'Jiji',
    },
    'wdtar0yd': {
      'en': 'City (eg. Jaipur)',
      'hi': 'शहर (जैसे जयपुर)',
      'pt': 'Cidade (por exemplo, Jaipur)',
      'sw': 'Jiji (km. Jaipur)',
    },
    '2136rzfu': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
      'pt': 'Salvar alterações',
      'sw': 'Hifadhi mabadiliko',
    },
    'yrtjmrhj': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // DiseaseDetection
  {
    'wasya3uo': {
      'en': 'Please choose one from below to identify disease.',
      'hi': 'कृपया रोग की पहचान करने के लिए नीचे से एक का चयन करें।',
      'pt': 'Escolha um abaixo para identificar a doença.',
      'sw': 'Tafadhali chagua moja kutoka chini ili kutambua ugonjwa.',
    },
    'lxfcv7m1': {
      'en': 'Farm Animal',
      'hi': 'खेत के प्राणी',
      'pt': 'Animal de fazenda',
      'sw': 'Mnyama wa shamba',
    },
    '2q6r0mel': {
      'en': 'Crop Plant',
      'hi': 'फसल पौधा',
      'pt': 'Planta de colheita',
      'sw': 'Kiwanda cha Mazao',
    },
    '6av8d1ri': {
      'en': 'Next',
      'hi': 'अगला',
      'pt': 'Próximo',
      'sw': 'Inayofuata',
    },
    'kmjqoj6s': {
      'en': 'Upload a photo',
      'hi': 'फोटो अपलोड करें',
      'pt': 'Carregar uma foto',
      'sw': 'Pakia picha',
    },
    'fz3on1v5': {
      'en': 'Upload Image',
      'hi': 'तस्विर अपलोड करना',
      'pt': 'Enviar Imagem',
      'sw': 'Pakia Picha',
    },
    '87rrlq12': {
      'en': 'Next',
      'hi': 'अगला',
      'pt': 'Próximo',
      'sw': 'Inayofuata',
    },
    '3l9gb30t': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'pahz8yl1': {
      'en': 'Search',
      'hi': 'खोज',
      'pt': 'Procurar',
      'sw': 'Tafuta',
    },
    '7l3v3dul': {
      'en': 'Crops',
      'hi': 'फसलें',
      'pt': 'Plantações',
      'sw': 'Mazao',
    },
    '8hpwqf1i': {
      'en': 'Next',
      'hi': 'अगला',
      'pt': 'Próximo',
      'sw': 'Inayofuata',
    },
    'wgk98gg0': {
      'en': 'Uploaded Photo',
      'hi': 'अपलोड की गई तस्वीर',
      'pt': 'Foto enviada',
      'sw': 'Picha Iliyopakiwa',
    },
    'dc5f3afd': {
      'en': 'Ask your Question/Problem',
      'hi': 'अपना प्रश्न/समस्या पूछें',
      'pt': 'Faça sua pergunta/problema',
      'sw': 'Uliza Swali/Tatizo lako',
    },
    'pukwwi83': {
      'en': 'write your disease symptoms',
      'hi': 'अपनी बीमारी के लक्षण लिखें',
      'pt': 'escreva os sintomas da sua doença',
      'sw': 'andika dalili za ugonjwa wako',
    },
    'wqu88es8': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'irwgl5oi': {
      'en': 'Next',
      'hi': 'अगला',
      'pt': 'Próximo',
      'sw': 'Inayofuata',
    },
    'pign68cz': {
      'en': 'Save to Home',
      'hi': 'होम पर सहेजें',
      'pt': 'Salvar em casa',
      'sw': 'Hifadhi hadi Nyumbani',
    },
    'a3ikjgzq': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // TermsAndConditions
  {
    'y1izfs2v': {
      'en': 'Terms And Conditions',
      'hi': 'नियम और शर्तें',
      'pt': 'Termos e Condições',
      'sw': 'Sheria na Masharti',
    },
    'z8ypllso': {
      'en':
          'Welcome to Farmers-Help! These Terms and Conditions (\"Terms\") govern your use of our mobile app and services provided therein (\"App\"). By accessing or using the App, you agree to be bound by these Terms.',
      'hi':
          'फार्मर्स-हेल्प में आपका स्वागत है! ये नियम और शर्तें (\"नियम\") हमारे मोबाइल ऐप और उसमें दी गई सेवाओं (\"ऐप\") के आपके उपयोग को नियंत्रित करती हैं। ऐप तक पहुँचने या उसका उपयोग करके, आप इन शर्तों से बंधे होने के लिए सहमत होते हैं।',
      'pt':
          'Bem-vindo ao Farmers-Help! Estes Termos e Condições (\"Termos\") regem o uso de nosso aplicativo móvel e dos serviços nele fornecidos (\"Aplicativo\"). Ao acessar ou usar o Aplicativo, você concorda em ficar vinculado a estes Termos.',
      'sw':
          'Karibu kwa Msaada wa Wakulima! Sheria na Masharti haya (\"Masharti\") hudhibiti matumizi yako ya programu yetu ya simu na huduma zinazotolewa humo (\"Programu\"). Kwa kufikia au kutumia Programu, unakubali kuwa chini ya Sheria na Masharti haya.',
    },
    'pigo9fqp': {
      'en': '1. Acceptance of Terms',
      'hi': '1. शर्तों की स्वीकृति',
      'pt': '1. Aceitação dos Termos',
      'sw': '1. Kukubali Masharti',
    },
    'tr65c0jj': {
      'en':
          'By accessing or using the App, you agree to comply with these Terms. If you do not agree with any part of these Terms, you may not use the App.',
      'hi':
          'ऐप तक पहुँचने या उसका उपयोग करके, आप इन शर्तों का पालन करने के लिए सहमत होते हैं। यदि आप इन शर्तों के किसी भी भाग से सहमत नहीं हैं, तो आप ऐप का उपयोग नहीं कर सकते हैं।',
      'pt':
          'Ao acessar ou usar o Aplicativo, você concorda em cumprir estes Termos. Se você não concordar com qualquer parte destes Termos, você não poderá usar o Aplicativo.',
      'sw':
          'Kwa kufikia au kutumia Programu, unakubali kutii Sheria na Masharti haya. Iwapo hukubaliani na sehemu yoyote ya Sheria na Masharti haya, huenda usitumie Programu.',
    },
    '6e5ousa1': {
      'en': '2. Services',
      'hi': '2. सेवाएं',
      'pt': '2. Serviços',
      'sw': '2. Huduma',
    },
    '0j6jxr9x': {
      'en':
          'Our App provides various services aimed at assisting farmers in growing their plants and crops more effectively. These services include but are not limited to:\n\na) Providing agricultural advice and recommendations based on data analysis and AI technology.\n\nb) Offering tools and resources for plant care, pest management, and crop optimization.\n\nc) Facilitating communication and collaboration among farmers and agricultural experts.\n\nd) Providing access to educational content, tutorials, and training materials related to farming practices.',
      'hi':
          'हमारा ऐप किसानों को उनके पौधों और फसलों को अधिक प्रभावी ढंग से उगाने में सहायता करने के उद्देश्य से विभिन्न सेवाएँ प्रदान करता है। इन सेवाओं में शामिल हैं, लेकिन इन्हीं तक सीमित नहीं हैं:\n\na) डेटा विश्लेषण और AI तकनीक के आधार पर कृषि सलाह और सिफारिशें प्रदान करना।\n\nb) पौधों की देखभाल, कीट प्रबंधन और फसल अनुकूलन के लिए उपकरण और संसाधन प्रदान करना।\n\nc) किसानों और कृषि विशेषज्ञों के बीच संचार और सहयोग को सुविधाजनक बनाना।\n\nd) खेती के तरीकों से संबंधित शैक्षिक सामग्री, ट्यूटोरियल और प्रशिक्षण सामग्री तक पहुँच प्रदान करना।',
      'pt':
          'Nosso aplicativo oferece diversos serviços que visam auxiliar os agricultores no cultivo de suas plantas e colheitas de forma mais eficaz. Esses serviços incluem, mas não estão limitados a:\n\na) Fornecer aconselhamento e recomendações agrícolas com base na análise de dados e na tecnologia de IA.\n\nb) Oferecer ferramentas e recursos para cuidado de plantas, manejo de pragas e otimização de culturas.\n\nc) Facilitar a comunicação e a colaboração entre agricultores e especialistas agrícolas.\n\nd) Fornecer acesso a conteúdos educacionais, tutoriais e materiais de treinamento relacionados às práticas agrícolas.',
      'sw':
          'App yetu inatoa huduma mbalimbali zinazolenga kuwasaidia wakulima katika kukuza mimea na mazao yao kwa ufanisi zaidi. Huduma hizi ni pamoja na lakini sio mdogo kwa:\n\na) Kutoa ushauri na mapendekezo ya kilimo kwa kuzingatia uchambuzi wa data na teknolojia ya AI.\n\nb) Kutoa zana na rasilimali za utunzaji wa mimea, udhibiti wa wadudu, na uboreshaji wa mazao.\n\nc) Kuwezesha mawasiliano na ushirikiano kati ya wakulima na wataalam wa kilimo.\n\nd) Kutoa ufikiaji wa maudhui ya elimu, mafunzo, na nyenzo za mafunzo zinazohusiana na kanuni za kilimo.',
    },
    'sqos998x': {
      'en': '3. User Conduct',
      'hi': '3. उपयोगकर्ता का आचरण',
      'pt': '3. Conduta do usuário',
      'sw': '3. Maadili ya Mtumiaji',
    },
    'uv1kqfl2': {
      'en':
          'You agree to use the App in compliance with all applicable laws, regulations, and these Terms. You shall not:\n\na) Use the App for any unlawful or unauthorized purpose.\n\n b) Interfere with or disrupt the operation of the App or any servers or networks connected to the App.\n\nc)  Transmit any viruses, malware, or harmful code through the App.\n\nd)  Impersonate any person or entity, or falsely state or misrepresent your affiliation with any person or entity.',
      'hi':
          'आप सभी लागू कानूनों, विनियमों और इन शर्तों के अनुपालन में ऐप का उपयोग करने के लिए सहमत हैं। आपको ये नहीं करना चाहिए:\n\na) किसी भी गैरकानूनी या अनधिकृत उद्देश्य के लिए ऐप का उपयोग करना।\n\nb) ऐप या ऐप से जुड़े किसी भी सर्वर या नेटवर्क के संचालन में हस्तक्षेप या बाधा डालना।\n\nc) ऐप के माध्यम से कोई भी वायरस, मैलवेयर या हानिकारक कोड प्रसारित करना।\n\nd) किसी व्यक्ति या संस्था का प्रतिरूपण करना, या किसी व्यक्ति या संस्था के साथ अपने जुड़ाव को गलत तरीके से बताना या गलत तरीके से प्रस्तुत करना।',
      'pt':
          'Você concorda em usar o Aplicativo em conformidade com todas as leis e regulamentos aplicáveis ​​e estes Termos. Você não deve:\n\na) Usar o Aplicativo para qualquer finalidade ilegal ou não autorizada.\n\n b) Interferir ou interromper a operação do Aplicativo ou de quaisquer servidores ou redes conectados ao Aplicativo.\n\nc) Transmitir qualquer vírus, malware ou código prejudicial através do Aplicativo.\n\nd) Fazer-se passar por qualquer pessoa ou entidade, ou declarar falsamente ou deturpar a sua afiliação com qualquer pessoa ou entidade.',
      'sw':
          'Unakubali kutumia Programu kwa kutii sheria, kanuni na Sheria na Masharti haya yote. Hutakiwi:\n\na) Tumia Programu kwa madhumuni yoyote yasiyo halali au yasiyoidhinishwa.\n\n b) Kuingilia au kutatiza utendakazi wa Programu au seva au mitandao yoyote iliyounganishwa kwenye Programu.\n\nc) Sambaza virusi, programu hasidi au msimbo hatari kupitia Programu.\n\nd) Kuiga mtu au huluki yoyote, au kutamka kwa uwongo au kuwasilisha kimakosa ushirika wako na mtu au huluki yoyote.',
    },
    'p3lsfyva': {
      'en': '4. Privacy Policy',
      'hi': '4. गोपनीयता नीति',
      'pt': '4. Política de Privacidade',
      'sw': '4. Sera ya Faragha',
    },
    'jmwsokit': {
      'en':
          'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and disclose your personal information when you use our App.',
      'hi':
          'आपकी गोपनीयता हमारे लिए महत्वपूर्ण है। कृपया हमारी गोपनीयता नीति की समीक्षा करें ताकि आप समझ सकें कि जब आप हमारे ऐप का उपयोग करते हैं तो हम आपकी व्यक्तिगत जानकारी कैसे एकत्रित करते हैं, उसका उपयोग करते हैं और उसका खुलासा करते हैं।',
      'pt':
          'Sua privacidade é importante para nós. Por favor, revise nossa Política de Privacidade para entender como coletamos, usamos e divulgamos suas informações pessoais quando você usa nosso Aplicativo.',
      'sw':
          'Faragha yako ni muhimu kwetu. Tafadhali kagua Sera yetu ya Faragha ili kuelewa jinsi tunavyokusanya, kutumia, na kufichua maelezo yako ya kibinafsi unapotumia Programu yetu.',
    },
    'oapkzluj': {
      'en': '5. Intellectual Property',
      'hi': '5. बौद्धिक संपदा',
      'pt': '5. Propriedade Intelectual',
      'sw': '5. Miliki',
    },
    '4nh4zyf6': {
      'en':
          'All content, trademarks, logos, and intellectual property rights displayed on the App are owned by us or our licensors. You may not use, reproduce, or distribute any content from the App without our prior written consent.',
      'hi':
          'ऐप पर प्रदर्शित सभी सामग्री, ट्रेडमार्क, लोगो और बौद्धिक संपदा अधिकार हमारे या हमारे लाइसेंसधारकों के स्वामित्व में हैं। आप हमारी पूर्व लिखित सहमति के बिना ऐप से किसी भी सामग्री का उपयोग, पुनरुत्पादन या वितरण नहीं कर सकते हैं।',
      'pt':
          'Todo o conteúdo, marcas registradas, logotipos e direitos de propriedade intelectual exibidos no Aplicativo são de nossa propriedade ou de nossos licenciadores. Você não pode usar, reproduzir ou distribuir qualquer conteúdo do Aplicativo sem nosso consentimento prévio por escrito.',
      'sw':
          'Maudhui yote, chapa za biashara, nembo na haki za uvumbuzi zinazoonyeshwa kwenye Programu zinamilikiwa na sisi au watoa leseni wetu. Huruhusiwi kutumia, kuzalisha tena au kusambaza maudhui yoyote kutoka kwa Programu bila kibali chetu cha maandishi.',
    },
    'gtpyrzqm': {
      'en': '6. Disclaimer of Warranties',
      'hi': '6. वारंटी का अस्वीकरण',
      'pt': '6. Isenção de Garantias',
      'sw': '6. Kanusho la Dhamana',
    },
    'vcoxohub': {
      'en':
          'The App and its services are provided on an \"as-is\" and \"as-available\" basis, without warranties of any kind, either express or implied. We do not guarantee the accuracy, reliability, or completeness of any information provided through the App.',
      'hi':
          'ऐप और इसकी सेवाएँ \"जैसी हैं\" और \"जैसी उपलब्ध हैं\" के आधार पर प्रदान की जाती हैं, बिना किसी प्रकार की वारंटी के, चाहे वह व्यक्त हो या निहित। हम ऐप के माध्यम से प्रदान की गई किसी भी जानकारी की सटीकता, विश्वसनीयता या पूर्णता की गारंटी नहीं देते हैं।',
      'pt':
          'O Aplicativo e seus serviços são fornecidos \"no estado em que se encontram\" e \"conforme disponíveis\", sem garantias de qualquer tipo, expressas ou implícitas. Não garantimos a exatidão, confiabilidade ou integridade de qualquer informação fornecida através do Aplicativo.',
      'sw':
          'Programu na huduma zake hutolewa kwa misingi ya \"kama-ilivyo\" na \"inavyopatikana\", bila udhamini wa aina yoyote, ama wazi au wa kudokezwa. Hatutoi hakikisho la usahihi, kutegemewa, au utimilifu wa maelezo yoyote yanayotolewa kupitia Programu.',
    },
    'kn2akgjm': {
      'en': '7. Limitation of Liability',
      'hi': '7. दायित्व की सीमा',
      'pt': '7. Limitação de Responsabilidade',
      'sw': '7. Ukomo wa Dhima',
    },
    'wi8me3ac': {
      'en':
          'In no event shall we be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App or its services, even if we have been advised of the possibility of such damages.',
      'hi':
          'किसी भी स्थिति में हम आपके द्वारा ऐप या इसकी सेवाओं के उपयोग से उत्पन्न या उससे संबंधित किसी भी अप्रत्यक्ष, आकस्मिक, विशेष या परिणामी क्षति के लिए उत्तरदायी नहीं होंगे, भले ही हमें ऐसी क्षति की संभावना के बारे में सूचित किया गया हो।',
      'pt':
          'Em nenhum caso seremos responsáveis ​​por quaisquer danos indiretos, incidentais, especiais ou consequenciais decorrentes ou relacionados ao uso do Aplicativo ou de seus serviços, mesmo que tenhamos sido avisados ​​da possibilidade de tais danos.',
      'sw':
          'Kwa hali yoyote hatutawajibikia uharibifu wowote usio wa moja kwa moja, wa bahati mbaya, maalum, au wa matokeo unaotokana na au kuhusiana na matumizi yako ya Programu au huduma zake, hata kama tumeshauriwa kuhusu uwezekano wa uharibifu huo.',
    },
    'vagod26l': {
      'en': '8. Governing Law',
      'hi': '8. शासन कानून',
      'pt': '8. Lei Aplicável',
      'sw': '8. Sheria ya Utawala',
    },
    'l6czqexq': {
      'en':
          'These Terms shall be governed by and construed in accordance with the laws, without regard to its conflict of law provisions.',
      'hi':
          'ये नियम कानून के प्रावधानों के टकराव की परवाह किए बिना, कानून के अनुसार शासित और व्याख्या किए जाएंगे।',
      'pt':
          'Estes Termos serão regidos e interpretados de acordo com as leis, independentemente de conflitos de disposições legais.',
      'sw':
          'Masharti haya yatasimamiwa na kufasiriwa kwa mujibu wa sheria, bila kuzingatia mgongano wake wa masharti ya sheria.',
    },
    '3vagjl2p': {
      'en': '9. Changes to Terms',
      'hi': '9. शर्तों में परिवर्तन',
      'pt': '9. Alterações nos Termos',
      'sw': '9. Mabadiliko ya Masharti',
    },
    'usq9fi6m': {
      'en':
          'We reserve the right to modify or update these Terms at any time. Your continued use of the App after any changes indicates your acceptance of the modified Terms.',
      'hi':
          'हम किसी भी समय इन शर्तों को संशोधित या अपडेट करने का अधिकार सुरक्षित रखते हैं। किसी भी बदलाव के बाद ऐप का आपका निरंतर उपयोग संशोधित शर्तों की आपकी स्वीकृति को दर्शाता है।',
      'pt':
          'Reservamo-nos o direito de modificar ou atualizar estes Termos a qualquer momento. O uso continuado do Aplicativo após quaisquer alterações indica sua aceitação dos Termos modificados.',
      'sw':
          'Tunahifadhi haki ya kurekebisha au kusasisha Sheria na Masharti haya wakati wowote. Kuendelea kwako kutumia Programu baada ya mabadiliko yoyote kunaonyesha kukubali kwako kwa Sheria na Masharti yaliyobadilishwa.',
    },
    'hwfh5blt': {
      'en': '10. Contact Us',
      'hi': '10. हमसे संपर्क करें',
      'pt': '10. Contate-nos',
      'sw': '10. Wasiliana Nasi',
    },
    'xvark6qh': {
      'en':
          'If you have any questions or concerns about these Terms, please contact us at info@flutterflowdevs.com.',
      'hi':
          'यदि इन शर्तों के बारे में आपके कोई प्रश्न या चिंताएं हैं, तो कृपया हमसे info@flutterflowdevs.com पर संपर्क करें।',
      'pt':
          'Se você tiver alguma dúvida ou preocupação sobre estes Termos, entre em contato conosco pelo e-mail info@flutterflowdevs.com.',
      'sw':
          'Ikiwa una maswali au wasiwasi wowote kuhusu Masharti haya, tafadhali wasiliana nasi kwa info@flutterflowdevs.com.',
    },
    'wm2ouy0a': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // PrivacyAndPolicy
  {
    'jffi62ux': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
      'pt': 'política de Privacidade',
      'sw': 'Sera ya Faragha',
    },
    'bufhn50m': {
      'en':
          'At Farm Help, we value the privacy and security of our users. This Privacy Policy outlines how we collect, use, and protect your personal information when you use our ecommerce app and services. By accessing or using our app, you consent to the practices described in this policy.',
      'hi':
          'फ़ार्म हेल्प में, हम अपने उपयोगकर्ताओं की गोपनीयता और सुरक्षा को महत्व देते हैं। यह गोपनीयता नीति बताती है कि जब आप हमारे ईकॉमर्स ऐप और सेवाओं का उपयोग करते हैं तो हम आपकी व्यक्तिगत जानकारी कैसे एकत्रित करते हैं, उसका उपयोग करते हैं और उसकी सुरक्षा करते हैं। हमारे ऐप तक पहुँचने या उसका उपयोग करके, आप इस नीति में वर्णित प्रथाओं के लिए सहमति देते हैं।',
      'pt':
          'Na Farm Help, valorizamos a privacidade e a segurança dos nossos usuários. Esta Política de Privacidade descreve como coletamos, usamos e protegemos suas informações pessoais quando você usa nosso aplicativo e serviços de comércio eletrônico. Ao acessar ou utilizar nosso aplicativo, você concorda com as práticas descritas nesta política.',
      'sw':
          'Katika Usaidizi wa Shamba, tunathamini ufaragha na usalama wa watumiaji wetu. Sera hii ya Faragha inabainisha jinsi tunavyokusanya, kutumia na kulinda maelezo yako ya kibinafsi unapotumia programu na huduma zetu za ecommerce. Kwa kufikia au kutumia programu yetu, unakubali desturi zilizoelezwa katika sera hii.',
    },
    'fsye8mee': {
      'en': '1. Information We Collect:',
      'hi': '1. हमारे द्वारा एकत्रित जानकारी:',
      'pt': '1. Informações que coletamos:',
      'sw': '1. Taarifa Tunazokusanya:',
    },
    '05natrgr': {
      'en':
          'i) Personal Information: When you create an account, place an order, or interact with our app, we may collect personal information such as your name, email address, shipping address, and payment details.\n\nii) Usage Information: We gather information about how you use our app, including the pages you visit, products you view, and interactions with features or advertisements.',
      'hi':
          'i) व्यक्तिगत जानकारी: जब आप कोई खाता बनाते हैं, कोई ऑर्डर देते हैं, या हमारे ऐप से इंटरैक्ट करते हैं, तो हम आपका नाम, ईमेल पता, शिपिंग पता और भुगतान विवरण जैसी व्यक्तिगत जानकारी एकत्र कर सकते हैं।\n\nii) उपयोग की जानकारी: हम इस बारे में जानकारी एकत्र करते हैं कि आप हमारे ऐप का उपयोग कैसे करते हैं, जिसमें आपके द्वारा देखे जाने वाले पेज, आपके द्वारा देखे जाने वाले उत्पाद और सुविधाओं या विज्ञापनों के साथ इंटरैक्शन शामिल हैं।',
      'pt':
          'i) Informações Pessoais: Quando você cria uma conta, faz um pedido ou interage com nosso aplicativo, podemos coletar informações pessoais como seu nome, endereço de e-mail, endereço de entrega e detalhes de pagamento.\n\nii) Informações de uso: coletamos informações sobre como você usa nosso aplicativo, incluindo as páginas que você visita, os produtos que você visualiza e as interações com recursos ou anúncios.',
      'sw':
          'i) Taarifa za Kibinafsi: Unapofungua akaunti, kuagiza, au kuingiliana na programu yetu, tunaweza kukusanya taarifa za kibinafsi kama vile jina lako, anwani ya barua pepe, anwani ya usafirishaji na maelezo ya malipo.\n\nii) Taarifa ya Matumizi: Tunakusanya maelezo kuhusu jinsi unavyotumia programu yetu, ikiwa ni pamoja na kurasa unazotembelea, bidhaa unazotazama, na mwingiliano na vipengele au matangazo.',
    },
    'fv7ynkr1': {
      'en': '2. How We Use Your Information:',
      'hi': '2. हम आपकी जानकारी का उपयोग कैसे करते हैं:',
      'pt': '2. Como usamos suas informações:',
      'sw': '2. Jinsi Tunavyotumia Taarifa Zako:',
    },
    'n1snpnqh': {
      'en':
          'i) Personalization: We use your information to provide personalized experiences, such as displaying relevant products, recommendations, or tailored marketing communications.\n\nii) Order Processing: We use your information to process and fulfill your orders, including payment processing, shipping, and customer support.\n\niii) Communication: We may contact you with order updates, promotional offers, or important service announcements. You can opt-out of receiving marketing communications at any time.\n\niv) Improving Our Services: We analyze usage data to improve our app, enhance user experience, and optimize our product offerings.',
      'hi':
          'i) वैयक्तिकरण: हम आपकी जानकारी का उपयोग वैयक्तिकृत अनुभव प्रदान करने के लिए करते हैं, जैसे कि प्रासंगिक उत्पाद, अनुशंसाएँ या अनुरूपित विपणन संचार प्रदर्शित करना।\n\nii) ऑर्डर प्रोसेसिंग: हम आपके ऑर्डर को प्रोसेस करने और पूरा करने के लिए आपकी जानकारी का उपयोग करते हैं, जिसमें भुगतान प्रोसेसिंग, शिपिंग और ग्राहक सहायता शामिल है।\n\niii) संचार: हम ऑर्डर अपडेट, प्रचार ऑफ़र या महत्वपूर्ण सेवा घोषणाओं के साथ आपसे संपर्क कर सकते हैं। आप किसी भी समय मार्केटिंग संचार प्राप्त करने से ऑप्ट-आउट कर सकते हैं।\n\niv) हमारी सेवाओं में सुधार: हम अपने ऐप को बेहतर बनाने, उपयोगकर्ता अनुभव को बढ़ाने और अपने उत्पाद ऑफ़रिंग को अनुकूलित करने के लिए उपयोग डेटा का विश्लेषण करते हैं।',
      'pt':
          'i) Personalização: Utilizamos as suas informações para fornecer experiências personalizadas, como a exibição de produtos relevantes, recomendações ou comunicações de marketing personalizadas.\n\nii) Processamento de pedidos: Usamos suas informações para processar e atender seus pedidos, incluindo processamento de pagamentos, envio e suporte ao cliente.\n\niii) Comunicação: Poderemos contatá-lo com atualizações de pedidos, ofertas promocionais ou anúncios de serviços importantes. Você pode cancelar o recebimento de comunicações de marketing a qualquer momento.\n\niv) Melhorando Nossos Serviços: Analisamos dados de uso para melhorar nosso aplicativo, aprimorar a experiência do usuário e otimizar nossas ofertas de produtos.',
      'sw':
          'i) Kubinafsisha: Tunatumia maelezo yako ili kukupa hali ya utumiaji inayokufaa, kama vile kuonyesha bidhaa zinazofaa, mapendekezo, au mawasiliano maalum ya uuzaji.\n\nii) Uchakataji wa Maagizo: Tunatumia maelezo yako kuchakata na kutimiza maagizo yako, ikijumuisha uchakataji wa malipo, usafirishaji na usaidizi kwa wateja.\n\niii) Mawasiliano: Tunaweza kuwasiliana nawe ili kukupa masasisho ya agizo, ofa au matangazo muhimu ya huduma. Unaweza kuchagua kutopokea mawasiliano ya uuzaji wakati wowote.\n\niv) Kuboresha Huduma Zetu: Tunachanganua data ya matumizi ili kuboresha programu yetu, kuboresha matumizi ya watumiaji na kuboresha matoleo ya bidhaa zetu.',
    },
    'kl2msotj': {
      'en': '3. Information Sharing:',
      'hi': '3. सूचना साझा करना:',
      'pt': '3. Compartilhamento de informações:',
      'sw': '3. Kushiriki Habari:',
    },
    'bv8zhplh': {
      'en':
          'i) Third-Party Service Providers: We may share your information with trusted third-party service providers who assist us in operating our app, processing payments, or delivering products.\n\nii) Legal Requirements: We may disclose your information in response to legal processes or when required by law to protect our rights, safety, or the rights and safety of others.',
      'hi':
          'i) तृतीय-पक्ष सेवा प्रदाता: हम आपकी जानकारी को विश्वसनीय तृतीय-पक्ष सेवा प्रदाताओं के साथ साझा कर सकते हैं जो हमारे ऐप को संचालित करने, भुगतान संसाधित करने या उत्पाद वितरित करने में हमारी सहायता करते हैं।\n\nii) कानूनी आवश्यकताएँ: हम कानूनी प्रक्रियाओं के जवाब में या हमारे अधिकारों, सुरक्षा या दूसरों के अधिकारों और सुरक्षा की रक्षा के लिए कानून द्वारा आवश्यक होने पर आपकी जानकारी का खुलासा कर सकते हैं।',
      'pt':
          'i) Provedores de serviços terceirizados: podemos compartilhar suas informações com prestadores de serviços terceirizados confiáveis ​​que nos auxiliam na operação de nosso aplicativo, no processamento de pagamentos ou na entrega de produtos.\n\nii) Requisitos legais: Podemos divulgar suas informações em resposta a processos legais ou quando exigido por lei para proteger nossos direitos, segurança ou os direitos e segurança de terceiros.',
      'sw':
          'i) Watoa Huduma za Wengine: Tunaweza kushiriki maelezo yako na watoa huduma wengine wanaoaminika ambao hutusaidia katika kuendesha programu yetu, kuchakata malipo au kuwasilisha bidhaa.\n\nii) Masharti ya Kisheria: Tunaweza kufichua maelezo yako kwa kujibu michakato ya kisheria au inapohitajika kisheria kulinda haki zetu, usalama, au haki na usalama wa wengine.',
    },
    'zdmejttk': {
      'en': '4. Data Security:',
      'hi': '4. डेटा सुरक्षा:',
      'pt': '4. Segurança de dados:',
      'sw': '4. Usalama wa Data:',
    },
    '9myv36dr': {
      'en':
          'i) We employ industry-standard security measures to protect your personal information from unauthorized access, misuse, or loss.\n\nii) However, please note that no data transmission or storage system can be guaranteed to be 100% secure. We cannot ensure the absolute security of your information.',
      'hi':
          'i) हम आपकी व्यक्तिगत जानकारी को अनधिकृत पहुँच, दुरुपयोग या हानि से बचाने के लिए उद्योग-मानक सुरक्षा उपाय अपनाते हैं।\n\nii) हालाँकि, कृपया ध्यान दें कि किसी भी डेटा ट्रांसमिशन या स्टोरेज सिस्टम की 100% सुरक्षा की गारंटी नहीं दी जा सकती। हम आपकी जानकारी की पूर्ण सुरक्षा सुनिश्चित नहीं कर सकते।',
      'pt':
          'i) Empregamos medidas de segurança padrão da indústria para proteger suas informações pessoais contra acesso não autorizado, uso indevido ou perda.\n\nii) No entanto, observe que nenhum sistema de transmissão ou armazenamento de dados pode ser garantido como 100% seguro. Não podemos garantir a segurança absoluta das suas informações.',
      'sw':
          'i) Tunatumia hatua za usalama za kiwango cha sekta ili kulinda maelezo yako ya kibinafsi dhidi ya ufikiaji usioidhinishwa, matumizi mabaya au hasara.\n\nii) Hata hivyo, tafadhali kumbuka kuwa hakuna usambazaji wa data au mfumo wa kuhifadhi unaoweza kuhakikishiwa kuwa salama 100%. Hatuwezi kuhakikisha usalama kamili wa maelezo yako.',
    },
    'rs4cp7vf': {
      'en': '5. Your Choices:',
      'hi': '5. आपके विकल्प:',
      'pt': '5. Suas escolhas:',
      'sw': '5. Chaguo zako:',
    },
    'q9rtvb5l': {
      'en':
          'i) Account Settings: You can review and update your account information and communication preferences by accessing your account settings.\n\nii) Cookies and Tracking Technologies: You have the option to manage cookies and tracking technologies through your device or browser settings.\n',
      'hi':
          'i) खाता सेटिंग: आप अपनी खाता सेटिंग तक पहुँच कर अपनी खाता जानकारी और संचार प्राथमिकताओं की समीक्षा और अद्यतन कर सकते हैं।\n\nii) कुकीज़ और ट्रैकिंग प्रौद्योगिकियाँ: आपके पास अपनी डिवाइस या ब्राउज़र सेटिंग के माध्यम से कुकीज़ और ट्रैकिंग तकनीकों को प्रबंधित करने का विकल्प है।',
      'pt':
          'i) Configurações da conta: você pode revisar e atualizar as informações da sua conta e preferências de comunicação acessando as configurações da sua conta.\n\nii) Cookies e tecnologias de rastreamento: Você tem a opção de gerenciar cookies e tecnologias de rastreamento através das configurações do seu dispositivo ou navegador.',
      'sw':
          'i) Mipangilio ya Akaunti: Unaweza kukagua na kusasisha maelezo ya akaunti yako na mapendeleo ya mawasiliano kwa kufikia mipangilio ya akaunti yako.\n\nii) Vidakuzi na Teknolojia za Ufuatiliaji: Una chaguo la kudhibiti vidakuzi na teknolojia za kufuatilia kupitia kifaa au mipangilio ya kivinjari chako.',
    },
    '8ukg0unv': {
      'en': '6. Children\'s Privacy:',
      'hi': '6. बच्चों की गोपनीयता:',
      'pt': '6. Privacidade das Crianças:',
      'sw': '6. Faragha ya Watoto:',
    },
    'e8tc87q0': {
      'en':
          'Our app is not intended for individuals under the age of 13. We do not knowingly collect personal information from children. If you become aware that your child has provided us with personal information, please contact us to have it removed.',
      'hi':
          'हमारा ऐप 13 वर्ष से कम आयु के व्यक्तियों के लिए नहीं है। हम जानबूझकर बच्चों से व्यक्तिगत जानकारी एकत्र नहीं करते हैं। यदि आपको पता चलता है कि आपके बच्चे ने हमें व्यक्तिगत जानकारी प्रदान की है, तो कृपया इसे हटाने के लिए हमसे संपर्क करें।',
      'pt':
          'Nosso aplicativo não se destina a menores de 13 anos. Não coletamos intencionalmente informações pessoais de crianças. Se você souber que seu filho nos forneceu informações pessoais, entre em contato conosco para removê-las.',
      'sw':
          'Programu yetu haijakusudiwa watu walio chini ya umri wa miaka 13. Hatukusanyi taarifa za kibinafsi kutoka kwa watoto kimakusudi. Ukifahamu kwamba mtoto wako ametupa taarifa za kibinafsi, tafadhali wasiliana nasi ili tuziondoe.',
    },
    'ys7czstm': {
      'en': '7. Updates to this Policy:',
      'hi': '7. इस नीति में अद्यतन:',
      'pt': '7. Atualizações desta Política:',
      'sw': '7. Masasisho ya Sera hii:',
    },
    '5rjme14h': {
      'en':
          'We may update this Privacy Policy from time to time. We encourage you to review the latest version whenever you use our app.',
      'hi':
          'हम समय-समय पर इस गोपनीयता नीति को अपडेट कर सकते हैं। हम आपको प्रोत्साहित करते हैं कि जब भी आप हमारे ऐप का उपयोग करें तो नवीनतम संस्करण की समीक्षा करें।',
      'pt':
          'Poderemos atualizar esta Política de Privacidade de tempos em tempos. Recomendamos que você revise a versão mais recente sempre que usar nosso aplicativo.',
      'sw':
          'Tunaweza kusasisha Sera hii ya Faragha mara kwa mara. Tunakuhimiza ukague toleo jipya zaidi wakati wowote unapotumia programu yetu.',
    },
    '1uo0odbw': {
      'en': '8. Governing Law',
      'hi': '8. शासन कानून',
      'pt': '8. Lei Aplicável',
      'sw': '8. Sheria ya Utawala',
    },
    '69a1l9v3': {
      'en':
          'These Terms shall be governed by and construed in accordance with the laws, without regard to its conflict of law provisions.',
      'hi':
          'ये नियम कानून के प्रावधानों के टकराव की परवाह किए बिना, कानून के अनुसार शासित और व्याख्या किए जाएंगे।',
      'pt':
          'Estes Termos serão regidos e interpretados de acordo com as leis, independentemente de conflitos de disposições legais.',
      'sw':
          'Masharti haya yatasimamiwa na kufasiriwa kwa mujibu wa sheria, bila kuzingatia mgongano wake wa masharti ya sheria.',
    },
    'yu4uslo6': {
      'en':
          'If you have any questions or concerns regarding our Privacy Policy, please contact us at info@flutterflowdevs.com.',
      'hi':
          'यदि आपको हमारी गोपनीयता नीति के बारे में कोई प्रश्न या चिंता है, तो कृपया हमसे info@flutterflowdevs.com पर संपर्क करें।',
      'pt':
          'Se você tiver alguma dúvida ou preocupação em relação à nossa Política de Privacidade, entre em contato conosco pelo e-mail info@flutterflowdevs.com.',
      'sw':
          'Ikiwa una maswali au wasiwasi wowote kuhusu Sera yetu ya Faragha, tafadhali wasiliana nasi kwa info@flutterflowdevs.com.',
    },
    'x165g42y': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // DiagnosesList
  {
    '82ef15ru': {
      'en': 'Diagnoses List',
      'hi': 'निदान सूची',
      'pt': 'Lista de diagnósticos',
      'sw': 'Orodha ya Utambuzi',
    },
    'zx66ppit': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // DiagnoseDetail
  {
    '27slxazp': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // HomePageCopy
  {
    '465kh3x8': {
      'en': 'Hi, ',
      'hi': 'नमस्ते,',
      'pt': 'Oi,',
      'sw': 'Habari,',
    },
    'oxujtuvg': {
      'en': '!',
      'hi': '!',
      'pt': '!',
      'sw': '!',
    },
    'pfw2shqe': {
      'en': '\nExplore Help',
      'hi': 'सहायता खोजें',
      'pt': 'Explorar a ajuda',
      'sw': 'Gundua Usaidizi',
    },
    '03ay1k3k': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // DiseasesDetectCopy
  {
    'pcm18hrk': {
      'en': 'Upload  a photo',
      'hi': 'फोटो अपलोड करें',
      'pt': 'Carregar uma foto',
      'sw': 'Pakia picha',
    },
    'drhdwu9u': {
      'en': 'upload Image',
      'hi': 'तस्विर अपलोड करना',
      'pt': 'Enviar Imagem',
      'sw': 'pakia Picha',
    },
    'rqb6kpgr': {
      'en': 'Ask your Question/Problem',
      'hi': 'अपना प्रश्न/समस्या पूछें',
      'pt': 'Faça sua pergunta/problema',
      'sw': 'Uliza Swali/Tatizo lako',
    },
    '5023ggtp': {
      'en': 'write your disease symptoms',
      'hi': 'अपनी बीमारी के लक्षण लिखें',
      'pt': 'escreva os sintomas da sua doença',
      'sw': 'andika dalili za ugonjwa wako',
    },
    'ibnc3nxk': {
      'en': 'Next',
      'hi': 'अगला',
      'pt': 'Próximo',
      'sw': 'Inayofuata',
    },
    '42ubhfla': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // VideoPromptPage
  {
    'apzt2bqo': {
      'en': 'Video Prompt Page',
      'hi': 'वीडियो प्रॉम्प्ट पेज',
      'pt': 'Página de prompt de vídeo',
      'sw': 'Ukurasa wa haraka wa Video',
    },
    '5p1hxm0o': {
      'en': 'Prompt One, Hello flutterflow deverlopers',
      'hi': 'संकेत एक, नमस्कार फ़्लटरफ़्लो डेवलपर्स',
      'pt': 'Prompt Um, Olá, deverlopers do flutterflow',
      'sw': 'Prompt One, Hello flutterflow deverlopers',
    },
    'ttkyenwa': {
      'en': 'Prompt Two, Hello flutterflow deverlopers',
      'hi': 'संकेत दो, नमस्कार फ़्लटरफ़्लो डेवलपर्स',
      'pt': 'Prompt dois, Olá, deverlopers do flutterflow',
      'sw': 'Mwongozo wa Pili, Hello flutterflow deverlopers',
    },
    'zqonng1d': {
      'en': 'Prompt Three, Hello flutterflow deverlopers',
      'hi': 'संकेत तीन, नमस्कार फ़्लटरफ़्लो डेवलपर्स',
      'pt': 'Prompt três, Olá, deverlopers do flutterflow',
      'sw': 'Agizo la Tatu, Hujambo wasambazaji wa flutterflow',
    },
    'a7wr3bj3': {
      'en': 'Prompt Four, Hello flutterflow deverlopers',
      'hi': 'संकेत चार, नमस्कार फ़्लटरफ़्लो डेवलपर्स',
      'pt': 'Prompt Quatro, Olá, deverlopers do flutterflow',
      'sw': 'Uhakika wa Nne, Hujambo wasambazaji wa flutterflow',
    },
    'rqf0rdcw': {
      'en': 'Write down your question...',
      'hi': 'अपना प्रश्न लिखें...',
      'pt': 'Escreva sua pergunta...',
      'sw': 'Andika swali lako...',
    },
    'm016gkdc': {
      'en': 'Go',
      'hi': 'जाना',
      'pt': 'Ir',
      'sw': 'Nenda',
    },
    'mr825jdr': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // GeneratedVideoPage
  {
    '2iy66jom': {
      'en': 'Generated Video Page',
      'hi': 'उत्पन्न वीडियो पृष्ठ',
      'pt': 'Página de vídeo gerada',
      'sw': 'Ukurasa wa Video Uliotolewa',
    },
    'qb7jddbc': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // Demo
  {
    'zh1g7dgq': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
      'pt': 'Olá Mundo',
      'sw': 'Salamu, Dunia',
    },
    'gy82r67a': {
      'en': 'Page Title',
      'hi': 'पृष्ठ का शीर्षक',
      'pt': 'Título da página',
      'sw': 'Kichwa cha Ukurasa',
    },
    'owbbpypd': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // DontDeleteThisPage
  {
    'lqosldq9': {
      'en': 'Don\'t Delete This Page',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'juqjum7y': {
      'en': 'Home',
      'hi': 'घर',
      'pt': 'Lar',
      'sw': 'Nyumbani',
    },
  },
  // FarmTutorialHistoryList
  {
    'jy70wcvz': {
      'en': 'Video Tutorial History',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '77dnbwcs': {
      'en': 'Home',
      'hi': '',
      'pt': '',
      'sw': '',
    },
  },
  // TermsAndConditionsCopy
  {
    '695seqab': {
      'en': 'Terms And Conditions',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '2lkdl0i4': {
      'en':
          'Welcome to Farmers-Help! These Terms and Conditions (\"Terms\") govern your use of our mobile app and services provided therein (\"App\"). By accessing or using the App, you agree to be bound by these Terms.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '4nbmukjx': {
      'en': '1. Acceptance of Terms',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'wwv959rr': {
      'en':
          'By accessing or using the App, you agree to comply with these Terms. If you do not agree with any part of these Terms, you may not use the App.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '42fti3xw': {
      'en': '2. Services',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '1ktsuzgd': {
      'en':
          'Our App provides various services aimed at assisting farmers in growing their plants and crops more effectively. These services include but are not limited to:\n\na) Providing agricultural advice and recommendations based on data analysis and AI technology.\n\nb) Offering tools and resources for plant care, pest management, and crop optimization.\n\nc) Facilitating communication and collaboration among farmers and agricultural experts.\n\nd) Providing access to educational content, tutorials, and training materials related to farming practices.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '6drlf9m9': {
      'en': '3. User Conduct',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'uhar880i': {
      'en':
          'You agree to use the App in compliance with all applicable laws, regulations, and these Terms. You shall not:\n\na) Use the App for any unlawful or unauthorized purpose.\n\n b) Interfere with or disrupt the operation of the App or any servers or networks connected to the App.\n\nc)  Transmit any viruses, malware, or harmful code through the App.\n\nd)  Impersonate any person or entity, or falsely state or misrepresent your affiliation with any person or entity.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'tch87i92': {
      'en': '4. Privacy Policy',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'pgc7o1eb': {
      'en':
          'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and disclose your personal information when you use our App.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'gn8am87e': {
      'en': '5. Intellectual Property',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '105ikem4': {
      'en':
          'All content, trademarks, logos, and intellectual property rights displayed on the App are owned by us or our licensors. You may not use, reproduce, or distribute any content from the App without our prior written consent.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'e69dnmo6': {
      'en': '6. Disclaimer of Warranties',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'n4y1jv5f': {
      'en':
          'The App and its services are provided on an \"as-is\" and \"as-available\" basis, without warranties of any kind, either express or implied. We do not guarantee the accuracy, reliability, or completeness of any information provided through the App.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'j6ue49rr': {
      'en': '7. Limitation of Liability',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'a8l57wbq': {
      'en':
          'In no event shall we be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App or its services, even if we have been advised of the possibility of such damages.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '6tywl477': {
      'en': '8. Governing Law',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'mdmxmyy9': {
      'en':
          'These Terms shall be governed by and construed in accordance with the laws, without regard to its conflict of law provisions.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'a6nvkd72': {
      'en': '9. Changes to Terms',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '0zp69zb8': {
      'en':
          'We reserve the right to modify or update these Terms at any time. Your continued use of the App after any changes indicates your acceptance of the modified Terms.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'y5rwwqjc': {
      'en': '10. Contact Us',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'qmdf1qk8': {
      'en':
          'If you have any questions or concerns about these Terms, please contact us at info@flutterflowdevs.com.',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '6spmpqrf': {
      'en': 'Home',
      'hi': '',
      'pt': '',
      'sw': '',
    },
  },
  // Categories_Container
  {
    '0dfwxmrk': {
      'en': 'Crop Practice',
      'hi': 'फसल अभ्यास',
      'pt': 'Prática de colheita',
      'sw': 'Mazoezi ya Mazao',
    },
    'gut4px3q': {
      'en': 'Machinary',
      'hi': 'मशीनरी',
      'pt': 'Maquinário',
      'sw': 'Mashine',
    },
    'ilspg6wd': {
      'en': 'Machinary',
      'hi': 'मशीनरी',
      'pt': 'Maquinário',
      'sw': 'Mashine',
    },
    'lfubb9ab': {
      'en': 'CROP PRACTICE',
      'hi': 'फसल अभ्यास',
      'pt': 'PRÁTICA DE CULTURA',
      'sw': 'MAZOEZI YA MAZAO',
    },
    '3325x5jo': {
      'en':
          'It is a long established fact that a reader will be distracted by ',
      'hi': 'यह एक पुराना स्थापित तथ्य है कि एक पाठक का ध्यान भटक जाएगा',
      'pt': 'É um fato há muito estabelecido que o leitor será distraído por',
      'sw':
          'Ni ukweli uliothibitishwa kwa muda mrefu ambao msomaji atakengeushwa nao',
    },
  },
  // Search_TextField
  {
    'qjuzq5fy': {
      'en': 'Search',
      'hi': 'खोज',
      'pt': 'Procurar',
      'sw': 'Tafuta',
    },
  },
  // Weather_Container
  {
    'hpr41url': {
      'en': 'Today\'s weather updates ',
      'hi': 'आज का मौसम अपडेट',
      'pt': 'Atualizações meteorológicas de hoje',
      'sw': 'Taarifa za hali ya hewa leo',
    },
    'srtbbyrr': {
      'en': 'Max : ',
      'hi': 'अधिकतम :',
      'pt': 'Máx.:',
      'sw': 'Upeo:',
    },
    'lm142kby': {
      'en': 'Min : ',
      'hi': 'न्यूनतम :',
      'pt': 'Mínimo:',
      'sw': 'Dak :',
    },
  },
  // Categories_Container1
  {
    'aj26bz4k': {
      'en': 'Services',
      'hi': 'सेवाएं',
      'pt': 'Serviços',
      'sw': 'Huduma',
    },
    'w8vkn1kp': {
      'en': 'Identify Disease',
      'hi': 'रोग की पहचान करें',
      'pt': 'Identificar doenças',
      'sw': 'Tambua Ugonjwa',
    },
    'l8imtss0': {
      'en': 'Farming Tutorial ',
      'hi': 'खेती ट्यूटोरियल',
      'pt': 'Tutorial de agricultura',
      'sw': 'Mafunzo ya Kilimo',
    },
    '7nc4qll9': {
      'en': 'Virtual Assistant',
      'hi': 'आभासी सहायक',
      'pt': 'Assistente virtual',
      'sw': 'Mratibu wa Mtandao',
    },
  },
  // yourDiagnoses
  {
    'gx5cg41g': {
      'en': 'Your Diagnoses',
      'hi': 'आपका निदान',
      'pt': 'Seus diagnósticos',
      'sw': 'Utambuzi Wako',
    },
    'm1a19t9k': {
      'en': 'View all',
      'hi': 'सभी को देखें',
      'pt': 'Ver tudo',
      'sw': 'Tazama zote',
    },
  },
  // emptyListView
  {
    'b1512vpb': {
      'en': 'No Diagnose Result Available',
      'hi': 'कोई निदान परिणाम उपलब्ध नहीं',
      'pt': 'Nenhum resultado de diagnóstico disponível',
      'sw': 'Hakuna Matokeo ya Utambuzi Yanayopatikana',
    },
  },
  // languageSelection
  {
    'o607fx58': {
      'en': 'Choose Language',
      'hi': 'भाषा चुनें',
      'pt': 'Escolha o seu idioma',
      'sw': 'Chagua Lugha',
    },
    'uaj9ux8d': {
      'en': 'Save',
      'hi': 'बचाना',
      'pt': 'Salvar',
      'sw': 'Hifadhi',
    },
  },
  // Miscellaneous
  {
    'qbw2uwy3': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'ncpny661': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'qphmdu7a': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'avgarw5k': {
      'en':
          'In order to get speech to text working, this app requires permission to access the microphone',
      'hi':
          'स्पीच टू टेक्स्ट को काम करने के लिए, इस ऐप को माइक्रोफ़ोन तक पहुंचने की अनुमति की आवश्यकता होती है',
      'pt':
          'Para que a fala em texto funcione, este aplicativo requer permissão para acessar o microfone',
      'sw':
          'Ili kupata hotuba kwa maandishi kufanya kazi, programu hii inahitaji ruhusa ya kufikia maikrofoni',
    },
    'g0d0ddu8': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'qjkdtxsb': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'vt6i22hl': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'nyl84g2t': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'i8lovdx4': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '6z5t8q8q': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'q2enafjv': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'ilh1hh6v': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'hxxlix1o': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'e05dsw9s': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'jxra8ubc': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'j8kh1ojv': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '117ipk0m': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'jb9k4mtq': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'usfu6ort': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'cq92h1dr': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '5ew8zins': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '2hpzt78w': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'wvasxgjm': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'wgehw5cs': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'xn5jtjdz': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'u8ype0jb': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'vzvhu878': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    '2vz70vgd': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
    'beep3tn8': {
      'en': '',
      'hi': '',
      'pt': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
