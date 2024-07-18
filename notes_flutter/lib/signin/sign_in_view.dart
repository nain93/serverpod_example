import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart' as kakao;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart'
    as kakao_install;
import 'package:notes_flutter/utils/router.config.dart';
import 'package:notes_flutter/widgets/button.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInView extends StatefulHookConsumerWidget {
  const SignInView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  var kakaoLoading = false;
  var textStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    Future<void> handleKakaoLogin() async {
      setState(() {
        kakaoLoading = true;
      });
      try {
        var isInstalled = await kakao_install.isKakaoTalkInstalled();

        var token = isInstalled
            ? await kakao.UserApi.instance.loginWithKakaoTalk()
            : await kakao.UserApi.instance.loginWithKakaoAccount();

        if (context.mounted) {
          context.go(GoRoutes.home.fullPath);
        }
      } catch (e) {
        // TODO: toast message
      }
      setState(() {
        kakaoLoading = false;
      });
    }

    Future<void> handleAppleLogin() async {
      // var credential = await SignInWithApple.getAppleIDCredential(
      await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],

        // credential.identityToken != null && credential.userIdentifier != null
        // redirect_url 이 localhost면 로그인 안됨
        // https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_js/incorporating_sign_in_with_apple_into_other_platforms
      );
      // TODO ios 개발자계정 결제후 app id 추가해야됨
      // print('credential:$credential');
      // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
      // after they have been validated with Apple (see `Integration` section for more information on how to do this)
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Button(
                textStyle: textStyle,
                backgroundColor: const Color(0XFFFAE100),
                borderRadius: 5,
                text: '카카오톡으로 로그인',
                onPressed: handleKakaoLogin,
                loading: kakaoLoading,
                loadingColor: Colors.black,
              ),
              const Gap(10),
              Button(
                onPressed: () {},
                borderColor: Colors.black,
                borderWidth: 1,
                textStyle: textStyle.copyWith(color: Colors.white),
                backgroundColor: const Color(0XFF19CE60),
                borderRadius: 5,
                text: '네이버 로그인',
              ),
              const Gap(10),
              Button(
                onPressed: () {},
                borderColor: Colors.black,
                borderWidth: 1,
                borderRadius: 5,
                textStyle: textStyle,
                backgroundColor: Colors.white,
                text: '구글 로그인',
              ),
              const Gap(10),
              Platform.isIOS
                  ? Button(
                      onPressed: handleAppleLogin,
                      borderColor: Colors.white,
                      borderWidth: 1,
                      textStyle: textStyle.copyWith(color: Colors.white),
                      backgroundColor: Colors.black,
                      borderRadius: 5,
                      text: '애플 로그인',
                    )
                  : const SizedBox(),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
