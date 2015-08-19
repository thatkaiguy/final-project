HeadOutdoors.Collections.Reviews = Backbone.Collection.extend({
  url: '/api/reviews',

  model: HeadOutdoors.Models.Review,

  avgRating: function() {
    var avgNumStars = 0;
    var sumNumStars = 0;

    this.each(function(review) {
      sumNumStars += parseFloat(review.get('num_stars'));
    });

    avgNumStars = sumNumStars / this.length;
    return avgNumStars;
  }
});
