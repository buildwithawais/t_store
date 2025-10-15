import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TCustomAppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
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
                            height: 80,
                            width: 80,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                  }),
                  TextButton(
                    onPressed: () => controller.uploadProfilePicture(),
                    child: Text('Change Profile Picture'),
                  ),
                ],
              ),
            ),

            /// Details
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeadings(
              title: 'Profile Information',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Profile Info
            TProfileMenu(
              title: 'Name',
              value: controller.user.value.fullName,
              onPressed: () => Get.to(() => const TChangeName()),
            ),
            TProfileMenu(
              title: 'Username',
              value: controller.user.value.userName,
              onPressed: () {},
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal Info
            const TSectionHeadings(
              title: 'Personal Information',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(
              title: 'User ID',
              value: controller.user.value.id,
              onPressed: () {},
            ),
            TProfileMenu(
              title: 'E-mail',
              value: controller.user.value.email,
              onPressed: () {},
            ),
            TProfileMenu(
              title: 'Phone Number',
              value: controller.user.value.phoneNumber,
              onPressed: () {},
            ),
            TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
            TProfileMenu(
              title: 'Date of Birth',
              value: '16 Oct 2004',
              onPressed: () {},
            ),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Close Account Button
            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
