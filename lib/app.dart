import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio_jaspr/constants/layout.dart';
import 'package:portfolio_jaspr/constants/theme.dart';
import 'package:portfolio_jaspr/pages/experience.dart';
import 'package:portfolio_jaspr/pages/projects.dart';

import 'components/header.dart';
import 'pages/about.dart';
import 'pages/home.dart';

// The main component of your application.
//
// By using multi-page routing, this component will only be built on the server during pre-rendering and
// **not** executed on the client. Instead only the nested [Home] and [About] components will be mounted on the client.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // This method is rerun every time the component is rebuilt.
    //
    // Each build method can return multiple child components as an [Iterable]. The recommended approach
    // is using the [sync* / yield] syntax for a streamlined control flow, but its also possible to simply
    // create and return a [List] here.

    // Renders a <div class="main"> html element with children.
    yield div(classes: 'main', [
      const Header(),
      div(classes: 'main-content', [
        div(classes: 'main-content-inner', [
          Router(routes: [
            Route(path: '/', title: 'Home', builder: (context, state) => const Home()),
            Route(
              path: '/experience',
              title: 'Experience',
              builder: (context, state) => const Experience(),
            ),
            Route(
                path: '/projects',
                title: 'Projects',
                builder: (context, state) => const Projects()),
            Route(path: '/about', title: 'About', builder: (context, state) => const About()),
          ]),
        ]),
      ]),
    ]);
  }

  // Defines the css styles for elements of this component.
  //
  // By using the @css annotation, these will be rendered automatically to css inside the <head> of your page.
  // Must be a variable or getter of type [List<StyleRule>].
  @css
  static final styles = <StyleRule>[
    css('.main', [
      // The '&' refers to the parent selector of a nested style rules.
      css('&') //
          .background(color: chineseBlack)
          .flexbox(direction: FlexDirection.column)
          .box(
            height: 100.vh,
            width: 100.vw,
            display: Display.flex,
          ),
      css('section').flexItem(flex: const Flex(grow: 1)).flexbox(
            direction: FlexDirection.column,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
          ),
      css('.main-content', [
        css('&') //
            .box(display: Display.flex)
            .flexbox(justifyContent: JustifyContent.center),
        css('.main-content-inner', [
          css('&') //
              .flexItem(flex: flexGrow1)
              .box(
                maxWidth: maxWidth,
                margin: EdgeInsets.symmetric(horizontal: 16.px),
              ),
        ]),
      ]),
    ]),
  ];
}
