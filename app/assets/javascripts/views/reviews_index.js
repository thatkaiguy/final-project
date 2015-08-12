HeadOutdoors.Views.ReviewsIndex = Backbone.CompositeView.extend({
  template: JST['reviews_index'],

  initialize: function() {
    this.listenTo(this.collection, 'add', this.addReviewIndexItemSubview);
    this.collection.each(this.addReviewIndexItemSubview.bind(this));
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
  }
});
