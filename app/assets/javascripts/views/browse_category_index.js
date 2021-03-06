HeadOutdoors.Views.BrowseCategoryIndex = Backbone.CompositeView.extend({
  template: JST['browse_category_index'],

  initialize: function(){
    this.listenTo(this.collection, 'add', this.addBrowseCategoryIndexItemSubview);
    this.collection.each(this.addBrowseCategoryIndexItemSubview);
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({ category: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addBrowseCategoryIndexItemSubview: function(activity) {
    var searchResultItemView = new HeadOutdoors.Views.SearchResultIndexItem({
      model: activity
    });

    this.addSubview('.category-results-list', searchResultItemView);
  }

});
