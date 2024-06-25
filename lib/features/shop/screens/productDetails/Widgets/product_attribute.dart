import 'package:e_mart/common/widgets/products/product_price/product_price_text.dart';
import 'package:get/get.dart';
import 'package:e_mart/common/widgets/chipChoice/chip_choice.dart';
import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/common/widgets/text/tt_product_text.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({
    super.key,
    this.variationPrice,
    this.productActualPrice,
    this.productType,
  });

  final String? variationPrice;
  final String? productActualPrice;
  final String? productType;

  @override
  Widget build(BuildContext context) {
    final ColorSizeController controller = Get.put(ColorSizeController());

    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Variation',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          Text(
                            '',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          TProductTextPrice(price: variationPrice ?? '')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const TProductText(
                title:
                    'This is the description of the product and it can goes upto max four lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(productType=='clothing'||productType=='footWear'||productType=='sports'||productType=='electronics' )...[
            //   const TSectionHeading(
            //   text: 'Colors Available',
            //   textColor: TColors.black,
            //   padding: EdgeInsets.only(left: TSizes.xs),
            // ),
            // const SizedBox(height: TSizes.spaceBtwItems / 2),
            //   Wrap(
            //   spacing: 8,
            //   children: [
            //     Obx(() => TChoiceChip(
            //           text: 'Black',
            //           selected: controller.selectedColor.value == 'Black',
            //           onSelected: (value) {
            //             if (value) {
            //               controller.selectColor('Black');
            //             }
            //           },
            //         )),
            //     Obx(() => TChoiceChip(
            //           text: 'White',
            //           selected: controller.selectedColor.value == 'White',
            //           onSelected: (value) {
            //             if (value) {
            //               controller.selectColor('White');
            //             }
            //           },
            //         )),
            //     Obx(() => TChoiceChip(
            //           text: 'Blue',
            //           selected: controller.selectedColor.value == 'Blue',
            //           onSelected: (value) {
            //             if (value) {
            //               controller.selectColor('Blue');
            //             }
            //           },
            //         )),
            //         Obx(() => TChoiceChip(
            //           text: 'Red',
            //           selected: controller.selectedColor.value == 'Red',
            //           onSelected: (value) {
            //             if (value) {
            //               controller.selectColor('Red');
            //             }
            //           },
            //         )),
                    
            //   ],
            // ),
            ]
            
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        if (productType != null) ...[
          if (productType == 'footWear')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TSectionHeading(
                  text: 'Sizes',
                  textColor: TColors.black,
                  padding: EdgeInsets.only(left: TSizes.xs),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Wrap(
                  spacing: 8,
                  children: [
                    Obx(() => TChoiceChip(
                          text: 'UK 6',
                          selected: controller.selectedSize.value == 'UK 6',
                          onSelected: (value) {
                            if (value) {
                              controller.selectSize('UK 6');
                            }
                          },
                        )),
                    Obx(() => TChoiceChip(
                          text: 'UK 8',
                          selected: controller.selectedSize.value == 'UK 8',
                          onSelected: (value) {
                            if (value) {
                              controller.selectSize('UK 8');
                            }
                          },
                        )),
                    Obx(() => TChoiceChip(
                          text: 'UK 9',
                          selected: controller.selectedSize.value == 'UK 9',
                          onSelected: (value) {
                            if (value) {
                              controller.selectSize('UK 9');
                            }
                          },
                        )),
                    Obx(() => TChoiceChip(
                          text: 'UK 7',
                          selected: controller.selectedSize.value == 'UK 7',
                          onSelected: (value) {
                            if (value) {
                              controller.selectSize('UK 7');
                            }
                          },
                        )),
                  ],
                ),
              ],
            ),
          if (productType == 'clothing')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TSectionHeading(
                  text: 'Sizes',
                  textColor: TColors.black,
                  padding: EdgeInsets.only(left: TSizes.xs),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Wrap(
                  spacing: 8,
                  children: [
                    Obx(() => TChoiceChip(
                          text: 'S',
                          selected: controller.selectedSize.value == 'S',
                          onSelected: (value) {
                            if (value) {
                              controller.selectSize('S');
                            }
                          },
                        )),
                    Obx(() => TChoiceChip(
                          text: 'M',
                          selected: controller.selectedSize.value == 'M',
                          onSelected: (value) {
                            if (value) {
                              controller.selectSize('M');
                            }
                          },
                        )),
                    Obx(() => TChoiceChip(
                          text: 'L',
                          selected: controller.selectedSize.value == 'L',
                          onSelected: (value) {
                            if (value) {
                              controller.selectSize('L');
                            }
                          },
                        )),
                    Obx(() => TChoiceChip(
                          text: 'XL',
                          selected: controller.selectedSize.value == 'XL',
                          onSelected: (value) {
                            if (value) {
                              controller.selectSize('XL');
                            }
                          },
                        )),
                  ],
                ),
              ],
            ),
        ],
        // const SizedBox(height: TSizes.spaceBtwItems),
      ],
    );
  }
}

class ColorSizeController extends GetxController {
  var selectedColor = ''.obs;
  var selectedSize = ''.obs;

  void selectColor(String color) {
    selectedColor.value = color;
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }
}
