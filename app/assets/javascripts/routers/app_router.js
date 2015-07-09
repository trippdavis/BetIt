BetIt.Routers.App = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.bets = new BetIt.Collections.Bets();
    this.tags = new BetIt.Collections.Tags();
  },

  routes: {
    "": "betsIndex"
  },

  betsIndex: function () {
    this.bets.fetch();
    var view = new BetIt.Views.BetsIndex({
      collection: this.bets
    });
    this._swapView(view);
  },

  _swapView: function (view) {
    if (this.currentView) {
      this.currentView.remove();
    }

    this.$rootEl.html(view.render().$el);
    this.currentView = view;
  }
});
