class ApiEndpoints {
  /// BaseURL
  static const baseURL = "http://34.207.16.33:8080/";

  /// User
  static const signUp = "/user/signup";
  static const login = "/user/login";
  static const logout = "/user/logout";
  static const myInfo = "/user/info";

  /// ranking
  static const rankingCheck = "/ranking/global";
  static const my = "/ranking/my";

  /// feed
  static const feedWrite = "/feed/create";
  static const feedCheck = "/feed/get-list";
  static const feedDetailCheck = "/feed/-detail";
  static const feedUpdate = "/feed/update/";
  static const feedDelete = "/feed/delete/";

  /// comment
  static const commentWrite = "/comment/create";
  static const commentEdit = "/comment/update";
  static const commentDelete = "/comment/delete";

  /// storage
  static const storageCheck = "/storage";
  static const make = "/storage/make";
  static const upgradeOne = "/storage/upgrade-one";
  static const upgradeTwo = "/storage/upgrade-two";
  static const milk = "/storage/get-milk";
  static const egg = "/storage/get-egg";
  static const sugar = "/storage/get-sugar";

  /// inquiry
  static const inquiryRegister = "/inquiry/create";
  static const myCheck = "/inquiry/my";
  static const inquiryCheck = "/inquiry";
  
  /// notice
  static const noticeWrite = "/notice/create";
  static const noticeCheck = "/notice/get-list";
  static const update = "/notice/update";
  static const delete = "/notice/delete";
}
