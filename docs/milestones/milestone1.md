# Milestone 1: Initial App Setup and Home Screen UI

## Objective
Set up the basic Flutter application structure and implement the home screen with city search and tour preferences UI.

## Technical Tasks

### 1. Project Setup
- Initialize new Flutter project with latest stable Flutter version
- Configure project structure following Flutter best practices
- Set up necessary dependencies in `pubspec.yaml`:
  - `google_fonts` for custom typography
  - `flutter_typeahead` for city autocomplete
  - `http` for future API integration

### 2. App Theme and Styling
- Create a consistent theme configuration
- Define color palette
- Set up custom typography for the "AI" emphasis in the app title
- Implement reusable style constants

### 3. Home Screen Implementation
- Create AppBar with styled "audio trail" title
  - Special styling for "ai" in "trail"
- Implement city search autocomplete field
  - Create mock city data service for development
  - Add loading states
  - Handle error states
- Add tour preference inputs:
  - Guide time length input with validation
  - Maximum walking distance input with validation
- Implement "Create Guide" button
  - Enable/disable based on form validation
  - Add visual feedback for interaction

### 4. Mock Services
- Create abstract service interface for city data
- Implement mock city data service
- Structure for easy replacement with real backend later

## Acceptance Criteria

### AppBar
- [ ] Displays "audio trail" with distinct styling for "ai"
- [ ] Proper spacing and alignment
- [ ] Consistent with app theme

### City Search
- [ ] Autocomplete field responds to user input
- [ ] Shows loading state while fetching suggestions
- [ ] Displays error state appropriately
- [ ] Clear visual feedback for selected city

### Tour Preferences
- [ ] Time input accepts hours in decimal format
- [ ] Distance input accepts miles in decimal format
- [ ] Both inputs have proper validation
- [ ] Clear error messages for invalid inputs

### Create Guide Button
- [ ] Disabled when form is invalid
- [ ] Visual feedback on hover/press
- [ ] Clear indication when city is not selected

## Testing Requirements
- Unit tests for:
  - Input validation
  - Mock city service
  - Button state management
- Widget tests for:
  - AppBar rendering
  - Form field interactions
  - Autocomplete functionality

## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
  flutter_typeahead: ^5.0.1
  http: ^1.1.0
```

## Future Considerations
- Backend integration for city data
- User authentication system
- Tour generation functionality
- State management solution for larger app structure 