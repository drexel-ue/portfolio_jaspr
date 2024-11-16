// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:portfolio_jaspr/components/header.dart' as prefix0;
import 'package:portfolio_jaspr/pages/about.dart' as prefix1;
import 'package:portfolio_jaspr/pages/experience.dart' as prefix2;
import 'package:portfolio_jaspr/pages/home.dart' as prefix3;
import 'package:portfolio_jaspr/pages/projects.dart' as prefix4;
import 'package:portfolio_jaspr/app.dart' as prefix5;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
final defaultJasprOptions = JasprOptions(
  clients: {
    prefix1.About: ClientTarget<prefix1.About>('pages/about'),
    prefix2.Experience: ClientTarget<prefix2.Experience>('pages/experience'),
    prefix3.Home: ClientTarget<prefix3.Home>('pages/home'),
    prefix4.Projects: ClientTarget<prefix4.Projects>('pages/projects'),
  },
  styles: () => [
    ...prefix0.Header.styles,
    ...prefix3.Home.styles,
    ...prefix4.Projects.styles,
    ...prefix5.App.styles,
  ],
);
