import 'package:flutter/material.dart';
import 'package:mi_card/routes/routes.dart';
import 'package:mi_card/services/auth.dart';
import 'package:mi_card/widgets/auth/userModel.dart';
import 'package:mi_card/widgets/auth/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        home: Wrapper(),
      ),
    );
  }
}
