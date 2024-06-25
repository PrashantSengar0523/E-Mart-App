import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_mart/features/authentication/screens/passwordConfiguaration/fortgot_password_screen.dart';
import 'package:e_mart/features/authentication/screens/signup/signup.dart';
import 'package:e_mart/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:e_mart/features/personalization/screens/addresses/address.dart';
import 'package:e_mart/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_mart/features/personalization/screens/setting/setting.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/features/shop/screens/chackout/checkout.dart';
import 'package:e_mart/features/shop/screens/home/home_screen.dart';
import 'package:e_mart/features/shop/screens/order/order.dart';
import 'package:e_mart/features/shop/screens/productReviews/product_review_rating.dart';
import 'package:e_mart/features/shop/screens/store/store_screen.dart';
import 'package:e_mart/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_mart/routes/route.dart';
import 'package:get/get.dart';

class AppRoute{
  static final pages=[
    GetPage(name: TRoutes.home, page: ()=>const HomeScreen()),
    GetPage(name: TRoutes.store, page: ()=>const StoreScreen()),
    GetPage(name: TRoutes.setting, page: ()=>const SettingScreen()),
    GetPage(name: TRoutes.favourites, page: ()=>const WishListScreen()),
    GetPage(name: TRoutes.productReviews, page: ()=>const ProductReviewScreen()),
    GetPage(name: TRoutes.order, page: ()=>const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: ()=>const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: ()=>const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: ()=>const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: ()=>const AddressScreen()),
    GetPage(name: TRoutes.signUp, page: ()=>const SignUp()),
    GetPage(name: TRoutes.verifyEmail, page: ()=>const VerifyEmailScreen()),
    GetPage(name: TRoutes.forgotPassword, page: ()=>const ForgotPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: ()=>const OnBoardingScreen()),
    GetPage(name: TRoutes.signIn, page: ()=>const LoginScreen()),
  ];
}