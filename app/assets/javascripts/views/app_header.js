HeadOutdoors.Views.AppHeader = Backbone.CompositeView.extend({
  template: JST['app_header'],

  initialize: function(options) {
    this.router = options.router;
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  }
});
