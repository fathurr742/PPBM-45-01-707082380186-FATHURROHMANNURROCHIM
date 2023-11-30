import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCardSkeleton extends StatelessWidget {
  const CustomCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        height: 400,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey[300],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 12,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            width: 80,
                            height: 10,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30,
                        height: 12,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 25,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 60,
                        height: 25,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 18,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30,
                        height: 12,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
