import 'package:flutter/material.dart';
import 'package:mi_card/widgets/auth/authenticate.dart';
import 'package:mi_card/widgets/auth/userModel.dart';
import 'package:mi_card/widgets/bottomNav/bottomNav.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      // Return authenticate if not logged in
      return Authenticate();
    } else {
      // Return bottomNav if logged in
      return BottomNav();
    }
  }
}
