
import 'package:advanced_app/presentation/resources/app_constant.dart';
import 'package:advanced_app/presentation/resources/assets_manager.dart';
import 'package:advanced_app/presentation/resources/color_manager.dart';
import 'package:advanced_app/presentation/resources/route_manager.dart';
import 'package:advanced_app/presentation/resources/strings_manager.dart';
import 'package:advanced_app/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0 ;
  final PageController _controller = PageController();
  late final List<SliderObject>   list = _getList();
  List<SliderObject> _getList() => [
    SliderObject(AppStrings.onBoarding1, AppStrings.subtitle1, AssetsImages.onBoarding1),
    SliderObject(AppStrings.onBoarding2, AppStrings.subtitle2, AssetsImages.onBoarding2),
    SliderObject(AppStrings.onBoarding3, AppStrings.subtitle3, AssetsImages.onBoarding3),
    SliderObject(AppStrings.onBoarding4, AppStrings.subtitle4, AssetsImages.onBoarding4),
  ];

   getCircleIndicator(int index){
    if(_currentIndex == index){
      return Padding(padding: EdgeInsets.all(AppPadding.p8),child: SvgPicture.asset(AssetsImages.hollow_cirlce),);
    }
    else return Padding(padding: EdgeInsets.all(AppPadding.p8),child: SvgPicture.asset(AssetsImages.solid_cirlce),);

  }
  int goNext(){
     int nextPage = ++_currentIndex;
     if(nextPage == 4)
       return nextPage =0 ;
     return nextPage ;
  }
  int goPrevious(){
    int previousPage = --_currentIndex;
    if(previousPage == -1)
      return previousPage = 3 ;
    return previousPage ;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteManager.loginRoute);
                },
                child: Text(AppStrings.skip  ,style: Theme.of(context).textTheme.titleMedium,),
              ),
            ),
            const SizedBox(
              height: AppSize.s14,
            ),
            Container(
              color: ColorManager.primary,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // arrow back
                  IconButton(
                      onPressed: () {
                        _controller.animateToPage(goPrevious(), duration: Duration(microseconds: AppConstant.MilliSecond), curve: Curves.easeInBack);
                      },
                    icon: Icon(Icons.arrow_back_ios_new) , color: ColorManager.white, padding: EdgeInsets.all(AppPadding.p8),
                  ),
                  // circle indicator
                  Row(
                    children: [
                      for(int i = 0 ; i < list.length ; i++)
                      getCircleIndicator(i)
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.animateToPage(goNext(), duration: Duration(microseconds: AppConstant.MilliSecond), curve: Curves.bounceInOut);

                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined) , color: ColorManager.white, padding: EdgeInsets.all(AppPadding.p8),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,  // notice this
            statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index ;
          });
        },
        itemBuilder: (context, index) {
        return OnBoardingPage(list[index]);
      },),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
   OnBoardingPage(this._sliderObject ,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppPadding.p40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSize.s50,
          ),
          // title
          Text(_sliderObject.title , style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center,),
          const SizedBox(
            height: AppSize.s8,
          ),
          //subtitle
          Text(_sliderObject.subTitle, style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,),
          const SizedBox(
            height: AppSize.s40,
          ),
          //svg image
          Center(child: SvgPicture.asset(_sliderObject.image))
        ],
      ),
    );
  }
}


class SliderObject{
   String title; 
   String subTitle; 
   String image ; 
   
   SliderObject(this.title ,this.subTitle , this.image);
}