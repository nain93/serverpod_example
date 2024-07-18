import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_flutter/home/home_view.dart';
import 'package:notes_flutter/matchList/match_list_view.dart';
import 'package:notes_flutter/message/message_view.dart';
import 'package:notes_flutter/my/my_view.dart';
import 'package:notes_flutter/signin/sign_in_view.dart';
import 'package:notes_flutter/widgets/main_bottom_tab.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

enum GoRoutes {
  signIn,
  home,
  matchList,
  message,
  my,
}

extension GoRoutesName on GoRoutes {
  /// Convert to `lower-snake-case` format.
  String get path {
    var exp = RegExp(r'(?<=[a-z])[A-Z]');
    var result =
        name.replaceAllMapped(exp, (m) => '-${m.group(0)}').toLowerCase();
    return result;
  }

  /// Convert to `lower-snake-case` format with `/`.
  String get fullPath {
    var exp = RegExp(r'(?<=[a-z])[A-Z]');
    var result =
        name.replaceAllMapped(exp, (m) => '-${m.group(0)}').toLowerCase();
    return '/$result';
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  int? duration,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration(milliseconds: duration ?? 120),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage buildIosPageTransitions<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 180),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

final routeProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: GoRoutes.home.fullPath,
    redirect: (context, state) async {
      // var token = await TokenRepository.instance.getToken();
      // if (token == null) {
      //   /// 토큰 없으면 signIn으로 리다이렉트
      //   return GoRoutes.signIn.fullPath;
      // }
      return null;
    },
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return MainBottomTab(
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: GoRoutes.home.name,
            path: GoRoutes.home.fullPath,
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const HomeView(),
              );
            },
          ),
          GoRoute(
            name: GoRoutes.matchList.name,
            path: GoRoutes.matchList.fullPath,
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const MatchListView(),
              );
            },
          ),
          GoRoute(
            name: GoRoutes.message.name,
            path: GoRoutes.message.fullPath,
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const MessageView(),
              );
            },
          ),
          GoRoute(
            name: GoRoutes.my.name,
            path: GoRoutes.my.fullPath,
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const MyView(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: GoRoutes.signIn.name,
        path: GoRoutes.signIn.fullPath,
        pageBuilder: (context, state) {
          return buildIosPageTransitions<void>(
            context: context,
            state: state,
            child: const SignInView(),
          );
        },
      ),
    ],
  ),
);
