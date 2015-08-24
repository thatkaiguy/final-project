HeadOutdoors.Views.ReviewForm = Backbone.CompositeView.extend({
  template: JST['review_form'],

  initialize: function(options) {
    this.activity = options.activity;
  },

  events: {
    "submit .review-form" : "saveReview"
  },

  addAlert: function(options) {
    var $alert = null;
    var template = null;

    if (options.isSuccess) {
      template = JST['_success_alert'];
    } else {
      template = JST['_error_alert'];
    }

    if (($alert = this.$el.find('.alert')) && $alert.length) {
      $alert.remove();
    }

    this.$el.prepend(template({ msg: options.message }));
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
    var review = new HeadOutdoors.Models.Review();
    var view = this;

    formJSON.review.activity_id = this.activity.id;
    review.save(formJSON, {
      success: function(){
        view.model = new HeadOutdoors.Models.Review();
        view.activity.fetch();
      },
      error: function(review, xhr) {
        var errorMsgs = $.parseJSON(xhr.responseText).errors;
        errorMsgs.forEach(function(errorMsg) {
          view.addAlert({
            isSuccess: false,
            message: errorMsg
          });
        });
      }
    });
  }
});
