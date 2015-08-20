HeadOutdoors.Views.ReviewsIndex = Backbone.CompositeView.extend({
  template: JST['reviews_index'],

  initialize: function(options) {
    this.activity = options.activity;
    this.user = options.user;
    this.listenTo(this.collection, 'add', this.addReviewIndexItemSubview);
    this.listenTo(this.user, 'sync', this.render);
    this.listenTo(this.activity, 'sync', this.render);
    this.listenTo(this.activity, 'sync', this.removeReviewFormSubview);
    this.collection.each(this.addReviewIndexItemSubview.bind(this));
  },

  events: {
    'click .leave-review.btn' : 'addReviewFormSubview'
  },

  render: function() {
    var content = this.template({
      user: this.user,
      activity: this.activity,
      reviews: this.collection
    });
    this.$el.html(content);
    this.attachSubviews();
    this.$el.find('#raty').empty();
    this.$el.find('#raty').raty({ scoreName: 'review[num_stars]'});
    return this;
  },

  addReviewIndexItemSubview: function(review) {
    var reviewIndexItemView = new HeadOutdoors.Views.ReviewIndexItem({
      model: review
    });
    this.addSubview('.reviews', reviewIndexItemView);
  },

  removeReviewFormSubview: function(){
    if (this._reviewFormView) {
      this.removeSubview('.review-form-div', this._reviewFormView);
      this._reviewFormView = null;
    }
  },

  addReviewFormSubview: function(e) {
    e.preventDefault();

    if (!this._reviewFormView) {
      this._reviewFormView = new HeadOutdoors.Views.ReviewForm({
        model: new HeadOutdoors.Models.Review(),
        collection: this.collection,
        activity: this.activity
      });
      this.addSubview('.review-form-div', this._reviewFormView);
    }
    // force render to initialize raty
    this.render();
  }
});
