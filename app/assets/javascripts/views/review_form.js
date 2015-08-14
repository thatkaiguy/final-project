HeadOutdoors.Views.ReviewForm = Backbone.CompositeView.extend({
  template: JST['review_form'],

  initialize: function(options) {
    this.activity = options.activity;
  },

  events: {
    "submit .review-form" : "saveReview"
  },

  render: function() {
    var content = this.template({ review: this.model });
    this.$el.html(content);
    this.attachSubviews(); //no subviews yet
    return this;
  },

  saveReview: function(e) {
    e.preventDefault();

    var formJSON = $(e.currentTarget).serializeJSON();
    formJSON.review.activity_id = this.activity.id;

    var review = new HeadOutdoors.Models.Review();
    var view = this;
    review.save(formJSON, {
      success: function(savedReview){
        view.collection.add(savedReview);
        view.model = new HeadOutdoors.Models.Review();
      }
    });
  }
});
