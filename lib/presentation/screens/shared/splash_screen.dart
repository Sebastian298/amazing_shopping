import 'package:amazing_shopping/presentation/screens/logIn/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );
}

final slices = <SlideInfo>[
  const SlideInfo(
    'Busca la comida',
    'Ut officia velit nisi sint non cupidatat non.',
    'assets/images/1.png',
  ),
  const SlideInfo(
    'Entrega la comida',
    'Et reprehenderit ipsum excepteur ea nisi consequat est labore.',
    'assets/images/2.png',
  ),
  const SlideInfo(
    'Disfruta la comida',
    'Laborum amet elit occaecat proident in eiusmod elit do aliqua id Lorem nostrud aliqua labore.',
    'assets/images/3.png',
  ),
];

class SplashScreen extends StatefulWidget {
  static const String name = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= slices.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slices
                .map(
                  (e) => _Slide(
                    title: e.title,
                    caption: e.caption,
                    imageUrl: e.imageUrl,
                  ),
                )
                .toList(),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {
                        context.goNamed(LogInScreen.name);
                      },
                      child: const Text('Lets LogIn'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(height: 10),
          Text(
            caption,
            style: captionStyle,
          ),
        ],
      ),
    );
  }
}
