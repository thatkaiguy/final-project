window.HeadOutdoors = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
   var router = new HeadOutdoors.Routers.Router({
      $rootEl: $('.head-outdoors-app')
    });

    var nav = new HeadOutdoors.Views.AppHeader({
      router: router
    });

    $('div.app-header').html(nav.render().$el);
    Backbone.history.start();
  }
};
