# Car Rental

A modern, feature-rich Flutter mobile application for premium car rentals with **FREE OpenStreetMap integration** (no API key required!).

## Features

* Modern UI - Clean, elegant design with dark/light themes
* FREE Maps - OpenStreetMap integration showing Abuja, Nigeria (zero setup!)
* Location Map - OpenStreetMap integration showing Abuja, Nigeria (zero setup!)
* Smart Search - Real-time search and category filtering
* Favorites - Save and manage favorite vehicles
* Booking System - Complete booking flow with date selection
* Booking Management - Track active, completed, and cancelled bookings

* Theme Toggle - Switch between dark and light modes

* Payment - Stripe payment integration
* Dark/Light Mode - Switch between dark and light modes
* Bottom Navigation - Quickly navigate between screens

## Tech Stack

* Framework: Flutter
* State Management: Riverpod
* Navigation: Go Router
* Maps: Flutter Map (OpenStreetMap - FREE)
* Fonts: Google Fonts (Inter)

## Screens

1. Welcome - Onboarding with hero car image
2. Home - Browse premium vehicles
3. Detail - Car specs, features, and interactive map
4. Favorites - Saved cars
5. Booking - Complete booking history with stats
6. Profile - Settings and theme toggle


## Stripe payment integration
1. Create a Stripe account [here](https://dashboard.stripe.com/register)
2. Create a Stripe API key [here](https://dashboard.stripe.com/apikeys)
3. Add the API keys (publishable key and secret key) to the `.env`. 
    ```
   STRIPE_SECRET_KEY=sk_test_YOUR_SECRET_KEY
   STRIPE_PUBLISHABLE_KEY=pk_test_YOUR_PUBLISHABLE_KEY
   ```
4. Configure your flutter app by following the instructions for flutter_stripe package [here](https://github.com/flutter-stripe/flutter_stripe)
5. Check stripe site for test cards [here](https://stripe.com/docs/testing)

## Payment flow
1. User books a car
2. Fills in details (dates, info)
3. Taps "Confirm Booking"
4. Choose payment method:
    - Pay with Card → Opens Stripe payment sheet
    - Pay Later → Creates pending booking
5. Enter card details (if paying now)
6. Payment processes
7. Success! Booking confirmed

## Screenshots

![Welcome screen](assets/screenshots/welcome.png)  

### Light mode

![Home Screen](assets/screenshots/home_light.png) ![Favorite Screen](assets/screenshots/favorite_light.png) ![Booking Screen](assets/screenshots/booking_light.png)

![Payment Screen](assets/screenshots/payment.png)

### Dark mode

![Home Screen Dark](assets/screenshots/home_dark.png) ![Favorite Screen](assets/screenshots/favorite_dark.png) ![Booking Screen](assets/screenshots/booking_dark.png)

![Detail Screen](assets/screenshots/car_detail_dark.png) ![Detail Screen contd.](assets/screenshots/car_detail2_dark.png)
