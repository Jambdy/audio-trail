import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import '../models/site.dart';
import '../models/tour_response.dart';
import '../services/tour_service.dart';

final tourServiceProvider = Provider<TourService>((ref) => MockTourService());

class SiteListState {
  final AsyncValue<TourResponse?> tourResponse;
  final Set<Marker> markers;
  final Set<Polyline> routes;
  final CameraPosition? cameraPosition;
  final MapType mapType;
  final String? selectedSiteId;

  SiteListState({
    this.tourResponse = const AsyncValue.data(null),
    this.markers = const {},
    this.routes = const {},
    this.cameraPosition,
    this.mapType = MapType.normal,
    this.selectedSiteId,
  });

  SiteListState copyWith({
    AsyncValue<TourResponse?>? tourResponse,
    Set<Marker>? markers,
    Set<Polyline>? routes,
    CameraPosition? cameraPosition,
    MapType? mapType,
    String? selectedSiteId,
  }) {
    return SiteListState(
      tourResponse: tourResponse ?? this.tourResponse,
      markers: markers ?? this.markers,
      routes: routes ?? this.routes,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      mapType: mapType ?? this.mapType,
      selectedSiteId: selectedSiteId ?? this.selectedSiteId,
    );
  }
}

final siteListViewModelProvider =
    StateNotifierProvider<SiteListViewModel, SiteListState>((ref) {
  return SiteListViewModel(ref.watch(tourServiceProvider));
});

class SiteListViewModel extends StateNotifier<SiteListState> {
  final TourService _tourService;

  SiteListViewModel(this._tourService) : super(SiteListState());

  Future<void> loadSites({
    required String city,
    required double totalTime,
    required double totalDistance,
  }) async {
    try {
      state = state.copyWith(tourResponse: const AsyncValue.loading());
      final response = await _tourService.getTourSites(
        city: city,
        totalTime: totalTime,
        totalDistance: totalDistance,
      );
      state = state.copyWith(
        tourResponse: AsyncValue.data(response),
      );
      _updateMapMarkers(response.sites);
    } catch (error, stackTrace) {
      state = state.copyWith(
        tourResponse: AsyncValue.error(error, stackTrace),
      );
    }
  }

  void _updateMapMarkers(List<Site> sites) {
    final markers = sites.map((site) {
      return Marker(
        markerId: MarkerId(site.id),
        position: LatLng(
          site.coordinates.latitude,
          site.coordinates.longitude,
        ),
        infoWindow: InfoWindow(
          title: site.title,
          snippet: '${site.order}. ${site.description.substring(0, 50)}...',
        ),
      );
    }).toSet();

    final coordinates = sites.map((site) {
      return LatLng(
        site.coordinates.latitude,
        site.coordinates.longitude,
      );
    }).toList();

    final route = Polyline(
      polylineId: const PolylineId('tour_route'),
      points: coordinates,
      color: const Color(0xFF0000FF),
      width: 3,
    );

    state = state.copyWith(
      markers: markers,
      routes: {route},
    );

    if (sites.isNotEmpty) {
      centerOnSite(sites.first);
    }
  }

  void selectSite(Site site) {
    state = state.copyWith(
      selectedSiteId: site.id,
    );
    centerOnSite(site);
  }

  void centerOnSite(Site site) {
    state = state.copyWith(
      cameraPosition: CameraPosition(
        target: LatLng(
          site.coordinates.latitude,
          site.coordinates.longitude,
        ),
        zoom: 15,
      ),
    );
  }

  void toggleMapType() {
    state = state.copyWith(
      mapType:
          state.mapType == MapType.normal ? MapType.satellite : MapType.normal,
    );
  }

  Site? getSelectedSite() {
    if (state.selectedSiteId == null || state.tourResponse.value == null) {
      return null;
    }

    return state.tourResponse.value?.sites.firstWhere(
      (site) => site.id == state.selectedSiteId,
      orElse: () => state.tourResponse.value!.sites.first,
    );
  }
}
