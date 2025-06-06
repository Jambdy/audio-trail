# Milestone 2: Site Listing and Map Integration

## Objective
Implement the site listing functionality with map integration, following the MVVM architecture pattern. This includes creating a mock API service, displaying sites in both list and map views, and handling user interactions.

## Technical Tasks

### 1. MVVM Implementation
- Create ViewModels:
  - `SiteListViewModel` for managing site data and list state
  - `MapViewModel` for handling map interactions and state
- Implement Models:
  - `Site` data model with JSON serialization
  - `TourResponse` model for API response
- Setup Views:
  - Site listing screen
  - Map overlay component
  - Site detail view

### 2. Mock API Service
- Create abstract `TourApiService` interface
- Implement `MockTourApiService` with:
  - Simulated network delay
  - Error scenarios
  - Consistent test data
- Structure response with:
  - Site title and description
  - GPS coordinates
  - Order in the tour
- Add proper error handling and loading states

### 3. Site Listing Implementation
- Create scrollable site list view
- Implement site card component with:
  - Site title
  - Description preview
  - Order number
  - Distance from previous site
- Add site detail view on tap
- Handle loading and error states
- Implement pull-to-refresh

### 4. Map Integration
- Setup Google Maps integration
- Create map overlay component with:
  - Custom site markers
  - Tour route polyline
  - Selected site highlighting
- Implement map controls:
  - Zoom functionality
  - Site centering
  - View type toggle
- Sync map with list selection

## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_maps_flutter: ^2.5.0
  http: ^1.1.0
  json_annotation: ^4.8.1
  flutter_riverpod: ^2.4.9
  freezed_annotation: ^2.4.1

dev_dependencies:
  build_runner: ^2.4.7
  json_serializable: ^6.7.1
  freezed: ^2.4.6
```

## Mock API Response Structure
```json
{
  "city": "string",
  "total_time": "float",
  "total_distance": "float",
  "sites": [
    {
      "id": "string",
      "title": "string",
      "description": "string",
      "coordinates": {
        "latitude": "float",
        "longitude": "float"
      },
      "order": "integer"
    }
  ]
}
```

## Acceptance Criteria

### Mock API Service
- [ ] Returns consistent test data in specified format
- [ ] Properly simulates loading states
- [ ] Handles error scenarios gracefully

### Site Listing
- [ ] Displays sites in scrollable list
- [ ] Shows all required site information
- [ ] Handles loading and error states
- [ ] Supports pull-to-refresh
- [ ] Opens detailed view on tap

### Map Integration
- [ ] Shows all sites with custom markers
- [ ] Displays tour route between sites
- [ ] Highlights selected site
- [ ] Supports all map controls
- [ ] Maintains sync with list selection

### UI/UX
- [ ] Follows app theme and design system
- [ ] Provides visual feedback for interactions
- [ ] Maintains responsive layout
- [ ] Handles edge cases gracefully

## Testing Requirements
- Unit tests for:
  - ViewModels
  - Mock API service
  - Data models and serialization
- Widget tests for:
  - Site list view
  - Site card component
  - Map overlay
- Integration tests for:
  - List-map interaction
  - API service integration
  - State management

## Future Considerations
- Real API integration
- Caching of tour data
- Offline support
- Performance optimization for large tours
- Additional map features (clustering, custom routing)

## Implementation Steps

1. Set up required dependencies
2. Implement city input form and validation
3. Create mock API service and response structure
4. Develop site listing UI components
5. Integrate Google Maps and implement map overlay
6. Connect form submission with mock API
7. Implement list-map interaction
8. Add loading states and error handling
9. Write tests
10. Perform code review and documentation