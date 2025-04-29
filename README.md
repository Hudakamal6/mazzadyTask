# mazzadyTask

📚 Project Overview
MazzadyInterviewTask is a product browsing application where users can:

Browse a list of products

View product details, including associated tags and ads

Search for specific products

View and manage their user profile containing all related information

The app is built to be scalable, maintainable, and easy to test following Clean Architecture best practices.

🛠️ Built With
UIKit – Interface building

MVVM – UI logic separation

Clean Architecture – Project organization

SOLID Principles – Clean code standards

Dependency Injection – Flexible dependency management

URLSession – Networking and API calls

Core Data – Local caching and offline support


├── App
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   └── DIContainer
│
├── Features
│   ├── Products
│   │   ├── Presentation
│   │   ├── Domain
│   │   └── Data
│   ├── Ads
│   ├── Tags
│   ├── User
│
├── Shared
│   ├── Resources
│   │   ├── Assets (Images, Colors)
│   │   ├── Fonts
│   │   └── Localization (if any)
│   ├── Components (Reusable UI)
│   ├── Utilities (Extensions, Helpers)
│
└── SupportingFiles
    └── Info.plist
🔑 Key Features
Browse all available products

View detailed information about products including tags and ads

Search functionality to quickly find specific products

User profile management

Data caching using Core Data for offline access

Networking handled securely and efficiently via URLSession

Dependency injection for all major components

SOLID-compliant, clean and testable code structure

🚀 Getting Started
git clone https://github.com/your-username/MazzadyInterviewTask.git
open terminal at project path -- pod install 
Open the .xcworkspace file in Xcode.
Build and run on a simulator or real device.

🧩 Architecture Overview
Presentation Layer: ViewControllers, ViewModels, Views

Domain Layer: Entities, UseCases, Repository Protocols

Data Layer: Network (URLSession), Persistence (Core Data), Repository Implementations

App Layer: Dependency Injection Setup, App Launching Logic


✍️ Author
Huda kamal
https://www.linkedin.com/in/huda-kamal-9084ab275?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app | https://github.com/Hudakamal6



