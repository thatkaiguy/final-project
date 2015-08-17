HeadOutdoors.Views.ActivityShow = Backbone.CompositeView.extend({
  template: JST['activity_show'],

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.addReviewsIndexSubview();
  },

  events: {
    'click button.book-activity' : 'bookActivity'
  },

  render: function(){
    var content = this.template({ activity: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addReviewsIndexSubview: function() {
    var reviewsIndexView = new HeadOutdoors.Views.ReviewsIndex({
      collection: this.model.reviews(),
      activity: this.model
    });
    this.addSubview('.reviews-index', reviewsIndexView);
  },

  bookActivity: function() {
    // get current user
    // create record in booked activity table
  }
});
