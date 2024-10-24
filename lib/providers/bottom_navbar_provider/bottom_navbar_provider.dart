

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class BottomNavigationBarProvider extends ChangeNotifier {
//   int _selectedIndex = 0;
//   int get selectedIndex => _selectedIndex;
//
//
//   void updateSelectedIndex(){
//     _selectedIndex=0;
//     notifyListeners();
//   }
//
//
//   Widget bottomNavigationBar(BuildContext context,bool isLanding) {
//     return BottomNavigationBar(
//       elevation: 0,
//       backgroundColor: Color(0xFFFFFFFF),
//       showSelectedLabels:true,
//       showUnselectedLabels: true,
//       currentIndex: _selectedIndex,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Theme.of(context).primaryColor,
//       unselectedItemColor: AppColorResources.HINT_TEXT_COLOR,
//       onTap: (index){
//         _selectedIndex=index;
//         if(index==0 || index==2 || index==1){
//           onItemTapped(index,context,isLanding);
//           notifyListeners();
//         }
//         // else if(index==1){
//         //   if(Provider.of<AuthProvider>(context,listen: false).getAuthToken().length>0){
//         //     Navigator.pushNamed(context, ProfileInfoPage.routeName);
//         //   }else{
//         //     Navigator.pushNamed(context, SignInPage.routeName);
//         //   }
//         // }
//         else if(index==3){
//           Navigator.pushNamed(context, CheckOutPage.routeName);
//         }
//       },
//
//
//       items:   [
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             Images.home_image,
//             // color: index == _selectedIndex ?
//             // AppColorResources.YELLOW : AppColorResources.BOTTOMNAVIGATIONBARITEMCOLOR,
//
//             color: AppColorResources.BOTTOM_NAVIGATION_BAR_ITEM_COLOR,
//             height: 25, width: 25,
//           ),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             Images.profile_icon_image,
//             color: AppColorResources.BOTTOM_NAVIGATION_BAR_ITEM_COLOR,
//
//             height: 25, width: 25,
//           ),
//           label:'Profile',
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             Images.shopping_image,
//             color: AppColorResources.BOTTOM_NAVIGATION_BAR_ITEM_COLOR,
//             height: 25, width: 25,
//           ),
//           label: 'Order List',
//         ),
//
//         BottomNavigationBarItem(
//           icon: Consumer<CartProvider>(
//             builder: (context,productPageProvider,child){
//               return Stack(
//                 children: [
//                   Image.asset(
//                     Images.cart_image,
//                     color: AppColorResources.BOTTOM_NAVIGATION_BAR_ITEM_COLOR,
//                     height: 25, width: 25,
//                   ),
//                   Padding(
//                     padding:  EdgeInsets.only(left: 10.w,bottom: 0),
//                     child: CircleAvatar(
//                       backgroundColor: Color(0xffEB2F06),
//                       radius: 10,
//                       child: Center(child: Text("${productPageProvider.cartList!.length}",style: TextStyle(fontSize: 10.sp,color: Colors.white),)),
//                     ),
//                   ),
//
//                 ],
//               );
//             },
//           ),
//           label: 'Cart',
//         ),
//
//       ],
//     );
//   }
//
//
//
//   Widget? getWidget(int index,BuildContext context) {
//     if (index == 0 ) {
//       return HomePage();
//     }
//     if (index == 1 ) {
//       if(Provider.of<AuthProvider>(context,listen: false).getAuthToken().length>0) {
//         return ProfileInfoPage();
//       }else{
//         return SignInPage(isCheckOut: false,isOrderPage: false,);
//       }
//
//     }
//     if (index == 2) {
//       if(Provider.of<AuthProvider>(context,listen: false).getAuthToken().length>0){
//         // return TestPage();
//         return MyOrderPage();
//       }
//       else{
//         return SignInPage(isCheckOut: false,isOrderPage: true,);
//       }
//     }
//     // if (index == 3) {
//     //   return  CheckOutPage() ;
//     // }
//     notifyListeners();
//   }
//
//
//
//   void onItemTapped(int index,BuildContext context,bool isLanding) {
//     _selectedIndex = index;
//     if(!isLanding){
//       //Navigator.pushNamed(context, LandingPage.routeName);
//       Navigator.pushNamedAndRemoveUntil(context, LandingPage.routeName, (route) => false);
//     }
//
//     notifyListeners();
//   }
//
// }