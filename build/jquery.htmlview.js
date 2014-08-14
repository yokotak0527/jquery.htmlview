(function($) {
  return $.fn.htmlview = function(ops) {
    var _escape;
    _escape = function(str) {
      if (str && typeof str === 'string') {
        str = str.replace(/\&lt;/g, '<');
        str = str.replace(/\&gt;/g, '>');
        return str.replace(/[&<>"']/g, function($0) {
          return {
            '\&': '&#38;',
            '\<': '&#60;',
            '\>': '&#62;',
            '\"': '&#34;',
            '\'': '&#39;'
          }[$0];
        });
      }
    };
    return this.each(function() {
      $(this).html(_escape($(this).html()));
    });
  };
})(jQuery);

//# sourceMappingURL=jquery.htmlview.js.map
