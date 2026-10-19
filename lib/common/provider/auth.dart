import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pudding/common/data/service/auth.dart';

final authProvider = Provider<Auth>((ref){
  return Auth();
});