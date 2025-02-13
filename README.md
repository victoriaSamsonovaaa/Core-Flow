# Core-Flow

## Description  

SwiftUI application writed using MVVM-architecture. Main technologies are **Firebase** and **HealthKit**. App navigation is ensured by ***TabView*** and ***@Environment*** property wrappers for smooth transitions between screens. Custom color scheme helps an App to look more attractive and special.

##### Key features:
- **User Authentication:**
  - Users authorization is provided by **Firebase Auth**.
  - Users have an ability to sign up/sign in by *email*, *Google* and *Apple* providers.

- **Data Storage:**
  - User-related data, including favorite workouts and personal details (such as name, phone number, and birthdate), is stored in **Firebase Firestore** in separate collection.
  - An extension to *Bundle* is implemented to decode different types of JSON files, enabling the retrieval of workout data from local storage.

- **Integration with HealthKit:**
  - The application include **HealthKit** to access and display user health data, like:
    - **Today’s Step Count:** Instantly fetches and displays the number of steps taken on the current day.
    - **Workout History:** Retrieves detailed records of past workouts, including duration, type, calories burned, and heart rate data.
    - **Active Energy Expenditure:** Total calories burned throughout the day based.
- **Custom UI Components:**
  - **Custom Activity Rings:** Visual representation of user activity progress (smth like Apple's native Activity rings) but tailored to fit the application's design.
  - **Custom Workout Information Cells:** Designed for displaying detailed workout data in an intuitive format.


## Installation  
### 1. Clone the repository  
Clone the repository to your local machine using the following command: `git clone https://github.com/victoriaSamsonovaaa/Core-Flow`

### 2. Open the project in Xcode
Navigate to the project folder and open the .xcworkspace file in Xcode.

### 3. Configure Firebase
To enable Firebase services, follow these steps:
- Go to the Firebase Console.
- Create a new project or select an existing one.
- Navigate to Project ***Settings > General***.
- Download the `GoogleService-Info.plist file`.
- Move the downloaded file into the root directory of your Xcode project.
- Ensure the file is included in the Build ***Phases > Copy Bundle*** Resources section.

### 5. Build and run the application
Select a simulator or a connected device in Xcode. Click the Run button to launch the application.



