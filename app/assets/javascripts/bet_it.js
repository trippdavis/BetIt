window.BetIt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new BetIt.Routers.App({ $rootEl: $("#content") });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  BetIt.initialize();
});
