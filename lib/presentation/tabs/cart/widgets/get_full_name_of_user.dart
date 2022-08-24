import '../../../../models/user/user_item/user_item.dart';

String getFullNameOfUser({required List<UserItem> users, required int id}) {
  for (int i = 0; i < users.length; i++) {
    if (id == users[i].id) {
      return "${users[i].name.firstname} ${users[i].name.lastname}";
    }
  }
  return '';
}
