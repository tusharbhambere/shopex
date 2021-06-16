import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopex/view/HomePage/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/ServiceController/product_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FeatchProduct>(
            create: (context) => FeatchProduct(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ));
  }
}
