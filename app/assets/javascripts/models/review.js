HeadOutdoors.Models.Review = Backbone.Model.extend({
  urlRoot: '/api/reviews',

  parse: function(payload) {
    if (payload.author) {
      this.author().set(payload.author);
      this.author().set({ id: payload.author_id })
      delete payload.author;
    }
    return payload;
  },

  author: function() {
    if (!this._author) {
      this._author = new HeadOutdoors.Models.User();
    }

    return this._author;
  }
});
