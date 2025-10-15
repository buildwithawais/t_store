import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

import 'firebase_options.dart';

const supabaseUrl = 'https://jobtwrnywubkskdyzxve.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpvYnR3cm55d3Via3NrZHl6eHZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkyOTU0NzksImV4cCI6MjA3NDg3MTQ3OX0.PDqm6rv2k2x3hsCOIoFqDCIHmKO61BbutbbJ0iF6C6o';

Future<void> main() async {
  /// Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await TLocalStorage.init('TStore');

  /// Await Flutter Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  /// Initialize Supabase
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  // Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}
