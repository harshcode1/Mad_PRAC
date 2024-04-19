// Mixin for user authentication
mixin Authenticator {
  // Simulate user authentication based on username and password
  bool authenticateUser(String username, String password) {
    // Here, you can implement actual authentication logic like checking against a database or an external service
    if (username == 'admin' && password == 'admin123') {
      print('User authenticated successfully');
      return true;
    } else {
      print('Authentication failed');
      return false;
    }
  }
}

// Mixin for user authorization
mixin AuthorizationManager {
  // Define roles and permissions
  Map<String, List<String>> rolesAndPermissions = {
    'admin': ['create', 'read', 'update', 'delete'],
    'user': ['read'],
  };

  // Method to check if user has permission for a specific action
  bool hasPermission(String role, String permission) {
    return rolesAndPermissions.containsKey(role) &&
        rolesAndPermissions[role]!.contains(permission);
  }
}

// User class implementing Authenticator and AuthorizationManager mixins
class User with Authenticator, AuthorizationManager {
  String username;
  String role;

  User(this.username, this.role);

  // Method to login and authenticate user
  void login(String password) {
    if (authenticateUser(username, password)) {
      print('User logged in successfully');
    } else {
      print('Login failed');
    }
  }

  // Method to check if user has permission for a specific action
  bool hasAccess(String permission) {
    return hasPermission(role, permission);
  }
}

void main() {
  // Example usage
  var user1 = User('admin', 'admin');
  var user2 = User('john', 'user');

  user1.login('admin123'); // User logged in successfully
  user2.login('password'); // Login failed

  print(user1.hasAccess('create')); // true
  print(user2.hasAccess('update')); // false
}
