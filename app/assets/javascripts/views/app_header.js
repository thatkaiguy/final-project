HeadOutdoors.Views.AppHeader = Backbone.CompositeView.extend({
  template: JST['app_header'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  }
});
