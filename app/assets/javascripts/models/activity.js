HeadOutdoors.Models.Activity = Backbone.Model.extend({
  urlRoot: '/api/activities',

  parse: function(payload) {
    if (payload.reviews) {
      this.reviews().set(payload.reviews);
      delete payload.reviews;
    }
    return payload;
  },

  reviews: function() {
    if (!this._reviews) {
      this._reviews = new HeadOutdoors.Collections.Reviews([], {activity: this});
    }
    return this._reviews
  },

  bookedActivityLinks: function() {
    if (!this._bookedActivityLinks) {
      this._bookedActivityLinks = new HeadOutdoors.Collections.BookedActivities();
    }
    return this._bookedActivityLinks;
  },

  toJSON: function() {
    return { activity: _.clone( this.attributes ) }
  }
});
