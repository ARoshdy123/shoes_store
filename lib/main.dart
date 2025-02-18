import 'package:flutter/material.dart';
import 'package:shoes_store/presentation/page/shoes_page.dart';
import 'injection_container.dart' as di;

/// the main of the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const ShoesStoreApp());
}


class ShoesStoreApp extends StatelessWidget {
  const ShoesStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Shoes Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShoesPage(),
    );
  }
}
