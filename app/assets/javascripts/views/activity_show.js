HeadOutdoors.Views.ActivityShow = Backbone.CompositeView.extend({
  template: JST['activity_show'],

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function(){
    var content = this.template({ activity: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addReviewsIndexSubview: function() {

  }

});
