// main.js is used only for settings and initializing application,
// all heavy logic is stored inside proper modules, it makes it
// easy to require core modules from inside the application and
// also keeps main.js small since settings adds too much noise
// to the real code.
//
// see: http://blog.millermedeiros.com/2011/05/single-entry-point-ftw/


// SETTINGS ========

require.config({
    paths : {
        'jquery' : 'lib/jquery/jquery'
    }
});


// INIT APP ========

define(
    [
        // "require" as depencency so paths are relative to
        // current context
        'require',
        'jquery',
        'someOtherModuleUsedByAllPages'
    ],
    function(require, $, someSharedModule){

        function init(){
            // if metadata on HTML grab it and do a require
            // body have a `data-modules="foo, bar/ipsum, dolor"`
            var modules = $('body').data('modules') || '';
            if(modules){
                require(modules.split(/\s*,\s*/), function(){
                    // do something when they finish loading, I usually
                    // make this kind of module to auto-instantiate,
                    // so we wouldn't need to do anything here
                });
            }

            // depending on the project it may be better to simply try
            // to match a className instead of adding each module to
            // a data-attribute:
            if( $('.my-awesome-calendar').length ){
                require(['widgets/myAwesomeCalendar']);
            }

            someSharedModule.init();
        }

        // if you use URLs to find modules there is no need to wait
        // for DOM-ready to start loading modules if you have too
        // many paths it is better to create some sort of look-up
        // table or use a routing system like crossroads.js to
        // simplify the logic
        switch(document.location.pathname){
            case '/foo':
                require(['sections/foo/main'], initSection);
                break;
            case '/foo/bar':
                require(['sections/foo/main'], initSection);
                break;
            default:
                //let's just assume we have a lot of pages with common features
                require(['sections/simplePage'], initSection);
        }

        function initSection(section){
            section.init();
        }

        //init app on domready
        $(document).ready(init);
    }
);