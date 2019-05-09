(function(){
  'use strict';

  angular
    .module('backToTop')
    .run(runBlock);

  /** @ngInject */
  function runBlock($log) {

    $log.debug('backToTop module loaded');
  }

})();
