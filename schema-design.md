# 24.4 DDL & Schema Design - Data Modeling Exercise

Diagram what 
- the tables and 
- relationships should look like as well as 
- some other things you might want to store/potential challenges with the model and/or information you are storing.

## Part One: Medical Center
- A medical center employs several doctors. *checked*
- A doctors can see many patients. *checked*
- A patient can be seen by many doctors. *checked*
- During a visit, a patient may be diagnosed to have one or more diseases. *checked*

**Entities**

- Doctors
  - `doctor_id` (PK)
  - `doctor_name`

- Patients
  - `patient_id` (PK)
  - `patient_name`
  
- Diseases
  - `disease_id` (PK)
  - `disease_name`
  - 

**Join Table**

- patients_diseases
  - `patient_id` (PK, FK)
  - `disease_id` (PK, FK)

```plaintext

+----------------+               +-----------------+                +-------------------------+                +-----------------+                                              
|    Doctors     |               |    Patients     |                |     patients_disease    |                |   Diseases      |          
|----------------|               |-----------------|                |-------------------------|                |-----------------|
| doctor_id (PK) |<------------- |patient_id (PK)  |------------->  | patient_id (PK, FK)     | -------------> | disease_id (PK) |
| doctor_name    |-------------> |patient_name     | <------------- | disease_id (PK, FK)     | <------------- | disease_name    |
+----------------+               +-----------------+                +-------------------------+                +-----------------+

 One to Many               Many to One          One to Many               Many to One                           Many to One

```

## Part Two: Craigslist 
Design a schema for Craigslist! Your schema should keep track of the following
- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc) *checked*
- Users and preferred region (Do not understnad "preferred region")
- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
- Categories that each post belongs to. (Do not understand "location of the posting", "region of the posting")

**Entities**

- regions
  - `region_id` (PK)                               
  - `region_name`

- users
  - `user_id` (PK)
  - `user_name`
  
- preferred_region
  - `id` (PK)
  - `name`


**Join Table**

- posts
  - `post_id` (PK)
  - `user_id` (PK, FK)
  - `region` (PK, FK)
  - `title`
  - `text`
  - `location`


```plaintext 

+----------------+               +-----------------+                +-------------------------+                               
|    regions     |               |    users        |                |     posts               | 
|----------------| Many to One   |-----------------|                |-------------------------| 
| region_id (PK) |<------------- | user_id (PK)    |------------->  | post   _id (PK, FK)     | 
| region_name    |               | user_name       | <------------- | usre_id    (PK, FK)     | 
|                | One to Many   |                 |                | region     (PK, FK)     | 
|                |-------------> |                 |                | title                   | 
|                |               |                 |                | text                    | 
|                |               |                 |                | location                | 
+----------------+               +-----------------+                +-------------------------+ 

 
```

## Part Three: Soccer League
Design a schema for a simple sports league. Your schema should keep track of
- All of the teams in the league *checked*
- All of the goals scored by every player for each game *checked*
- All of the players in the league and their corresponding teams *checked*
- All of the referees who have been part of each game *checked*
- All of the matches played between teams *checked*
- All of the start and end dates for season that a league has *checked*
  
- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

**Entities**

- teams
  - `team_id` (PK)                               
  - `team_name`
  - `ranking`

- goals
  - `goal_id` (PK)
  - `game_id` (FK)
  - `player_id` (FK)

- league
  - `league_id` (PK)
  - `player_id` (FK)
  - `team_id` (FK)
  - `start_date`
  - `end_date`
  
- players
  - `player_id` (PK)
  - `player_name`
  - `team_id` (FK)

- games
  - `game_id`(PK)
  - `referees`
  - `home_team_id` (FK)
  - `away_team_id` (FK)

```plaintext

+----------------------+
|   games              |
|----------------------|
| game_id (PK)         |
| referees             |
| home_team_id   (FK)  |
| away_team_id         |
|                      |
+----------------------+
        |
        |
        |
        |
        v
+----------------+               +-----------------+                +---------------------+                                                              
|    teams       |               |    players      |                |     goals           |                          
|----------------| Many to One   |-----------------| One to Many    |---------------------|                
| team_id (PK)   |<------------- |player_id (PK)   |------------->  | goal_id (PK)        |  
| team_name      |-------------> |player_name      | <------------- | game_id (FK)        |  
| ranking        | One to Many   |team_id          | Many to One    | player_id (PK, FK)  |  
+----------------+               +-----------------+                +---------------------+                
^                                ^
|                                | One player can only play
|                                | in one team or one league.
|     +-----------------+        |                
------|   league        |---------                
      |-----------------|                                        
      | league_id (PK)  | One league has many players and teams.                      
      | player_id (FK)  |                          
      | team_id   (FK)  |                         
      | start_date      |                         
      | end_date        |                         
      +-----------------+                         



```