HeadOutdoors.Views.AppHeader = Backbone.CompositeView.extend({
  template: JST['app_header'],

  tagName: 'nav',

  className: 'navbar navbar-default navbar-fixed-top head-outdoors-nav',

  id: 'bootstrap-overrides',

  initialize: function(options) {
    this.router = options.router;
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  }
});
