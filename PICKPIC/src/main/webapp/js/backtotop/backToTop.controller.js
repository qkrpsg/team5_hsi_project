(function (){
    'use strict';

    function didIReachTheTop() {

        return (this.pixelsScrolledToTop <= 0);
    }

    function returnVelocity() {

        var inc = Math.PI / (this.gmspeed / 10);
        var velocity = this.pixelsScrolledToTop * (0.5 - 0.5 * Math.cos(this.count * inc));

        return velocity;
    }

    function stopScrolling(scrollFn) {
        this.window.scrollTo(0, 0)
        this.interval.cancel(scrollFn);
    }

    function configDefaults() {
        this.style = this.gmstyle || "md-fab md-fab-bottom-right md-button md-ink-ripple docs-scroll-fab";
        this.gmspeed = this.gmspeed || 500;
    }

      /** @ngInject */
    angular
        .module('backToTop')
        .controller('backToTopController', function ($window, $scope, $document, $interval) {

            var that = this;
            that.interval = $interval;
            that.window = $window;
            that.scope = $scope;
            that.pixelsScrolledToTop = 0;
            that.count = 0;

            configDefaults.call(that);

            that.startedScrolling = 'hideBackToTop';

            that.window.addEventListener("scroll", function (event) {

                that.pixelsScrolledToTop = angular.element(that.window).scrollTop();

                that.scope.$apply(function () {

                    that.startedScrolling = (that.pixelsScrolledToTop > 0 ? 'showBackToTop' : 'hideBackToTop');
                });

            });



            this.goToTop = function () {

                that.count = 0;

                (function scrollToTop() {

                    that.count++;

                    if (didIReachTheTop.call(that)) {

                        stopScrolling.call(that, scroll);
                    }

                    else {

                        that.pixelsScrolledToTop -= returnVelocity.call(that);
                        window.scrollTo(0, that.pixelsScrolledToTop)
                        setTimeout(scrollToTop, 10);

                    }

                })();
            }
        }

        )

})();
