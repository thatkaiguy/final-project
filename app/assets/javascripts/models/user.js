HeadOutdoors.Models.User = Backbone.Model.extend({
  urlRoot: 'api/users',

  parse: function(payload) {
    var user = this;

    if (payload.booked_activities) {
      payload.booked_activities.forEach(function(bookedActivity) {
        var activityID = bookedActivity.activity.id;
        var activity = user.bookedActivities().get(activityID);

        if (activity === undefined) {
          activity = new HeadOutdoors.Models.Activity(bookedActivity.activity);
          user.bookedActivities().add(activity);
        }

        activity.bookedActivityLinks().add(
          new HeadOutdoors.Models.BookedActivity({
            party_size: bookedActivity.party_size,
            date: bookedActivity.date
          }));
      });
      delete payload.booked_activities;
    }

    return payload;
  },

  bookedActivities: function() {
    if (!this._bookedActivities) {
      this._bookedActivities = new HeadOutdoors.Collections.Activities();
    }
    return this._bookedActivities;
  },

  hasBookedActivity: function(activity_id){
    return this.bookedActivities().get(activity_id) !== undefined;
  }
});
