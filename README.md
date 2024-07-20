# Card Game iOS Application

This application is a simple card game where players are automatically assigned to either the East or West side based on their geographical location relative to a specified coordinate. The game progresses through automatic rounds where cards are revealed on a timer. After 10 rounds, the winner is determined and announced.

## Features

- **Welcome Screen**: Users are greeted with a welcome screen that asks for their name and uses their location to assign them to a game side (East or West).
  
- **Automatic Gameplay**: The game progresses automatically through 10 rounds of card reveals.
  
- **Timer for Card Reveals**: Cards are revealed after a 2-second countdown, shown for 3 seconds, and then repeated for the next round.
  
- **Winner Announcement**: After 10 rounds, the winner is announced based on the higher card values.

## Gameplay Flow

1. **Welcome Screen**:
   - User enters their name and submits it.
   - Location is used to assign the user to the East or West side based on their proximity to a predefined coordinate (34.817549168324334).

2. **Game Screen**:
   - Automatically starts after the user submits their name.
   - Cards are revealed automatically every 5 seconds (2 seconds before reveal, 3 seconds after).
   - After 10 rounds, the game determines the winner based on the card values.

3. **Winner Announcement**:
   - The winner (East or West) is announced after 10 rounds.
   - Users have the option to return to the Welcome Screen to start a new game.

## Getting Started

To run the Card Game iOS Application:

1. **Clone the Repository**:

```git clone https://github.com/your/repository.git```


2. **Open the Project in Xcode**:
- Navigate to the project directory and open the `.xcodeproj` file in Xcode.

3. **Run the Application**:
- Select a simulator or a physical device as the target and run the application.

4. **Follow On-Screen Instructions**:
- Enter your name on the Welcome Screen.
- Allow location access if prompted to assign a game side (East or West).
- Enjoy playing the card game automatically!

## Technologies Used

- Swift
- UIKit
- Core Location (for location-based assignment)
- Xcode (Development Environment)

## Screenshots

![Welcome Screen](screenshots/welcome_screen.png)
![Game Screen](screenshots/game_screen.png)

## License

This project is licensed under the MIT License - see the LICENSE file for details.