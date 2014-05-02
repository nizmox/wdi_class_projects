BlogAjax.Models.Comment = Backbone.Model.extend({
  // urlRoot: '/posts/:id/comments', //FIX ME
  urlRoot: function (post_id) {
    var url = ['/posts', this.get('post_id'), 'comments'].join('/');
    debugger;
    return url;
  },
  defaults: {
    post_id: null,
    author: 'Some Author',
    content: 'Cool post, bro'
  }
});
