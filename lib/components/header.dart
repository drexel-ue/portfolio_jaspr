import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = context.binding.currentUri.path;

    yield header([
      nav([
        div(classes: 'logo', [
          Link(to: '/', child: img(src: 'icons/logo.svg', alt: 'logo', width: 35, height: 39)),
        ]),
        div(classes: 'horizontal-spacer', []),
        for (var route in [
          (label: 'Home', path: '/'),
          (label: 'Experience', path: '/experience'),
          (label: 'Projects', path: '/projects'),
          (label: 'About', path: '/about'),
        ])
          div(classes: 'nav-item ${activePath == route.path ? 'active' : ''}', [
            Link(to: route.path, child: text(route.label)),
          ]),
      ]),
    ]);
  }

  @css
  static final styles = <StyleRule>[
    css('header', [
      css('&').background(color: eerieBlack),
      css('nav', [
        css('&')
            .box(
              maxWidth: 1160.px,
              margin: EdgeInsets.symmetric(horizontal: Unit.auto, vertical: 37.px),
              display: Display.flex,
            )
            .flexbox(alignItems: AlignItems.center),
        css('div', [
          css('&').box(display: Display.inline),
          css('&.horizontal-spacer').flexItem(flex: const Flex(grow: 1)),
          css('&.nav-item', [
            css('&').box(margin: EdgeInsets.symmetric(horizontal: 40.px)),
            css('&.active a').text(color: grape),
            css('a').text(fontSize: 18.px, color: white, decoration: TextDecoration.none),
          ]),
        ]),
      ]),
    ]),
  ];
}
