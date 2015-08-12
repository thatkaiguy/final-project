HeadOutdoors.Views.SearchIndex = Backbone.CompositeView.extend({
  template: JST['search_index'],

  initialize: function() {
    this.addHeaderView();
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addHeaderView: function() {
    var headerView = new HeadOutdoors.Views.AppHeader();
    this.addSubview('.header', headerView);
  }
});
