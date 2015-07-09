BetIt.Collections.Bets = Backbone.Collection.extend({
  model: BetIt.Models.Bet,

  url: "/bets",

  getOrFetch: function (id) {
    model = this.get(id);

    if (!model) {
      model = new this.model({ id: id });
      model.fetch({
        success: function () {
          this.add(model);
        }.bind(this)
      });
    } else {
      model.fetch();
    }

    return model;
  }
});
