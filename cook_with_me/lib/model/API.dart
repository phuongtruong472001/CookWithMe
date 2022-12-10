class API {
  static String baseLink = "https://cookwithmebe-production.up.railway.app/";
  static String linkPost = "${baseLink}posts";
  static String linkLogin = "${baseLink}auth/login";
  static String linkLogOut = "${baseLink}auth/logout";
  static String linkRegister = "${baseLink}auth/register";
  static String checkOTP = "${baseLink}auth/checkotp";
  static String getProfile = "${baseLink}auth/getMe";
  static String sendOTP = "${baseLink}auth/fogotpassword";
  static String linkCategory = "${baseLink}category";
  static String linkRecommend = "${baseLink}recommend";
  static String linkPostOfMe = "${baseLink}posts/user/";
  static String changePassword = "${baseLink}auth/updatepassword";
  static String linkInforOfMe = "${baseLink}auth/getMe";
  static String linkSearchPost = "${baseLink}posts/search";
}
