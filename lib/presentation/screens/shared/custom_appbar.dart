import 'package:amazing_shopping/domain/entities/auth/user_response.dart';
import 'package:amazing_shopping/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends StatelessWidget {
  final UserResponse user;
  const CustomAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              IconButton(
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Icon(
                  Icons.shop_2_outlined,
                  color: colors.primary,
                ),
                onPressed: null,
              ),
              Text(
                'Amazing Shopping',
                style: titleStyle,
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: colors.primary,
                ),
                onPressed: () => {},
              ),
              _PopUpMenuButtonLogOut(
                userPhoto: user.photoUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopUpMenuButtonLogOut extends ConsumerWidget {
  final String? userPhoto;
  const _PopUpMenuButtonLogOut({required this.userPhoto});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      icon: Image.network(
        userPhoto ??
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
