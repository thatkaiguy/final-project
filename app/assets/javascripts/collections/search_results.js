HeadOutdoors.Collections.SearchResults = Backbone.Collection.extend({
  url: '/api/searches',

  model: HeadOutdoors.Models.Activity
});
