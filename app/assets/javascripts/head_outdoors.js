window.HeadOutdoors = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new HeadOutdoors.Routers.Router({
      $rootEl: $('.head-outdoors-app')
    });
    Backbone.history.start();
  }
};

// $(document).ready(function(){
//   HeadOutdoors.initialize();
// });
