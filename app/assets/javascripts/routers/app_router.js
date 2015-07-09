BetIt.Routers.App = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "landing"
  },

  landing: function () {
    var view = new BetIt.Views.Landing();
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
