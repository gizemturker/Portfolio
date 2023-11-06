# APIList App

An iOS application built using SwiftUI that lists various API names and provides detailed information about them.

## Description

This app fetches JSON data from the apilist.json file using URLSession and modern concurrency. The data is obtained from the https://api.publicapis.org/entries URL. It utilizes the store object to manage data fetching and loading.

## Requirements

- The store object fetches data from https://api.publicapis.org/entries using URLSession and modern concurrency.
- Data fetching prioritizes the network, followed by the document directory, and then the bundle.
- If data cannot be fetched from any of these sources, the user is notified of the failure.

## Installation

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on a simulator or a physical device.

## Usage

- Launch the app to initiate data fetching from the provided URL.
- Display API names and their details upon successful data retrieval.
- Handle network or data loading failures by displaying appropriate error messages.

## Contributor

- [Gizem Turker](https://github.com/gizemturker) - Main Developer



<img src="(https://github.com/gizemturker/swiftui-notes/assets/17044304/b7c8b209-d22c-4ab1-97e5-4f0dd1f0de24).png" width="200" height="400" />



![api1](https://github.com/gizemturker/swiftui-notes/assets/17044304/b7c8b209-d22c-4ab1-97e5-4f0dd1f0de24){:height="200px" width="300px"}

![api2](https://github.com/gizemturker/swiftui-notes/assets/17044304/63b0bd64-43ec-4be3-805d-e40974348f9e){:height="200px" width="300px"}

![api3](https://github.com/gizemturker/swiftui-notes/assets/17044304/ae424540-7821-4b01-bcc7-645e561bd578){:height="200px" width="300px"}


