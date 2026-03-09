import 'dart:io';
import 'package:mason/mason.dart';

/** Runs after the template is generated to create the proper folders for the Android Kotlin files */
void run(HookContext context) {
  // 1) Get the app name and org from the context variables
  final appName = context.vars['app_name'] as String;
  final org = context.vars['org'] as String;

  // 2) Convert com.johndoe into com/johndoe path
  final orgPath = org.replaceAll('.', Platform.pathSeparator);
  
  // 3) Define the base directory for Kotlin files and the target directory for MainActivity.kt
  final kotlinBase = Directory('android/app/src/main/kotlin');
  final targetDir = Directory(
    '${kotlinBase.path}${Platform.pathSeparator}$orgPath${Platform.pathSeparator}$appName'
  );
  
  // 4) Create the correct directory structure
  targetDir.createSync(recursive: true);

  // 5) Move MainActivity.kt from placeholder to correct location and rename it
  final source = File(
    '${kotlinBase.path}${Platform.pathSeparator}placeholder${Platform.pathSeparator}MainActivity.kt'
  );
  source.renameSync('${targetDir.path}${Platform.pathSeparator}MainActivity.kt');

  // 6) Remove placeholder folder
  Directory('${kotlinBase.path}${Platform.pathSeparator}placeholder').deleteSync();
}