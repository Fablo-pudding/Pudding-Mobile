
class ApiEndpoints {
  /// 공통주소
  static const _timerBaseUrl = "/timer";
  static const _inquiryBaseUrl = "/inquiry";

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
  static const feedDetailCheck = "/feed/get-detail";
  static const feedUpdate = "/feed/update";
  static const feedDelete = "/feed/delete";

  /// comment
  static const commentWrite = "/comment/create";
  static const commentEdit = "/comment/update";
  static const commentDelete = "/comment/delete";

  /// storage
  static const storageCheck = "/storage";
  static const make = "/storage/make";
  static const upgradeOne = "/storage/upgrade-one";
  static const upgradeTwo = "/storage/upgrade-two";
  static const ingredient = "/storage/get-ingredient";

  /// timer
  static const createTimer = _timerBaseUrl;
  static const timerCheck = _timerBaseUrl;

  /// inquiry
  static const inquiryRegister = "/inquiry/create";
  static const myCheck = "/inquiry/my";
  static const inquiryAllCheck = _inquiryBaseUrl;
  static const inquiryDetailCheck = _inquiryBaseUrl;
  static const inquiryAnswer = _inquiryBaseUrl;
  static const inquiryDelete = _inquiryBaseUrl;

  /// notice
  static const noticeWrite = "/notice/create";
  static const noticeCheck = "/notice/get-list";
  static const update = "/notice/update";
  static const delete = "/notice/delete";
  static const  noticeDetail = "/notice/read";
}
