(function (){
    'use strict';

    angular
        .module('backToTop')
        .component('gmBackToTop', {

            controller: 'backToTopController',

           template:  '<div>' +
                       ' <button class = "{{$ctrl.style}}" ' +
                       ' ng-class="$ctrl.startedScrolling" type="button" ng-click="$ctrl.goToTop()">' +
                       '   <i id = "arrowIcon" class="material-icons">keyboard_arrow_up</i>' +
                       '</button>' +
                       '</div>',
                       
            bindings: {
                        gmspeed: '<',
                        gmstyle: '@'
                      }
        })

})();
