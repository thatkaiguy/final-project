HeadOutdoors.Views.ActivityShow = Backbone.CompositeView.extend({
  template: JST['activity_show'],

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.addReviewsIndexSubview();
  },

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
    $('#raty').raty({ scoreName: 'review[num_stars]'});
    return this;
  },

  addReviewsIndexSubview: function() {
    var reviewsIndexView = new HeadOutdoors.Views.ReviewsIndex({
      collection: this.model.reviews(),
      activity: this.model
    });
    this.addSubview('.reviews-index', reviewsIndexView);
  },

  bookActivity: function(e) {
    e.preventDefault();

    if (confirm('I want to book this activity!')) {
      var frmJSON = $(e.currentTarget).serializeJSON();
      var bookedActivity = new HeadOutdoors.Models.BookedActivity();

      bookedActivity.save(frmJSON, {
        success: function() {
          alert('You have successfully booked this activity!');
        }
      });
    } else {
      // oops
    }
  }
});
