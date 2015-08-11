# Head Outdoors

[Heroku link][heroku]

[heroku]: http://headoutdoors.herokuapp.com

## Minimum Viable Product
Head Outdoors is a Viator inspired site with a focus on outdoor trips
built on Rails and Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [ ] Create accounts (travelers and providers)
- [ ] Create sessions (log in)
- [ ] Post activities (providers)
- [ ] Book activities (traveler)
- [ ] Search activities by city
- [ ] Search activities by category
- [ ] Rate an activity and write a review
- [ ] Search activities by map and filter by activity category


## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication (~1 day)
Implement user authentication. Travelers will be able to book activities and providers will be able to post activities for
travelers to book.

[Details][phase-one]

### Phase 2: Creating and Booking Activities (~2 days)
I will create API end-points to create and book activities from the site. I will
also work on Backbone views that providers will use to create activities and
corresponding views that travelers will use to book the activities. Providers
be able to post a picture, description, and valid booking dates for an activity.

[Details][phase-two]

### Phase 3: Search Activities (~2 days)
I plan to work on functionality that will allow travelers to search activities
by geographic location and by categories.

[Details][phase-three]

### Phase 4: Reviews (~1-2 days)
I will work on creating user profile pages so that travelers may write reviews
for an activity.

[Details][phase-four]

### Phase 5: Searching for Activity by Map (~2 days)
I'll add a map view search where travelers will be able to see activities on a
map and filter them by activity category.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] Pagination/infinite scroll for activities
- [ ] User avatars
- [ ] Typeahead search bar

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
