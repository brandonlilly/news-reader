NewsReader.Routers.NewsRouter = Backbone.Router.extend({
  routes: {
    '': 'feedsIndex',
    'feeds/:id': 'feedShow',
    'feeds': 'feedsIndex'
  },

  initialize: function ($rootEl) {
    this.$rootEl = $rootEl;
    this._feeds = new NewsReader.Collections.Feeds();
    console.log('router start');

  },

  feedsIndex: function () {
    this._feeds.fetch();
    var view = new NewsReader.Views.FeedIndex({ collection: this._feeds });
    this.swapView(view);
  },

  feedShow: function (id) {
    var feed = this._feeds.getOrFetch(id);
    var view = new NewsReader.Views.FeedShow({ model: feed });
    this.swapView(view);
  },

  swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
