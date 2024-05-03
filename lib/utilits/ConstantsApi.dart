enum Environment { DEV, STAGING, PROD }

class ConstantApi {
  static Map<String, dynamic> _config = _Config.debugConstants;

  static String loginUrl = SERVER_ONE + "authentication/login";
  static String registrationUrl = SERVER_ONE + "authentication/registration";
  static String editProfileUrl = SERVER_ONE + "profile/edit_profile";
  static String otpVerificationUrl = SERVER_ONE + "authentication/otp_verification";
  static String resentOtpVerificationUrl = SERVER_ONE + "authentication/resend_otp";
  static String homeDashBoardUrl = SERVER_ONE + "home/home_dashboard";
  static String onlineListUrl = SERVER_ONE + "task/online_category_task_list";
  static String doorStepListUrl = SERVER_ONE + "task/doorstep_category_task_list";
  static String emergencyTaskListUrl = SERVER_ONE + "task/emergency_category_task_list";
  static String taskDetailUrl = SERVER_ONE + "task/task_detail";
  static String bookingStep1Url = SERVER_ONE + "bookings/step1";
  static String bookingStep2Url = SERVER_ONE + "bookings/step2";
  static String profileUrl = SERVER_ONE + "profile/get_profile";
  static String createTaskUrl = SERVER_ONE + "task/create_customer_task";
  static String reviewListUrl = SERVER_ONE + "review/reviews_list";
  static String doorStepBookingUrl = SERVER_ONE + "bookings/door_step_booking_list";
  static String emegencyBookingUrl = SERVER_ONE + "bookings/emergency_booking_list";
  static String onlineBookingUrl = SERVER_ONE + "bookings/online_booking_list";
  static String bookingRejectionUrl = SERVER_ONE + "bookings/booking_rejection";
  static String addReviewUrl = SERVER_ONE + "review/add_review";
  static String reviewDetailUrl = SERVER_ONE + "review/add_review_page";
  static String bookingRecheduleUrl = SERVER_ONE + "bookings/reschedule_booking";
  static String favouriteListUrl = SERVER_ONE + "favorites/favorite_list";
  static String addFavouriteUrl = SERVER_ONE + "favorites/add_favorite";
  static String notificationListUrl = SERVER_ONE + "notification/notification_list";
  static String allTaskUrl = SERVER_ONE + "task/all_task_list";
  static String inboxUrl = SERVER_ONE + "profile/user_inbox_list";
  static String uploadOnlineUrl = SERVER_ONE + "bookings/upload_document_for_online_task";
  static String completeBookingUrl = SERVER_ONE + "task/complete_booking";
  static String locationUrl = SERVER_ONE + "authentication/location_list";
  static String updateLocationUrl = SERVER_ONE + "authentication/update_location";
  static String subCategoeryListUrl = SERVER_ONE + "task/subcategory_name_list";
  static String randomSuggestUrl = SERVER_ONE + "task/random_suggest_word";
  static String coupounsListUrl = SERVER_ONE + "bookings/coupon_list";
  static String applyCouponUrl = SERVER_ONE + "bookings/apply_coupon";
  static String paymentSummaryUrl = SERVER_ONE + "bookings/payment_summary";
  static String chatRequestUrl = SERVER_ONE + "profile/chatbot_request";
  static String logOutUrl = SERVER_ONE + "authentication/logout";
  static String appSettingUrl = SERVER_ONE + "home/app_settings";
  static String freeBookingUrl = SERVER_ONE + "bookings/emergency_free_booking";

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
  static const BUILD_VARIANTS = "Taskers-dev";

  static Map<String, dynamic> debugConstants = {
    SERVER_ONE: "https://wetaskers.com/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };

  static Map<String, dynamic> stagingConstants = {
    SERVER_ONE: "https://wetaskers.com/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER_ONE: "https://wetaskers.com/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };
}
