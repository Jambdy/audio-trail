import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/site.dart';
import '../viewmodels/site_list_view_model.dart';
import '../widgets/site_card.dart';

class SiteListScreen extends ConsumerStatefulWidget {
  final String city;
  final double totalTime;
  final double totalDistance;

  const SiteListScreen({
    super.key,
    required this.city,
    required this.totalTime,
    required this.totalDistance,
  });

  @override
  ConsumerState<SiteListScreen> createState() => _SiteListScreenState();
}

class _SiteListScreenState extends ConsumerState<SiteListScreen> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(siteListViewModelProvider.notifier).loadSites(
            city: widget.city,
            totalTime: widget.totalTime,
            totalDistance: widget.totalDistance,
          );
    });
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(siteListViewModelProvider);
    final viewModel = ref.read(siteListViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tour of ${widget.city}'),
        actions: [
          IconButton(
            icon: Icon(
              state.mapType == MapType.normal ? Icons.satellite_alt : Icons.map,
            ),
            onPressed: viewModel.toggleMapType,
          ),
        ],
      ),
      body: state.tourResponse.when(
        data: (response) {
          if (response == null) {
            return const Center(child: Text('No sites found'));
          }

          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 2,
                  ),
                  markers: state.markers,
                  polylines: state.routes,
                  mapType: state.mapType,
                  onMapCreated: (controller) {
                    _mapController = controller;
                    if (state.cameraPosition != null) {
                      controller.moveCamera(
                        CameraUpdate.newCameraPosition(state.cameraPosition!),
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: response.sites.length,
                  itemBuilder: (context, index) {
                    final site = response.sites[index];
                    return SiteCard(
                      site: site,
                      isSelected: site.id == state.selectedSiteId,
                      onTap: () => viewModel.selectSite(site),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }
}
