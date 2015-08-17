HeadOutdoors.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profile_show'],

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    var content = this.template({
      user: this.model,
      activities: this.collection
    });
    this.$el.html(content);
    this.attachSubviews();

    return this;
  }
});
