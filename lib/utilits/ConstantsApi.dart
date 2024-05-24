enum Environment { DEV, STAGING, PROD }

class ConstantApi {
  static Map<String, dynamic> _config = _Config.debugConstants;

  static String loginUrl = SERVER_ONE + "authentication/login";
  static String logOutUrl = SERVER_ONE + "authentication/logout";
  static String registrationUrl1 = SERVER_ONE + "authentication/registration1";
  static String registrationUrl2 = SERVER_ONE + "authentication/registration2";
  static String registrationUrl3 = SERVER_ONE + "authentication/registration3";
  static String registrationUrl5 = SERVER_ONE + "authentication/registration5";
  static String registrationUrl6 = SERVER_ONE + "authentication/registration6";
  static String registrationUrl7 = SERVER_ONE + "authentication/registration7";
  static String registrationUrl4 = SERVER_ONE + "authentication/registration4";
  static String registrationUrl8 = SERVER_ONE + "authentication/registration8";
  static String otpVerificationUrl = SERVER_ONE + "authentication/otp_verification";
  static String phoneNumberVerificationUrl = SERVER_ONE + "authentication/phone_num_verification";
  static String otpResentUrl = SERVER_ONE + "authentication/resend_otp";
  static String homeDashBaordUrl = SERVER_ONE + "matrimony/home";
  static String userDetailUrl = SERVER_ONE + "matrimony/user_details";


  static String SOMETHING_WRONG = "Some thing wrong";
  static String NO_INTERNET = "No internet Connection";
  static String BAD_RESPONSE = "Bad Response";
  static String UNAUTHORIZED = "Un Athurized";

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAGING:
        _config = _Config.stagingConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get SERVER_ONE {
    return _config[_Config.SERVER_ONE];
  }

  static get BUILD_VARIANTS {
    return _config[_Config.BUILD_VARIANTS];
  }
}

class _Config {
  static const SERVER_ONE = "";
  static const BUILD_VARIANTS = "VVMatrimony-dev";

  static Map<String, dynamic> debugConstants = {
    SERVER_ONE: "https://wetaskers.in/api/",
    BUILD_VARIANTS: "VVMatrimony Dev",
  };

  static Map<String, dynamic> stagingConstants = {
    SERVER_ONE: "https://wetaskers.in/api/",
    BUILD_VARIANTS: "VVMatrimony Dev",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER_ONE: "https://wetaskers.in/api/",
    BUILD_VARIANTS: "VVMatrimony Dev",
  };
}
