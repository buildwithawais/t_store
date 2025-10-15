import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.user)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ]),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// User Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('22 Aug, 2025', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText('The user interface of the opp is quite intuitive. I was able to navigate and make purchases seamlessly Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' show more',
          trimExpandedText: ' show less',
          moreStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold ,color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold ,color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Company Reviews
        TRoundedContainer(
          backGroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding:  const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("T's Store", style: Theme.of(context).textTheme.titleMedium),
                  Text("23 Aug, 2025", style: Theme.of(context).textTheme.bodyMedium),
                  ]),

                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText('The user interface of the opp is quite intuitive. I was able to navigate and make purchases seamlessly Great job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' show more',
                  trimExpandedText: ' show less',
                  moreStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold ,color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold ,color: TColors.primary),
                ),
              ]),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
