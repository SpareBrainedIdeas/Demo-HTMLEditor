function init() {
    var div = document.getElementById('controlAddIn');
    div.innerHTML += '<app-root></app-root>';

    //Dynamically load the 3 angular Dist JS files.
    var runtimeUrl = Microsoft.Dynamics.NAV.GetImageResource('runtime.js');
    var polyfillUrl = Microsoft.Dynamics.NAV.GetImageResource('polyfills.js');;
    var mainUrl = Microsoft.Dynamics.NAV.GetImageResource('main.js');;

    //Something is wrong with GetImageResource, so we have to manually add the subfolder name Images
    runtimeUrl = runtimeUrl.replace('runtime.js','res/ControlAddin/Images/runtime.js');
    polyfillUrl = polyfillUrl.replace('polyfills.js','res/ControlAddin/Images/polyfills.js');
    mainUrl = mainUrl.replace('main.js','res/ControlAddin/Images/main.js');

    var runtimeScript = document.createElement('script');
    runtimeScript.onload = function () {
        //waiting for runtime to load before loading Poly

        var polyfillScript = document.createElement('script');
        polyfillScript.onload = function () {
            //waiting for poly to load before loading Main
            var mainScript = document.createElement('script');
            mainScript.onload = function () {
                //do stuff with the script as needed
            };
            mainScript.src = mainUrl;
            document.head.appendChild(mainScript);
        };
        polyfillScript.src = polyfillUrl;
        document.head.appendChild(polyfillScript);
    };
    runtimeScript.src = runtimeUrl;
    document.head.appendChild(runtimeScript);
}

function setHTML(storedHTML) {
    window.angularHTMLEditor.zone.run(() => {window.angularHTMLEditor.setHTML(storedHTML);});   
}

function resizeIFrame(newheight) {
    var frameEl = window.frameElement;
    if (frameEl) {
        frameEl.style["height"] = newheight + "px";
        frameEl.style["min-height"] = newheight + "px";
        frameEl.style["max-height"] = newheight + "px";
    } 
}