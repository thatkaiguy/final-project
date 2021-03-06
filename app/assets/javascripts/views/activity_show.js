HeadOutdoors.Views.ActivityShow = Backbone.CompositeView.extend({
  template: JST['activity_show'],

  initialize: function(options) {
    this.user = options.user;
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.user, 'sync', this.render);
    this.addReviewsIndexSubview();
  },

  className: 'activity-show-wrapper',

  events: {
    'submit form.book-activity' : 'bookActivity'
  },

  render: function(){
    var content = this.template({ activity: this.model });
    this.$el.html(content);
    this.attachSubviews();
    this.$el.find('#datepicker').datepicker();
    this.$el.find( "#party-size" ).spinner({
      min: 0,
      alignment: 'vertical'
    });
    this.$el.find('.raty-avg-read-only').raty({
      readOnly: true,
      score: this.model.reviews().avgRating()
    });
    return this;
  },

  addReviewsIndexSubview: function() {
    var reviewsIndexView = new HeadOutdoors.Views.ReviewsIndex({
      collection: this.model.reviews(),
      activity: this.model,
      user: this.user
    });
    this.addSubview('.reviews-index', reviewsIndexView);
  },

  addAlert: function(options) {
    var $alert = null;
    var template = null;

    if (options.isSuccess) {
      template = JST['_success_alert'];
    } else {
      template = JST['_error_alert'];
    }

    if (($alert = $('.head-outdoors-app').find('.alert')) && $alert.length) {
      $alert.remove();
    }

    $('.head-outdoors-app').prepend(template({ msg: options.message }));
  },

  bookActivity: function(e) {
    e.preventDefault();
    var view = this;

    bootbox.confirm("Book this activity?", function(result) {
      if (result) {
        var frmJSON = $(e.currentTarget).serializeJSON();
        var bookedActivity = new HeadOutdoors.Models.BookedActivity();
        bookedActivity.save(frmJSON, {
          success: function() {
            view.addAlert({
              isSuccess: true,
              message: "You have successfully booked this activity!"
            });
            view.user.fetch();
          },
          error: function(bookedActivity, xhr) {
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
  }
});
