import 'package:flutter/material.dart';
import 'package:hair_salon/features/schedule/bloc/state_bloc.dart';
import 'package:hair_salon/features/schedule/widgets/add_service_schedule.dart';
import 'package:hair_salon/models/services_model.dart';

class ScheduleScreen extends StatefulWidget {
  final ServiceModel service;
  const ScheduleScreen({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Stack(
          children: [
            ScheduleDetails(
              service: widget.service,
            ),
            _CustomBottomSheet(
              service: widget.service,
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleDetails extends StatelessWidget {
  final ServiceModel service;
  const ScheduleDetails({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ServiceCarousel(service: service),
        Container(
          padding: const EdgeInsets.only(left: 30, top: 60),
          child: _serviceTitle(service),
        ),
      ],
    );
  }

  _serviceTitle(ServiceModel service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: service.serviceName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w800),
              ),
              const TextSpan(text: "\n"),
              TextSpan(
                text: service.category,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text("Rs ${service.discountedPrice}",
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                )),
            const SizedBox(width: 15),
            Text(
              "Rs ${service.originalPrice}",
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(
              Icons.star_rounded,
              color: Colors.amber,
            ),
            const SizedBox(width: 5),
            Text(
              service.rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              "(With over 1k+ reviews)",
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}

class ServiceCarousel extends StatefulWidget {
  final ServiceModel service;
  const ServiceCarousel({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<ServiceCarousel> createState() => _ServiceCarouselState();
}

class _ServiceCarouselState extends State<ServiceCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(widget.service.imageUrl),
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.black54, BlendMode.darken)),
      ),
    );
  }
}

class _CustomBottomSheet extends StatefulWidget {
  final ServiceModel service;
  const _CustomBottomSheet({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<_CustomBottomSheet> createState() => __CustomBottomSheetState();
}

class __CustomBottomSheetState extends State<_CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  double sheetTop = 250;
  double minSheetTop = 100;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    animation = Tween<double>(begin: sheetTop, end: minSheetTop).animate(
      CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
          reverseCurve: Curves.easeInOut),
    )..addListener(
        () {
          setState(() {});
        },
      );
  }

  forwardAnimation() {
    controller.forward();
    stateBloc.toggleAnimation();
  }

  reverseAnimation() {
    controller.reverse();
    stateBloc.toggleAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: animation.value,
      left: 0,
      child: GestureDetector(
        onTap: () {
          // controller.isCompleted ? controller.reverse() : controller.forward();
          controller.isCompleted ? reverseAnimation() : forwardAnimation();
        },
        onVerticalDragEnd: (DragEndDetails dragEndDetails) {
          if (dragEndDetails.primaryVelocity! < 0.0) {
            // controller.forward();
            forwardAnimation();
          } else if (dragEndDetails.primaryVelocity! > 0.0) {
            // controller.reverse();
            reverseAnimation();
          } else {
            return;
          }
        },
        child: SheetContainer(
          service: widget.service,
        ),
      ),
    );
  }
}

class SheetContainer extends StatelessWidget {
  final ServiceModel service;
  const SheetContainer({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 25),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            drawerHandle(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AddServiceSchedule(
                  service: service,
                ),
              ),
            )
          ],
        ));
  }

  drawerHandle() {
    return Container(
        height: 3,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[400],
        ));
  }
}

// class CarDetailsAnimation extends StatefulWidget {
//   ServiceModel service;
//   CarDetailsAnimation({
//     Key? key,
//     required this.service,
//   }) : super(key: key);

//   @override
//   State<CarDetailsAnimation> createState() => _CarDetailsAnimationState();
// }

// class _CarDetailsAnimationState extends State<CarDetailsAnimation>
//     with TickerProviderStateMixin {
//   late AnimationController fadeController;
//   late AnimationController scaleController;

//   late Animation<double> fadeAnimation;
//   late Animation<double> scaleAnimation;
//   @override
//   void initState() {
//     super.initState();
//     fadeController = AnimationController(
//         duration: const Duration(milliseconds: 180), vsync: this);
//     scaleController = AnimationController(
//         duration: const Duration(milliseconds: 350), vsync: this);
//     fadeAnimation = Tween(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(fadeController);
//     scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(
//           parent: scaleController,
//           curve: Curves.easeInOut,
//           reverseCurve: Curves.easeInOut),
//     );
//   }

//   forward() {
//     fadeController.forward();
//     scaleController.forward();
//   }

//   reverse() {
//     fadeController.reverse();
//     scaleController.reverse();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         initialData: StateProvider().isAnimating,
//         stream: stateBloc.animationStatus,
//         //snapshot.data in this case is the isAnimating value that we are receiving from the screen
//         builder: (context, snapshot) {
//           snapshot.data ? forward() : reverse();
//           return ScaleTransition(
//             scale: scaleAnimation,
//             child: FadeTransition(
//               opacity: fadeAnimation,
//               child: CarDetails(
//                 service: widget.service,
//               ),
//             ),
//           );
//         });
//   }
// }