import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/routes/routes.dart';

import '../../features/shop/models/brand_category_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_category_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../../utils/constants/image_strings.dart';

class TDummyData {
  /// -- Brand Model
  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      name: 'Apple',
      image: TImages.appleLogo,
      isFeatured: true,
      productCount: 24,
    ),
    BrandModel(
      id: '2',
      name: 'Samsung',
      image: TImages.samsungLogo,
      isFeatured: true,
      productCount: 20,
    ),
    BrandModel(
      id: '3',
      name: 'Nike',
      image: TImages.nikeLogo,
      isFeatured: true,
      productCount: 30,
    ),
    BrandModel(
      id: '4',
      name: 'Adidas',
      image: TImages.adidasLogo,
      isFeatured: true,
      productCount: 28,
    ),
    BrandModel(
      id: '5',
      name: 'Zara',
      image: TImages.zaraLogo,
      isFeatured: false,
      productCount: 18,
    ),
    BrandModel(
      id: '6',
      name: 'Dior',
      image: TImages.diorLogo,
      isFeatured: true,
      productCount: 6,
    ),
    BrandModel(
      id: '7',
      name: 'IKEA',
      image: TImages.ikeaLogo,
      isFeatured: true,
      productCount: 16,
    ),
    BrandModel(
      id: '8',
      name: 'Herman Miller',
      image: TImages.hermanMillerLogo,
      isFeatured: false,
      productCount: 9,
    ),
    BrandModel(
      id: '9',
      name: 'Whiskas',
      image: TImages.wsLogo,
      isFeatured: true,
      productCount: 6,
    ),
  ];

  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: TImages.promoBanner1,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImages.promoBanner2,
      targetScreen: TRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promoBanner3,
      targetScreen: TRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promoBanner4,
      targetScreen: TRoutes.search,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promoBanner5,
      targetScreen: TRoutes.settings,
      active: true,
    ),
    BannerModel(
      imageUrl: TImages.promoBanner6,
      targetScreen: TRoutes.userAddress,
      active: false,
    ),
  ];

  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    // --- Main Categories
    CategoryModel(
      id: '1',
      image: TImages.sportIcon,
      name: 'Sports',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: TImages.furnitureIcon,
      name: 'Furniture',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: TImages.electronicsIcon,
      name: 'Electronics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: TImages.clothIcon,
      name: 'Clothes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: TImages.animalIcon,
      name: 'Animals',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: TImages.shoeIcon,
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      image: TImages.cosmeticsIcon,
      name: 'Cosmetics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '8',
      image: TImages.jeweleryIcon,
      name: 'Jewelry',
      isFeatured: true,
    ),

    // --- Subcategories
    // Furniture
    CategoryModel(
      id: '9',
      image: TImages.furnitureIcon,
      name: 'Living Room',
      parentId: '2',
      isFeatured: true,
    ),

    // Clothes
    CategoryModel(
      id: '10',
      image: TImages.clothIcon,
      name: 'Shirts',
      parentId: '4',
      isFeatured: true,
    ),

    // Sports
    CategoryModel(
      id: '11',
      image: TImages.sportIcon,
      name: 'Sportwear',
      parentId: '1',
      isFeatured: true,
    ),

    // Shoes
    CategoryModel(
      id: '12',
      image: TImages.shoeIcon,
      name: 'Sneakers',
      parentId: '6',
      isFeatured: true,
    ),

    // Cosmetics
    CategoryModel(
      id: '13',
      image: TImages.cosmeticsIcon,
      name: 'Makeup',
      parentId: '7',
      isFeatured: true,
    ),

    // Jewelry
    CategoryModel(
      id: '14',
      image: TImages.jeweleryIcon,
      name: 'Necklaces',
      parentId: '8',
      isFeatured: true,
    ),

    // --- Electronics Subcategories
    CategoryModel(
      id: '15',
      image: TImages.electronicsIcon, // replace with suitable icon
      name: 'Android Phones',
      parentId: '3', // Electronics main category
      isFeatured: true,
    ),

    CategoryModel(
      id: '16',
      image: TImages.electronicsIcon, // replace with suitable icon
      name: 'Apple Phones',
      parentId: '3', // Electronics main category
      isFeatured: true,
    ),
  ];

  /// -- List of All Products
  static final List<ProductModel> products = [
    // Nike
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
        id: '3',
        image: TImages.nikeLogo,
        name: 'Nike',
        productCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage1,
        TImages.productImage23,
        TImages.productImage21,
        TImages.productImage9,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description:
              'This is a Product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 10,
          price: 130,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 12,
          price: 130,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '9',
          stock: 5,
          price: 130,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 30'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordon Shoes',
      stock: 15,
      price: 35,
      isFeatured: false,
      thumbnail: TImages.productImage10,
      description:
      'Nike Air Jordon Shoes for running. Quality product, Long Lasting',
      brand: BrandModel(
        id: '3',
        image: TImages.nikeLogo,
        name: 'Nike',
        productCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage7,
        TImages.productImage8,
        TImages.productImage9,
        TImages.productImage10,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Orange', 'Black', 'Brown'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 16,
          price: 36,
          salePrice: 12.6,
          image: TImages.productImage8,
          description:
          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
          attributeValues: {'Color': 'Orange', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 35,
          image: TImages.productImage7,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 14,
          price: 34,
          image: TImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 13,
          price: 33,
          image: TImages.productImage7,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 12,
          price: 32,
          image: TImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 31,
          image: TImages.productImage8,
          attributeValues: {'Color': 'Orange', 'Size': 'EU 32'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '009',
      title: 'Nike Air Jordon 19 Blue',
      stock: 15,
      price: 400,
      isFeatured: false,
      thumbnail: TImages.productImage19,
      description:
      'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '3', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage19,
        TImages.productImage20,
        TImages.productImage21,
        TImages.productImage22,
      ],
      salePrice: 200,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),

    // Zara Sub Shirts
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description:
          'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage68,
        TImages.productImage69,
        TImages.productImage5,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38,
      isFeatured: false,
      thumbnail: TImages.productImage64,
      description:
          'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage64,
        TImages.productImage65,
        TImages.productImage66,
        TImages.productImage67,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: TImages.productImage60,
      description:
          'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage60,
        TImages.productImage61,
        TImages.productImage62,
        TImages.productImage63,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Red', 'Yellow', 'Green', 'Blue'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage60,
          description:
              'This is a Product description for 4 Color collar t-shirt dry fit',
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage60,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage61,
          attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage61,
          attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage62,
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage62,
          attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 0,
          price: 334,
          image: TImages.productImage63,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 11,
          price: 332,
          image: TImages.productImage63,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
      ],
      productType: 'ProductType.variable',
    ),


    ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage11,
      description:
          'SAMSUNG Galaxy S9 (Pink, 64 GB)  (4 GB RAM), Long Battery timing',
      brand: BrandModel(id: '2', image: TImages.samsungLogo, name: 'Samsung'),
      images: [
        TImages.productImage11,
        TImages.productImage12,
        TImages.productImage13,
        TImages.productImage12,
      ],
      salePrice: 650,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog food',
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: TImages.productImage18,
      description:
          'This is a Product description for TOMI Dog food. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '9', image: TImages.wsLogo, name: 'Whiskas'),
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),


    ProductModel(
      id: '010',
      title: 'Apple iPhone 16e',
      stock: 15,
      price: 405,
      isFeatured: true,
      thumbnail: TImages.iphone16eblack,
      description:
          'The iPhone 16e delivers powerful performance with the A18 chip, advanced dual cameras, and a stunning Super Retina display — designed for speed, creativity, and all-day battery life.',
      brand: BrandModel(id: '1', image: TImages.appleLogo, name: 'Apple'),
      images: [
        TImages.iphone16eblack1,
        TImages.iphone16eblack2,
        TImages.iphone16ewhite,
        TImages.iphone16ewhite1,
        TImages.iphone16ewhite2,
      ],
      salePrice: 399,
      sku: 'appleeblack',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Storage', values: ['128GB', '256GB']),
        ProductAttributeModel(name: 'Color', values: ['Black', 'White']),
      ],
      productType: 'ProductType.variable',
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 3,
          price: 405,
          image: TImages.iphone16eblack,
          attributeValues: {'Color': 'Black', 'Storage': '128GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 3,
          price: 530,
          image: TImages.iphone16eblack,
          attributeValues: {'Color': 'Black', 'Storage': '256GB'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 3,
          price: 405,
          image: TImages.iphone16ewhite,
          attributeValues: {'Color': 'White', 'Storage': '128GB'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 3,
          price: 530,
          image: TImages.iphone16ewhite,
          attributeValues: {'Color': 'White', 'Storage': '256GB'},
        ),
      ],
    ),
    ProductModel(
      id: '011',
      title: 'Apple iPhone 15 Pro Max',
      stock: 15,
      price: 599,
      isFeatured: true,
      thumbnail: TImages.iphone15promax,
      description:
          'Experience ultimate performance with the iPhone 15 Pro Max — powered by the A17 Pro chip, aerospace-grade titanium body, ProMotion display, and professional-grade camera system.',
      brand: BrandModel(id: '1', image: TImages.appleLogo, name: 'Apple'),
      images: [
        TImages.iphone15promax,
        TImages.iphone15promax1,
        TImages.iphone15promax2,
      ],
      salePrice: 559,
      sku: 'ABR4568',
      categoryId: '3',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '012',
      title: 'Apple iPad 11-inch',
      stock: 15,
      price: 260,
      isFeatured: true,
      thumbnail: TImages.appleIpad,
      description:
          'Experience ultimate performance with the iPhone 15 Pro Max — powered by the A17 Pro chip, aerospace-grade titanium body, ProMotion display, and professional-grade camera system.',
      brand: BrandModel(id: '1', image: TImages.appleLogo, name: 'Apple'),
      images: [TImages.appleIpad, TImages.appleIpad1],
      salePrice: 250,
      sku: 'ABR4568',
      categoryId: '3',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '013',
      title: 'Samsung Galaxy A07 4G Ai',
      stock: 15,
      price: 160,
      isFeatured: true,
      thumbnail: TImages.sams1,
      description:
          'Samsung Galaxy A07 4G AI (Compatible Only with T-Mobile, Mint, Tello & Global) (64GB + 4GB) Unlocked SM-A075/DS Dual SIM Warranty – Latin America, 6.7" 50MP Dual Cam (Green, SM-A075MZGDGTO)',
      brand: BrandModel(id: '2', image: TImages.samsungLogo, name: 'Samsung'),
      images: [TImages.sams2, TImages.sams3],
      salePrice: 149,
      sku: 'ABR4568',
      categoryId: '3',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '014',
      title: 'Samsung Galaxy Buds 3 Pro',
      stock: 15,
      price: 199,
      isFeatured: true,
      thumbnail: TImages.sbuds1,
      description:
          'A SLEEK DESIGN MADE TO SHINE: Let your sound shine as much as you do with Buds3 Pro that light up¹.',
      brand: BrandModel(id: '2', image: TImages.samsungLogo, name: 'Samsung'),
      images: [TImages.sbuds2, TImages.sbuds3],
      sku: 'ABR4568',
      categoryId: '3',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '015',
      title: 'SAMSUNG Galaxy Ring',
      stock: 15,
      price: 399,
      isFeatured: true,
      thumbnail: TImages.sbuds1,
      description:
          'Samsung Galaxy Ring, AI Smart Ring, Size First w/ Sizing Kit, No App Subscription, Fitness Monitor, Sleep Tracker, Up to 7-Day Battery, Size 10, Titanium Silver (US Version, 1-Year Manufacturer Warranty)',
      brand: BrandModel(id: '2', image: TImages.samsungLogo, name: 'Samsung'),
      images: [TImages.sbuds2, TImages.sbuds3],
      sku: 'ABR4568',
      categoryId: '3',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '016',
      title: 'Hat and Beyond Mens Hipster',
      stock: 15,
      price: 11.99,
      isFeatured: false,
      thumbnail: TImages.zs1,
      description:
          'Hat and Beyond Mens Hipster Curve Hem Droptail Tee Premium Longline T Shirts.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'Zara'),
      images: [TImages.zs2, TImages.zs3],
      sku: 'ABR4568',
      categoryId: '4',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '017',
      title: 'Manwan walk Men\'s Slim',
      stock: 15,
      price: 17.99,
      isFeatured: false,
      thumbnail: TImages.zss1,
      description:
          'Manwan walk Men\'s Slim Fit Business Casual Cotton Long Sleeves Solid Button Down Dress Shirts.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'Zara'),
      images: [TImages.zss2, TImages.zss3],
      sku: 'ABR4568',
      categoryId: '4',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '018',
      title: 'MixMatchy Women\'s Casual Shirt',
      stock: 15,
      price: 20.99,
      isFeatured: false,
      thumbnail: TImages.zsss1,
      description:
          'MixMatchy Women\'s Casual Basic Roll Up Sleeve Denim Chambray V-Neck Tencel Button Down Shirt.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'Zara'),
      images: [TImages.zsss2, TImages.zsss3],
      sku: 'ABR4568',
      categoryId: '4',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '019',
      title: 'Dior Sauvage Parfum Spray',
      stock: 15,
      price: 170,
      isFeatured: false,
      thumbnail: TImages.dsp,
      description: 'Dior Sauvage Parfum Spray for Men 3.4 Ounces.',
      brand: BrandModel(id: '6', image: TImages.diorLogo, name: 'Dior'),
      images: [TImages.dsp, TImages.dsp1],
      salePrice: 149,
      sku: 'ABR4568',
      categoryId: '7',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '020',
      title: 'Dior Homme by Christian Dior',
      stock: 15,
      price: 110,
      isFeatured: false,
      thumbnail: TImages.dssp1,
      description:
          'Dior Homme by Christian Dior for Men 3.4 oz Eau de Toilette Spray.',
      brand: BrandModel(id: '6', image: TImages.diorLogo, name: 'Dior'),
      images: [TImages.dssp1, TImages.dssp2],
      salePrice: 99,
      sku: 'ABR4568',
      categoryId: '7',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '021',
      title: 'Dior 2018',
      stock: 15,
      price: 100,
      isFeatured: false,
      thumbnail: TImages.dspp1,
      description: 'Dior 2018 Backstage Face & Body Foundation - Warm 2.',
      brand: BrandModel(id: '6', image: TImages.diorLogo, name: 'Dior'),
      images: [TImages.dssp1],
      sku: 'ABR4568',
      categoryId: '7',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '022',
      title: 'Zirconia Hoop Earrings',
      stock: 15,
      price: 70,
      isFeatured: false,
      thumbnail: TImages.dj,
      description:
          '14K Gold Plated Cubic Zirconia Hoop Earrings,Three Row Diamon | Arrows | Double Row of Diamonds Huggie Earrings for Women.',
      brand: BrandModel(id: '6', image: TImages.diorLogo, name: 'Dior'),
      images: [TImages.dj],
      sku: 'ABR4568',
      categoryId: '8',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '023',
      title: 'Love Necklace',
      stock: 15,
      price: 30,
      isFeatured: false,
      thumbnail: TImages.dj2,
      description:
          'Love Necklace, Interlocking Circle Necklace, Dainty Pendant Necklace for Women, Stocking Stuffers for Women Valentines Christmas.',
      brand: BrandModel(id: '6', image: TImages.diorLogo, name: 'Dior'),
      images: [TImages.dj2],
      sku: 'ABR4568',
      categoryId: '8',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '024',
      title: 'PAVOI',
      stock: 15,
      price: 29.99,
      isFeatured: false,
      thumbnail: TImages.dj3,
      description:
          'Level up your ear stack with these dangle link earrings that are crafted with 14K yellow gold plating for long lasting brilliant finish.',
      brand: BrandModel(id: '6', image: TImages.diorLogo, name: 'Dior'),
      images: [TImages.dj3],
      sku: 'ABR4568',
      categoryId: '8',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '025',
      title: 'METAL TIE NECKLACE',
      stock: 15,
      price: 59,
      isFeatured: false,
      thumbnail: TImages.zt,
      description: 'METAL TIE NECKLACE.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'Zara'),
      images: [TImages.zt],
      sku: 'ABR4568',
      categoryId: '8',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '026',
      title: 'SHORT LEATHER GLOVES WITH BROOCHES',
      stock: 15,
      price: 49,
      isFeatured: false,
      thumbnail: TImages.zt1,
      description: 'SHORT LEATHER GLOVES WITH BROOCHES.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'Zara'),
      images: [TImages.zt1],
      sku: 'ABR4568',
      categoryId: '8',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '027',
      title: 'FLOWER JEWEL GLITTER NECKLACE',
      stock: 15,
      price: 39,
      isFeatured: false,
      thumbnail: TImages.zt2,
      description: 'FLOWER JEWEL GLITTER NECKLACE.',
      brand: BrandModel(id: '5', image: TImages.zaraLogo, name: 'Zara'),
      images: [TImages.zt2],
      sku: 'ABR4568',
      categoryId: '8',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '028',
      title: 'Small Cat Food Bowls',
      stock: 15,
      price: 9,
      isFeatured: false,
      thumbnail: TImages.cf,
      description:
          '2 Pcs Non-Slip Stainless Steel Small Cat Food Bowls - Unbreakable, 7 Oz, Removable Rubber Base, Easy to Clean, Lovely Color.',
      brand: BrandModel(id: '9', image: TImages.wsLogo, name: 'Whiskas'),
      images: [TImages.cf],
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '029',
      title: 'WHISKAS TEMPTATIONS',
      stock: 15,
      price: 25,
      isFeatured: false,
      thumbnail: TImages.wt,
      description:
          'WHISKAS TEMPTATIONS Treats for Cats MEGA BAG Tasty Chicken, 6.3-Ounce.',
      brand: BrandModel(id: '9', image: TImages.wsLogo, name: 'Whiskas'),
      images: [TImages.wt, TImages.wt2, TImages.wt3, TImages.wt4],
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '030',
      title: 'Whiskas Cat Milk (200ml)',
      stock: 15,
      price: 25,
      isFeatured: false,
      thumbnail: TImages.wm,
      description: 'Whiskas Cat Milk (200ml).',
      brand: BrandModel(id: '9', image: TImages.wsLogo, name: 'Whiskas'),
      images: [TImages.wm1, TImages.wm2],
      sku: 'ABR4568',
      categoryId: '5',
      productType: 'ProductType.single',
    ),

    // Nike Shoes
    ProductModel(
      id: '031',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
        id: '3',
        image: TImages.nikeLogo,
        name: 'Nike',
        productCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage1,
        TImages.productImage23,
        TImages.productImage21,
        TImages.productImage9,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '6',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description:
              'This is a Product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 10,
          price: 130,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 12,
          price: 130,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '9',
          stock: 5,
          price: 130,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 30'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '032',
      title: 'Nike Air Jordon Shoes',
      stock: 15,
      price: 35,
      isFeatured: false,
      thumbnail: TImages.productImage10,
      description:
          'Nike Air Jordon Shoes for running. Quality product, Long Lasting',
      brand: BrandModel(
        id: '3',
        image: TImages.nikeLogo,
        name: 'Nike',
        productCount: 265,
        isFeatured: true,
      ),
      images: [
        TImages.productImage7,
        TImages.productImage8,
        TImages.productImage9,
        TImages.productImage10,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '6',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Orange', 'Black', 'Brown'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 16,
          price: 36,
          salePrice: 12.6,
          image: TImages.productImage8,
          description:
              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
          attributeValues: {'Color': 'Orange', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 35,
          image: TImages.productImage7,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 14,
          price: 34,
          image: TImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 13,
          price: 33,
          image: TImages.productImage7,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 12,
          price: 32,
          image: TImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 31,
          image: TImages.productImage8,
          attributeValues: {'Color': 'Orange', 'Size': 'EU 32'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '033',
      title: 'Nike Air Jordon 19 Blue',
      stock: 15,
      price: 400,
      isFeatured: false,
      thumbnail: TImages.productImage19,
      description:
          'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '3', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage19,
        TImages.productImage20,
        TImages.productImage21,
        TImages.productImage22,
      ],
      salePrice: 200,
      sku: 'ABR4568',
      categoryId: '6',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),

    // Adidas Sports
    ProductModel(
      id: '034',
      title: 'Adidas Women\'s Breaknet Sleek Sneaker',
      stock: 15,
      price: 69,
      isFeatured: false,
      thumbnail: TImages.ad,
      description: 'Adidas Women\'s Breaknet Sleek Sneaker,',
      brand: BrandModel(id: '4', image: TImages.adidasLogo, name: 'Adidas'),
      images: [TImages.ad, TImages.ad2],
      sku: 'ABR4568',
      categoryId: '1',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '035',
      title: 'Adidas Men\'s Lite Racer Adapt 7.0 Shoes',
      stock: 15,
      price: 79.99,
      isFeatured: false,
      thumbnail: TImages.ad3,
      description: 'Adidas Men\'s Lite Racer Adapt 7.0 Shoes',
      brand: BrandModel(id: '4', image: TImages.adidasLogo, name: 'Adidas'),
      images: [TImages.ad3, TImages.ad4],
      sku: 'ABR4568',
      categoryId: '1',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '036',
      title: 'Adidas Unisex Adult Adilette Shower Slip On Slides',
      stock: 15,
      price: 7,
      isFeatured: false,
      thumbnail: TImages.ad5,
      description: 'Adidas Unisex Adult Adilette Shower Slip On Slides',
      brand: BrandModel(id: '4', image: TImages.adidasLogo, name: 'Adidas'),
      images: [TImages.ad5, TImages.ad6],
      sku: 'ABR4568',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    // Adidas Shoes
    ProductModel(
      id: '043',
      title: 'Adidas Women\'s Breaknet Sleek Sneaker',
      stock: 15,
      price: 69,
      isFeatured: false,
      thumbnail: TImages.ad,
      description: 'Adidas Women\'s Breaknet Sleek Sneaker,',
      brand: BrandModel(id: '4', image: TImages.adidasLogo, name: 'Adidas'),
      images: [TImages.ad, TImages.ad2],
      sku: 'ABR4568',
      categoryId: '6',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '044',
      title: 'Adidas Men\'s Lite Racer Adapt 7.0 Shoes',
      stock: 15,
      price: 79.99,
      isFeatured: false,
      thumbnail: TImages.ad3,
      description: 'Adidas Men\'s Lite Racer Adapt 7.0 Shoes',
      brand: BrandModel(id: '4', image: TImages.adidasLogo, name: 'Adidas'),
      images: [TImages.ad3, TImages.ad4],
      sku: 'ABR4568',
      categoryId: '6',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '045',
      title: 'Adidas Unisex Adult Adilette Shower Slip On Slides',
      stock: 15,
      price: 7,
      isFeatured: false,
      thumbnail: TImages.ad5,
      description: 'Adidas Unisex Adult Adilette Shower Slip On Slides',
      brand: BrandModel(id: '4', image: TImages.adidasLogo, name: 'Adidas'),
      images: [TImages.ad5, TImages.ad6],
      sku: 'ABR4568',
      categoryId: '6',
      productType: 'ProductType.single',
    ),

    // IKEA
    ProductModel(
      id: '037',
      title: 'Duable Poang Chair',
      stock: 15,
      price: 64,
      isFeatured: true,
      thumbnail: TImages.ik,
      description:
          'The Duable Poang Chair Cover Replacement is Custom Made Compatible for IKEA Poang Armchair Slipcover Only. (Polyester Flax Beige).',
      brand: BrandModel(
        id: '7',
        image: TImages.ikeaLogo,
        name: 'IKEA',
        isFeatured: true,
      ),
      images: [TImages.ik, TImages.ik2, TImages.ik3],
      sku: 'ABR4568',
      salePrice: 59.99,
      categoryId: '2',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '038',
      title: 'FelixKing Office Chair',
      stock: 15,
      price: 47,
      isFeatured: true,
      thumbnail: TImages.ik4,
      description:
          'FelixKing Office Chair, Ergonomic Desk Chair Breathable Mesh Chairs Adjustable High Back Lumbar Support Flip-up Armrests, Executive Rolling Swivel Comfy Computer Chairs Home Office Black.',
      brand: BrandModel(
        id: '7',
        image: TImages.ikeaLogo,
        name: 'IKEA',
        isFeatured: true,
      ),
      images: [TImages.ik4],
      sku: 'ABR4568',
      salePrice: 57,
      categoryId: '2',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '039',
      title: 'Armen Living Jaguar',
      stock: 15,
      price: 39,
      isFeatured: true,
      thumbnail: TImages.ik5,
      description:
          'Armen Living Jaguar Mid-Century Dining Chair in Walnut Wood and Green Fabric.',
      brand: BrandModel(
        id: '7',
        image: TImages.ikeaLogo,
        name: 'IKEA',
        isFeatured: true,
      ),
      images: [TImages.ik5],
      sku: 'ABR4568',
      salePrice: 47,
      categoryId: '2',
      productType: 'ProductType.single',
    ),

    // Herman Miller
    ProductModel(
      id: '040',
      title: 'Herman Miller Aeron Ergonomic Chair',
      stock: 15,
      price: 64,
      isFeatured: true,
      thumbnail: TImages.hm,
      description: 'Herman Miller Aeron Ergonomic Chair.',
      brand: BrandModel(
        id: '8',
        image: TImages.hermanMillerLogo,
        name: 'Herman Miller',
        isFeatured: true,
      ),
      images: [TImages.hm],
      sku: 'ABR4568',
      salePrice: 59.99,
      categoryId: '2',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '041',
      title: 'Branch Daily Chair',
      stock: 15,
      price: 64,
      isFeatured: true,
      thumbnail: TImages.hm2,
      description:
          'Branch Daily Chair - Computer Office Chair with Swivel, Lumbar Rest, and Adjustable Armrests - Sustainable, Stylish Mesh, & Adjustable Armrests - Comfortable Seating for Improved Posture - Green.',
      brand: BrandModel(
        id: '8',
        image: TImages.hermanMillerLogo,
        name: 'Herman Miller',
        isFeatured: true,
      ),
      images: [TImages.hm2],
      sku: 'ABR4568',
      salePrice: 59.99,
      categoryId: '2',
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '042',
      title: 'Armen Living Jaguar',
      stock: 15,
      price: 39,
      isFeatured: true,
      thumbnail: TImages.ik5,
      description:
          'Armen Living Jaguar Mid-Century Dining Chair in Walnut Wood and Green Fabric.',
      brand: BrandModel(
        id: '8',
        image: TImages.hermanMillerLogo,
        name: 'Herman Miller',
        isFeatured: true,
      ),
      images: [TImages.ik5],
      sku: 'ABR4568',
      salePrice: 47,
      categoryId: '2',
      productType: 'ProductType.single',
    ),
  ];

  /// --- Brand ↔ Category relations
  static final List<BrandCategoryModel> brandCategories = [
    // Sports → Nike, Adidas
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),

    // Furniture → IKEA, Herman Miller
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '2'),

    // Electronics → Apple, Samsung
    BrandCategoryModel(brandId: '1', categoryId: '3'),
    BrandCategoryModel(brandId: '2', categoryId: '3'),

    // Clothes → Zara
    BrandCategoryModel(brandId: '5', categoryId: '4'),

    // Shoes → Nike, Adidas
    BrandCategoryModel(brandId: '3', categoryId: '6'),
    BrandCategoryModel(brandId: '4', categoryId: '6'),

    // Cosmetics → Dior
    BrandCategoryModel(brandId: '6', categoryId: '7'),

    // Jewelry → Dior, Zara
    BrandCategoryModel(brandId: '6', categoryId: '8'),
    BrandCategoryModel(brandId: '5', categoryId: '8'),

    // Animals → Whiskas
    BrandCategoryModel(brandId: '9', categoryId: '5'),
  ];

  /// --- Product ↔ Category relations
  static final List<ProductCategoryModel> productCategories = [
    // Category 1 (Sports Shoes / Sneakers)
    ProductCategoryModel(categoryId: '1', productId: '001'),
    ProductCategoryModel(categoryId: '1', productId: '005'),
    ProductCategoryModel(categoryId: '1', productId: '009'),
    ProductCategoryModel(categoryId: '1', productId: '034'),
    ProductCategoryModel(categoryId: '1', productId: '035'),
    ProductCategoryModel(categoryId: '1', productId: '036'),

    // Category 2 (Chairs / Office Furniture)
    ProductCategoryModel(categoryId: '2', productId: '037'),
    ProductCategoryModel(categoryId: '2', productId: '038'),
    ProductCategoryModel(categoryId: '2', productId: '039'),
    ProductCategoryModel(categoryId: '2', productId: '040'),
    ProductCategoryModel(categoryId: '2', productId: '041'),
    ProductCategoryModel(categoryId: '2', productId: '042'),

    // Category 3 (Smartphones / Gadgets)
    ProductCategoryModel(categoryId: '3', productId: '006'),
    ProductCategoryModel(categoryId: '3', productId: '010'),
    ProductCategoryModel(categoryId: '3', productId: '011'),
    ProductCategoryModel(categoryId: '3', productId: '012'),
    ProductCategoryModel(categoryId: '3', productId: '013'),
    ProductCategoryModel(categoryId: '3', productId: '014'),
    ProductCategoryModel(categoryId: '3', productId: '015'),

    // Category 4 (Men's Clothing)
    ProductCategoryModel(categoryId: '4', productId: '016'),
    ProductCategoryModel(categoryId: '4', productId: '017'),
    ProductCategoryModel(categoryId: '4', productId: '018'),

    // Category 5 (Pet Products)
    ProductCategoryModel(categoryId: '5', productId: '007'),
    ProductCategoryModel(categoryId: '5', productId: '028'),
    ProductCategoryModel(categoryId: '5', productId: '029'),
    ProductCategoryModel(categoryId: '5', productId: '030'),

    // Category 6 (Shoes / Footwear Duplicate Set)
    ProductCategoryModel(categoryId: '6', productId: '031'),
    ProductCategoryModel(categoryId: '6', productId: '032'),
    ProductCategoryModel(categoryId: '6', productId: '033'),
    ProductCategoryModel(categoryId: '6', productId: '043'),
    ProductCategoryModel(categoryId: '6', productId: '044'),
    ProductCategoryModel(categoryId: '6', productId: '045'),

    // Category 7 (Men's Perfume / Dior)
    ProductCategoryModel(categoryId: '7', productId: '019'),
    ProductCategoryModel(categoryId: '7', productId: '020'),
    ProductCategoryModel(categoryId: '7', productId: '021'),

    // Category 8 (Jewelry / Accessories)
    ProductCategoryModel(categoryId: '8', productId: '022'),
    ProductCategoryModel(categoryId: '8', productId: '023'),
    ProductCategoryModel(categoryId: '8', productId: '024'),
    ProductCategoryModel(categoryId: '8', productId: '025'),
    ProductCategoryModel(categoryId: '8', productId: '026'),
    ProductCategoryModel(categoryId: '8', productId: '027'),

    // --- Subcategories (dummy product assignments)

// Furniture subcategory 'Living Room' (id: 9, parent: 2)
    ProductCategoryModel(categoryId: '9', productId: '037'),
    ProductCategoryModel(categoryId: '9', productId: '038'),
    ProductCategoryModel(categoryId: '9', productId: '039'),

// Clothes subcategory 'Shirts' (id: 10, parent: 4)
    ProductCategoryModel(categoryId: '10', productId: '016'),
    ProductCategoryModel(categoryId: '10', productId: '017'),
    ProductCategoryModel(categoryId: '10', productId: '018'),

// Sports subcategory 'Sportwear' (id: 11, parent: 1)
    ProductCategoryModel(categoryId: '11', productId: '001'),
    ProductCategoryModel(categoryId: '11', productId: '005'),
    ProductCategoryModel(categoryId: '11', productId: '009'),

// Shoes subcategory 'Sneakers' (id: 12, parent: 6)
    ProductCategoryModel(categoryId: '12', productId: '031'),
    ProductCategoryModel(categoryId: '12', productId: '032'),
    ProductCategoryModel(categoryId: '12', productId: '033'),

// Cosmetics subcategory 'Makeup' (id: 13, parent: 7)
    ProductCategoryModel(categoryId: '13', productId: '019'),
    ProductCategoryModel(categoryId: '13', productId: '020'),
    ProductCategoryModel(categoryId: '13', productId: '021'),

// Jewelry subcategory 'Necklaces' (id: 14, parent: 8)
    ProductCategoryModel(categoryId: '14', productId: '022'),
    ProductCategoryModel(categoryId: '14', productId: '023'),
    ProductCategoryModel(categoryId: '14', productId: '024'),

// Android Phones subcategory (id: 15)
    ProductCategoryModel(categoryId: '15', productId: '006'),
    ProductCategoryModel(categoryId: '15', productId: '010'),
    ProductCategoryModel(categoryId: '15', productId: '011'),
    ProductCategoryModel(categoryId: '15', productId: '012'),

// Apple Phones subcategory (id: 16)
    ProductCategoryModel(categoryId: '16', productId: '013'),
    ProductCategoryModel(categoryId: '16', productId: '014'),
    ProductCategoryModel(categoryId: '16', productId: '015'),

  ];

}
