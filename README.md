Meals Flutter App
A simple Flutter application that displays categorized meals and allows users to filter them based on dietary restrictions (gluten-free, lactose-free, vegetarian, and vegan). Built with Riverpod for state management.

📱 Features
Browse meals by category
Filter meals by:
Gluten-free
Lactose-free
Vegetarian
Vegan

Smooth navigation between screens

Responsive UI using Flutter’s modern widget system

State management with Riverpod

🛠️ Tech Stack
Flutter – UI development

Dart – Programming language

Riverpod – State management

Material Design – UI components

📂 Project Structure
lib/
├── data/                     # Dummy data for categories and meals
├── module/                   # Data models (Category, Meal)
├── providers/                # Riverpod providers (meals, filters)
├── screens/                  # UI Screens (Categories, Meals)
├── widgets/                  # Reusable widgets (CategoryGridItem)

🚀 Getting Started
Clone the repo:
git clone https://github.com/Yaman-Khateeb/meals-flutter-app.git
cd meals-flutter-app
Install dependencies:
flutter pub get
Run the app:
flutter run

📌 Notes
This is a learning project created while following a Flutter course.

The app uses dummy data (dummy_categories_data.dart, dummy_meals_data.dart) and doesn’t connect to a backend.

Filters are applied locally on the dummy meals list.


