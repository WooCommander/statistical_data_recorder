// Определение класса UserDatabase для управления данными пользователя.
class UserDatabase {
  static final Map<String, String> _users = {
    'user1': 'password1',
    'user2': 'password2'
  };

  bool authenticate(String username, String password) {
    if (_users.containsKey(username) && _users[username] == password) {
      return true;
    }
    return false;
  }
}
