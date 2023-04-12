# Meep

#Description
Welcome to Meep, the unique mapping application!

Our distinctive icon and personalized loading screen will take you on a visual adventure while we load the map of the city of Lisbon and the elements we need to provide you with a unique experience.

Upon opening the application, you will find markers spread throughout the map in three different types, each identified by their zone ID. As you move around the map, the markers will automatically update to provide you with up-to-date information on what is happening around you.

Each type of marker has relevant information that will be displayed when clicked, including a photo and a title for better identification. In addition, you can also access more details of each marker with just one click of a button.

We strive to provide a smooth and intuitive experience for our users, so do not hesitate to contact us if you have any questions or suggestions.

Thank you for using Meep, and we hope you enjoy exploring Lisbon with us!


#Requirements

Conexión a internet estable para cargar mapas y datos de ubicación en tiempo real
Espacio de almacenamiento suficiente en su dispositivo para descargar y almacenar mapas y datos de ubicación

Para utilizar todas las funciones de nuestra aplicación de mapas, recomendamos encarecidamente que actualice su dispositivo iOS a la última versión disponible y disponga de una conexión a internet rápida y estable para una experiencia óptima.

#Instalation

#Usage
Once you open the application, you will see a custom loading screen while the map of Lisbon and necessary elements are loaded to provide you with a unique experience.

Once the application has fully loaded, you will see a map view of Lisbon with markers spread throughout the city. Each type of marker has a different zone ID, making them easily identifiable.

As you move around the map, the markers will automatically update to provide you with up-to-date information about what is happening around you. To learn more about a specific marker, simply tap on it and relevant information will be displayed, including a photo and a title for better identification.

If you want more details about a specific marker, simply tap the "Detail" button and you will be taken to a screen with more detailed information about that marker.

For optimal user experience, make sure to enable location on your device and allow Meep to access the location of the application to improve accuracy and functionality of the map application.


#Architecture
The code of this application is based on the MVVM architecture. In the AppDelegate, Google services are initialized and in the SceneDelegate, the APIClient, repositories, and MainCoordinator are initialized, which is responsible for starting the first ViewController and the view hierarchy it contains.

The MainCoordinator is formed by a simple protocol of presentedViewController, in charge of representing the current ViewControllerDelegate to be shown and a start function that will initiate it.

In general, modyles are divided into 3 folders: Coordinator, which also contains the router and an extension of the coordinator that applies the Router protocol, which will handle all navigations between different ViewControllers,
ViewModel and ViewController, which are connected in a cycle using a state-event engine.

Due to the complexity of the application, it has been decided to leave the map logic as a simple view.

#License

MIT License

Copyright (c) 2023 GuillermoAlv96

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


#Contact
guillermoalvarezdelorenzana@gmail.com
