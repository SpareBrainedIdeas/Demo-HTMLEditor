controladdin HTMLEditor
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 300;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'res/ControlAddin/Script/AngularWrapper.js';
    StartupScript = 'res/ControlAddin/Script/startup.js';

    StyleSheets = 'res/ControlAddin/StyleSheet/styles.css',
        'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css'; /* far simpler to load Fontawesome from CDN, but does require net access. */

    /* Super SUPER weird to have to treat javascript files like images. But here we are */
    Images = 'res/ControlAddin/Images/runtime.js',
        'res/ControlAddin/Images/polyfills.js',
        'res/ControlAddin/Images/main.js';

    event ControlReady();

    procedure setHTML(newHTML: Text);

    event HTMLEditor(newHTML: Text);

    event resizedControl(newheight: Integer);
    procedure resizeIFrame(newheight: Integer);
}