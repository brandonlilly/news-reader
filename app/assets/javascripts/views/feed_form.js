NewsReader.Views.FeedForm = Backbone.View.extend({
  template: JST["feed_form"],
  tagName: 'form',

  events: {
    'click button.create-feed': 'createFeed'
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  createFeed: function (event) {
    event.preventDefault();
    var attributes = this.$el.serializeJSON();
    var feed = new NewsReader.Models.Feed();
    feed.save(attributes, {
      success: function (response) {
        this.collection.add(feed);
      }.bind(this)
    });
  }
});
