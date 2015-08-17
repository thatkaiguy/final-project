HeadOutdoors.Collections.BookedActivities = Backbone.Collection.extend({
  url: 'api/booked_activities',

  model: HeadOutdoors.Models.BookedActivity
});
