var Tree;

$.fn.tree = function(option, value) {
  var $set;
  $set = this.each(function() {
    var $this, data, methodReturn, options;
    $this = $(this);
    data = $this.data('tree');
    options = typeof option === 'object' && option;
    if (!data) {
      $this.data('tree', (data = new Tree(this, options)));
    }
    if (typeof option === 'string') {
      return methodReturn = data[option](value);
    }
  });
  return typeof methodReturn !== "undefined" && methodReturn !== null ? methodReturn : $set;
};

$.fn.tree.Constructor = Tree;

$.fn.tree.defaults = {
  multiSelect: false,
  loadingHTML: '<div>Loading...</div>',
  cashedItems: true
};

Tree = (function() {

  function Tree(element, options) {
    this.$element = $(element);
    this.options = $.extend({}, $.fn.tree.defaults, options);
    this.$element.on("click", ".tree-item", $.proxy(function(ev) {
      return this.selectItem(ev.currentTarget);
    }, this));
    this.$element.on("click", ".tree-folder-header", $.proxy(function(ev) {
      return this.selectFolder(ev.currentTarget);
    }, this));
    this.render();
  }

  Tree.prototype.render = function() {
    return this.populate(this.$element);
  };

  Tree.prototype.populate = function($el) {
    var loader, self;
    self = this;
    loader = $el.parent().find(".tree-loader:eq(0)");
    loader.show();
    return this.options.dataSource.data($el.data(), function(items) {
      loader.hide();
      $.each(items.data, function(index, value) {
        var $entity;
        $entity = void 0;
        if (value.type === "folder") {
          $entity = self.$element.find(".tree-folder:eq(0)").clone().show();
          $entity.find(".tree-folder-name").html(value.name);
          $entity.find(".tree-loader").html(self.options.loadingHTML);
          $entity.find(".tree-folder-header").data(value);
        } else if (value.type === "item") {
          $entity = self.$element.find(".tree-item:eq(0)").clone().show();
          $entity.find(".tree-item-name").html(value.name);
          $entity.data(value);
        }
        if ($el.hasClass("tree-folder-header")) {
          return $el.parent().find(".tree-folder-content:eq(0)").append($entity);
        } else {
          return $el.append($entity);
        }
      });
      return self.$element.trigger("loaded");
    });
  };

  Tree.prototype.selectItem = function(el) {
    var $all, $el, data;
    $el = $(el);
    $all = this.$element.find(".tree-selected");
    data = [];
    if (this.options.multiSelect) {
      $.each($all, function(index, value) {
        var $val;
        $val = $(value);
        if ($val[0] !== $el[0]) {
          return data.push($(value).data());
        }
      });
    } else if ($all[0] !== $el[0]) {
      $all.removeClass("tree-selected").find("i").removeClass("icon-ok").addClass("tree-dot");
      data.push($el.data());
    }
    if ($el.hasClass("tree-selected")) {
      $el.removeClass("tree-selected");
      $el.find("i").removeClass("icon-ok").addClass("tree-dot");
    } else {
      $el.addClass("tree-selected");
      $el.find("i").removeClass("tree-dot").addClass("icon-ok");
      if (this.options.multiSelect) {
        data.push($el.data());
      }
    }
    if (data.length) {
      return this.$element.trigger("selected", {
        info: data
      });
    }
  };

  Tree.prototype.selectFolder = function(el) {
    var $el, $par;
    $el = $(el);
    $par = $el.parent();
    if ($el.find(".glyphicon-folder-close").length) {
      if ($par.find(".tree-folder-content").children().length) {
        $par.find(".tree-folder-content:eq(0)").show();
      } else {
        this.populate($el);
      }
      $par.find(".glyphicon-folder-close:eq(0)").removeClass("glyphicon-folder-close").addClass("glyphicon-folder-open");
      return this.$element.trigger("opened", $el.data());
    } else {
      if (this.options.cacheItems) {
        $par.find(".tree-folder-content:eq(0)").hide();
      } else {
        $par.find(".tree-folder-content:eq(0)").empty();
      }
      $par.find(".glyphicon-folder-open:eq(0)").removeClass("glyphicon-folder-open").addClass("glyphicon-folder-close");
      return this.$element.trigger("closed", $el.data());
    }
  };

  Tree.prototype.selectedItems = function() {
    var $sel, data;
    $sel = this.$element.find(".tree-selected");
    data = [];
    $.each($sel, function(index, value) {
      return data.push($(value).data());
    });
    return data;
  };

  return Tree;

})();