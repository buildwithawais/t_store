import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/t_circular_image.dart';
import '../shimmers/shimmer.dart';

class TUserProfileCard extends StatelessWidget {
  const TUserProfileCard({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty
            ? networkImage
            : TImages.user;
        return controller.imageUploading.value
            ? const TShimmerEffect(
          width: 80,
          height: 80,
          radius: 80,
        )
            : TCircularImage(
          image: image,
          height: 50,
          width: 50,
          padding: 0,
          isNetworkImage: networkImage.isNotEmpty,
        );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
