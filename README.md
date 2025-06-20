# 📝 Task Management App

A clean, scalable, and fully functional task management app built with Flutter.  
This app allows users to add, update, delete, search, and manage tasks with local persistence, theming, and smooth animations.

---

## 🎬 Demo

You can watch the app demo [here](https://drive.google.com/file/d/1x4G1xd_hkQZsRbpQjCJdOaqISkd8L6S7/view?usp=sharing).

---

## ⚙️ APK

You can install the debug APK [here](https://drive.google.com/file/d/1afZnsGGlHXBvfaM7XcNlc_Lt3WMsEAmm/view?usp=sharing).

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/salma234-del/task_management_app
cd task_management_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

```bash
flutter run
```

---

## 🚀 Features

- ✅ Add, update, delete tasks
- ✅ Show task list
- ✅ Change task status (e.g., from ToDo to Done and from Done to ToDo)
- ✅ Real-time task search
- 🌗 Light & Dark theme toggle
- 📦 Clean architecture with separation of concerns (Presentation, Domain, Data)
- 🧪 Cubit/BLoC state management
- 🧪 Unit testing for core logic with `bloc_test`, `mocktail`
- 🧰 Dependency Injection using `get_it`
- 🧠 Local storage using `Hive`
- 🧭 Navigation with `go_router`
- ⚙️ Easy to extend and maintain

---

## ⚙️ State Management

Using **Cubit** from `flutter_bloc` for all task-related and theme state logic.

---

## 💡 Architecture

Following Clean Architecture with clear separation between:

- `Data Layer`: Manages local storage via Hive
- `Domain Layer`: Contains task entity & abstract repository
- `Presentation Layer`: UI logic, Cubits, Views

---

## 📂 Folder Structure (Simplified)

```plaintext
lib/
│
├── core/
│
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── presentation/
│   ├── cubits/
│   ├── views/
│   └── widgets/
│
└── main.dart
```

---

## 💾 Local Storage

Implemented using **Hive**:
- Tasks are stored locally in Hive boxes
- Task model has a custom Hive TypeAdapter

---

## 🎨 Theme Switching

- Light and Dark modes supported
- Uses `ThemeCubit` to toggle
- Transitions animated with `AnimatedSwitcher`

---

## 🔐 Dependency Injection

All core dependencies (e.g., data sources, use cases) are injected via `get_it`.

---

## 📦 Packages Used

| **Package**              | **Purpose**                                                                 |
|--------------------------|------------------------------------------------------------------------------|
| `flutter_bloc`           | Bloc/Cubit state management                                                  |
| `get_it`                 | Dependency injection (service locator)                                      |
| `dartz`                  | Functional programming support (`Either`, `Option`, etc.)                    |
| `equatable`              | Simplifies equality comparisons for objects                                 |
| `go_router`              | Declarative and robust navigation with route transitions                    |
| `hive`                   | Lightweight and fast local key-value database                               |
| `hive_flutter`           | Flutter integration for Hive                                                 |
| `path_provider`          | Access to platform directories                                               |
| `uuid`                   | Generate unique task IDs                                                     |
| `flutter_screenutil`     | Responsive UI for different screen sizes                                     |
| `flutter_slidable`       | Swipeable task actions (e.g., delete/edit)                                   |
| `skeletonizer`           | Skeleton loading widgets for better UX during data loading                  |
| `flutter_spinkit`        | Pre-built loading spinners and indicators                                   |

### 🧪 Dev & Test Packages

| **Package**              | **Purpose**                                                                 |
|--------------------------|------------------------------------------------------------------------------|
| `mocktail`               | Type-safe mocking without code generation                                   |
| `bloc_test`              | Testing utilities specifically for Bloc/Cubit                               |
| `hive_generator`         | Code generation for Hive type adapters                                      |
| `build_runner`           | Code generation runner for Hive, JSON serialization, etc.                   |
| `test`                   | Dart unit testing framework                                                  |

---
