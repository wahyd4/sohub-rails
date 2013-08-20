$(document).ready(function () {
    setTimeout(function () {

        var opened = window.open('about:blank', '_self');
        opened.opener = null;
        opened.close();
    }, 3 * 1000);
});