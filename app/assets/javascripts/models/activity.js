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
  }
});
