BetIt.Collections.Tags = Backbone.Collection.extend({
  model: BetIt.Models.Tag,

  url: "/tags",

  getOrFetch: function (id) {
    var model = this.get(id);

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
