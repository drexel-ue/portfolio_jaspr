import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:portfolio_jaspr/constants/layout.dart';

import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  static const _routes = [
    (label: 'Home', path: '/'),
    (label: 'Experience', path: '/experience'),
    (label: 'Projects', path: '/projects'),
    (label: 'About', path: '/about'),
  ];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    var activePath = context.binding.currentUri.path;

    yield header([
      nav([
        div(classes: 'logo', [
          Link(
            to: '/',
            child: img(src: 'icons/logo.svg', alt: 'logo', width: 35, height: 39),
          ),
        ]),
        div(classes: 'nav-items', [
          for (var route in _routes)
            div(classes: 'nav-item ${activePath == route.path ? 'active' : ''}', [
              Link(to: route.path, child: text(route.label)),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static final styles = <StyleRule>[
    css('header', [
      css('&') //
          .background(color: eerieBlack)
          .flexbox(justifyContent: JustifyContent.center)
          .box(
            display: Display.flex,
            position: const Position.sticky(top: Unit.zero),
          ),
      css('nav', [
        css('&')
            .box(
              maxWidth: maxWidth,
              margin: EdgeInsets.symmetric(
                horizontal: 16.px,
                vertical: 37.px,
              ),
              display: Display.flex,
            )
            .flexbox(
              alignItems: AlignItems.center,
              justifyContent: JustifyContent.spaceBetween,
            )
            .flexItem(flex: flexGrow1),
        css('.nav-items', [
          css('&') //
              .box(display: Display.flex)
              .flexbox(
                alignItems: AlignItems.center,
                justifyContent: JustifyContent.end,
              ),
          css('.nav-item', [
            css('&').box(margin: EdgeInsets.only(left: 20.px)),
            css('&.active a').text(color: grape),
            css('a').text(
              fontSize: 18.px,
              color: white,
              decoration: TextDecoration.none,
            ),
          ]),
        ]),
      ]),
    ]),
  ];
}
