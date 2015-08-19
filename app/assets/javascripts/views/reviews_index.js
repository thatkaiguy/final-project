HeadOutdoors.Views.ReviewsIndex = Backbone.CompositeView.extend({
  template: JST['reviews_index'],

  initialize: function(options) {
    this.activity = options.activity;
    this.listenTo(this.collection, 'add', this.addReviewIndexItemSubview);
    this.collection.each(this.addReviewIndexItemSubview.bind(this));
  },

  events: {
    'click .leave-review.btn' : 'addReviewFormSubview'
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addReviewIndexItemSubview: function(review) {
    var reviewIndexItemView = new HeadOutdoors.Views.ReviewIndexItem({
      model: review
    });
    this.addSubview('.reviews', reviewIndexItemView);
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
  }
});
