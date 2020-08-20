# Wanderlust
Your personal travel companion!

## Table of Contents
* [General Info](#general-info)
* [Inspiration](#inspiration)
* [Demonstration Video](#demonstration-video)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Contact](#contact)

## Link to Frontend Git Repository
[Wanderlust Frontend Repository](https://github.com/haleykelling/Travel_Planner_Frontend)

## General Info
My backend for this application was created using Ruby on Rails with Bcrypt and JWT for authentication. The backend holds all user data including their trips and itinerary data. I have deployed this using Heroku, which can be accessed at https://stormy-fjord-63158.herokuapp.com.

## Backend Technologies 
* Ruby - version 2.6.1
* Rails - version 6.0.3, >= 6.0.3.2
* PostgreSQL

Gems:
* Bcrypt - version 3.1.15
* JWT - version 2.2.1
* Excon - version 0.75.0
* Figaro - version 1.2.0

## Model Relationships
A user has many trips. Each trip has many days, which are automatically created and updated based on the user input of the dates. Unless a user updates a trip to be shorter than it previously was, no data linked to a day will be deleted upon editing a trip. A user cannot directly create or delete a day, but they can update the locations of a day. A day has many activities and comments. A day has many transportations and accommodations, but both of these can belong to many days as well. Therefore, we have join tables between days and transportations and between days and accommodations. 

## External API
This application utilizes Google's geocoding API to take a city or address from the frontend and return coordinates that can be plotted in a map screen on the app. 

## Challenges
My biggest challenge on the backend was dealing with dates and ensuring a seemless user experience for creating, updating, and deleting trips. This was accomplished through somewhat lengthy conditional logic in my Trip model when a user sends an updated start or end date to the backend. I also wanted to ensure that data tied to the trip wouldn't be lost with an update request. 

## Contact
Created by [Haley Kelling](https://www.linkedin.com/in/haley-kelling/).

If you have any questions or comments feel free to reach out to me.