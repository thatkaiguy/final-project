# Phase 2: Creating and Booking Activities

## Rails
### Models

### Controllers
Api::ActivitiesController (create, destroy, index, show)
Api::UsersController (show)

### Views
* activities/show.json.jbuilder
* activities/index.json.jbuilder

## Backbone
### Models
* Activity
* User

### Collections
* Activities

### Views
* ActivityForm
* ActivityShow (composite view, contains ReviewsIndex subview)
* UserShow (composit view, contains BookedActivitiesIndex subview)
* BookedActivitiesIndex

## Gems/Libraries
