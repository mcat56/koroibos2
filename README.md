# koroibos

### Table of Contents
[Description](#description)

[Tech Stack](#tech-stack)

[Links](#links)

[Getting Started](#getting-started)

[Install Necessary Dependencies](#install-necessary-dependencies)

[Setup Local Database](#set-up-local-database)

[Running Local Server](#running-local-server)

[Testing](#testing)

[Deploying to Heroku](#deploying-to-heroku)

[Endpoints](#endpoints)

[Database Schema](#database-schema)

[Project Board](#project-board)

[Core Contributors](#core-contributors)

### Description

koroibos is a Rails PostgreSQL API serving endpoints for the 2016 Summer Olympics. Endpoints provide data such as all olympians in the games, the oldest and youngest olympians, olympian stats, events, and medalists.

### Tech Stack
* Rails (5.2.4)
* PostgreSQL (11.5)
* RSpec (3.9.0)

### Links

Repository : [repo](https://github.com/mcat56/koroibos)
Production Application : [heroku](link)

## Getting Started

### Installing Necessary Dependencies

Instal necessary dependencies using :

`bundle install`


### Set up local database

This project uses a PostgreSQL database. Database configuration are specified in the database.yml

To create, migrate and add Olympic game data run :

`rake db:create`
`rake db:migrate`
`rake import:olympic_data`


### Running local server

Simple run :

`ruby app.rb`


### Testing

To run testing suite :

`rspec`


### Deploying to Heroku

Create a heroku app with a PostgreSQL add-on. Set your local heroku remote to your heroku app git address
Run the following :
`git push heroku master`
`heroku run rake db:migrate`
`heroku run rake db:seed`
`heroku run rake import:olympic_data`
`heroku open`

## Endpoints

<details>
  <summary>Get All Olympians</summary>

GET request to `api/v1/olympians`

Sample Response :
```
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```
</details>

<details>
  <summary>Get Youngest Olympian</summary>

GET request to `api/v1/olympians?age=youngest`

Sample Response:
```
{
  "olympians":
    [
      {
        "name": "Ana Iulia Dascl",
        "team": "Romania",
        "age": 13,
        "sport": "Swimming"
        "total_medals_won": 0
      }
    ]
}
```
</details>

<details>
  <summary>Get Oldest Olympian</summary>

GET request to `api/v1/olympians?age=oldest`

Sample Response:
```
{
  "olympians":
    [
      {
        "name": "Julie Brougham",
        "team": "New Zealand",
        "age": 62,
        "sport": "Equestrianism"
        "total_medals_won": 0
      }
    ]
}
```
</details>

<details>
  <summary>Get Olympian Statistics</summary>

GET request to `api/v1/olympian_stats`

Sample Response:
```
{
    "olympian_stats": {
        "total_competing_olympians": 2856,
        "total_male_olympians": 1633,
        "total_female_olympians": 1223,
        "average_weight": {
            "unit": "kg",
            "male_olympians": 77.9,
            "female_olympians": 61.4
        },
        "average_age": 26.4
    }
}
```
</details>

<details>
  <summary>Get Olympic Events</summary>

GET request to `api/v1/events`

Sample Response:
```
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```
</details>

<details>
  <summary>Get Event Medalists</summary>

GET request to `api/v1/events/:id/medalists`

Sample Response:
```
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```
</details>

<details>
  <summary>Get Top Medalists</summary>

GET request to `api/v1/olympians/top_medalists`

Sample Response:
```
{
    "top_medalists": {
        "male": {
            "name": "Nathan Ghar-Jun Adrian",
            "events": [
                {
                    "event": "Swimming Men's 50 metres Freestyle",
                    "medal": "Bronze"
                },
                {
                    "event": "Swimming Men's 100 metres Freestyle",
                    "medal": "Bronze"
                },
                {
                    "event": "Swimming Men's 4 x 100 metres Freestyle Relay",
                    "medal": "Gold"
                },
                {
                    "event": "Swimming Men's 4 x 100 metres Medley Relay",
                    "medal": "Gold"
                }
            ],
            "total_medals_won": 4
        },
        "female": {
            "name": "Simone Arianne Biles",
            "events": [
                {
                    "event": "Gymnastics Women's Individual All-Around",
                    "medal": "Gold"
                },
                {
                    "event": "Gymnastics Women's Team All-Around",
                    "medal": "Gold"
                },
                {
                    "event": "Gymnastics Women's Floor Exercise",
                    "medal": "Gold"
                },
                {
                    "event": "Gymnastics Women's Horse Vault",
                    "medal": "Gold"
                },
                {
                    "event": "Gymnastics Women's Balance Beam",
                    "medal": "Bronze"
                }
            ],
            "total_medals_won": 5
        }
    }
}
```
</details>

### Database Schema

![database schema](https://i.imgur.com/DmuIVva.png)


### Project Board

[GitHub Project Board](https://github.com/mcat56/koroibos/projects/1)

### Core Contributors

Mary Lang @mcat56
