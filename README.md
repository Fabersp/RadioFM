# Paraiso FM

Paraiso FM is a **radio streaming application** developed in **2013** by Pro Master Solution. It allows users to listen to live FM radio stations via streaming on their mobile devices.

## 📱 Features

- **Live FM Streaming:** Listen to Paraiso FM radio station in real-time.
- **Network Connectivity Check:** Automatically detects network connectivity (WiFi or Mobile Data) to ensure smooth playback.
- **Play/Pause Control:** Simple controls to start and stop the streaming.
- **Facebook Integration:** Quick access to the station's Facebook page.
- **Email Support:** Send feedback or share the app with friends via email.

## ⚙️ Technical Details

- **Frameworks:** AVFoundation, UIKit, Reachability.
- **Audio Streaming:** Utilizes `AVQueuePlayer` for seamless audio streaming.
- **Network Monitoring:** Detects network status using `Reachability`.
- **Facebook Integration:** Direct app redirection or fallback to browser if the app is unavailable.
- **Mail Integration:** Allows sending feedback or sharing the app via email using `MFMailComposeViewController`.

## 🛠️ Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-repo/paraiso-fm.git
    ```
2. Open the project in Xcode.
3. Install dependencies if any.
4. Build and run the project on a physical device.

## 🚀 How to Use

1. Launch the app.
2. Press the **Play** button to start streaming.
3. Use the **Stop** button to pause playback.
4. Check network status via the app interface.
5. Access the radio's Facebook page directly from the app.

## 📝 Code Overview

### `FirstViewController.m`

- Handles streaming setup and control.
- Monitors network connectivity using `Reachability`.
- Configures `AVQueuePlayer` for streaming.
- Implements Facebook page redirection.

### `TerceiraTela.m`

- Handles UI elements like feedback and app sharing.
- Integrates with `MFMailComposeViewController` for email communication.

## 📡 API

- **Streaming URL:** Configured dynamically via the backend API.
- **Monitoring Endpoint:** Validates streaming URL availability.

## 🛡️ Error Handling

- Detects failed connections and displays appropriate alerts.
- Monitors playback status using `AVPlayer` observers.

## 👤 Author

- **Fabricio Aguiar de Padua**  
  Pro Master Solution  
  [Website](http://www.promastersolution.com.br)

## 📄 License

This project is licensed under the **MIT License**.
