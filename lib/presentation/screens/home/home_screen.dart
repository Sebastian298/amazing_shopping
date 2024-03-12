import 'package:amazing_shopping/domain/entities/auth/user_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  final UserResponse? user;
  static const name = 'home';
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: Icon(
            Icons.shop_2_outlined,
            color: colors.primary,
          ),
          onPressed: null,
        ),
        title: Text(
          'Amazing Shopping',
          style: titleStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: colors.primary,
            ),
            onPressed: () => {},
          ),
          _PopUpMenuButtonLogOut(user: user),
        ],
      ),
      body: const Center(
        child: Placeholder(),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;
  return IconButton(
    icon: Icon(
      Icons.shopping_cart_outlined,
      color: colors.primary,
    ),
    onPressed: () => {},
  );
}

class _PopUpMenuButtonLogOut extends ConsumerWidget {
  final UserResponse? user;
  //final WidgetRef ref;
  const _PopUpMenuButtonLogOut({
    required this.user,
    //required this.ref,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      icon: Image.network(
        user?.photoUrl ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbZPi8Q25_Wy5OnIrMEji5_Rk63WhS77URXw&usqp=CAU',
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
            child: const Text(
              'Log out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () =>
                ref.read(authenticationNotifierProvider.notifier).logOutUser()),
      ],
    );
  }
}
