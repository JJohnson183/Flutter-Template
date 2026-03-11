import 'dart:io';
import 'package:mason/mason.dart';

/** Runs after the template is generated to create the proper folders for the Android Kotlin files */
void run(HookContext context) {
  // 1) Get the app name and org from the context variables
  final appName = context.vars['app_name'] as String;
  final org = context.vars['org'] as String;

  context.logger.info('app_name: $appName');
  context.logger.info('org: $org');

  // 2) Convert com.johndoe into com/johndoe path
  final orgPath = org.replaceAll('.', Platform.pathSeparator);
  context.logger.info('orgPath: $orgPath');
  
  // 3) Define the base directory for Kotlin files and the target directory for MainActivity.kt
  final kotlinBase = Directory('android/app/src/main/kotlin');
  context.logger.info('kotlinBase exists: ${kotlinBase.existsSync()}');

  final targetDir = Directory(
    '${kotlinBase.path}${Platform.pathSeparator}$orgPath${Platform.pathSeparator}$appName'
  );
  context.logger.info('targetDir: ${targetDir.path}');
  
  // 4) Create the correct directory structure
  targetDir.createSync(recursive: true);
  context.logger.info('targetDir created');

  // 5) Move MainActivity.kt from placeholder to correct location and rename it
  final source = File(
    '${kotlinBase.path}${Platform.pathSeparator}placeholder${Platform.pathSeparator}MainActivity.kt'
  );
  context.logger.info('source exists: ${source.existsSync()}');

  source.renameSync('${targetDir.path}${Platform.pathSeparator}MainActivity.kt');
  context.logger.info('MainActivity.kt moved');

  // 6) Remove placeholder folder
  Directory('${kotlinBase.path}${Platform.pathSeparator}placeholder').deleteSync();
  context.logger.info('placeholder deleted');
}