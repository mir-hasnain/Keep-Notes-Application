import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keep_notes/Views/homescreen.dart';
void main()async{
  await  Hive.deleteFromDisk();
  Hive.registerAdapter(ColorAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('myBox3');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
