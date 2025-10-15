import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TCustomAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ratings and reviews are verified and are from people who use the same type of device that you use."),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Overall Product Ratings
            TOverallProductRating(),
            TRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// User's Review List
            TUserReviewCard(),
            TUserReviewCard(),
            TUserReviewCard(),
            TUserReviewCard(),
            TUserReviewCard(),
          ],
        ),
      ),
    );
  }
}

