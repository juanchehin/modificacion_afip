/*
    Funcion para buscar elementos por ID en DOM con compatibilidad
    cross-browser.
*/
function ObjectFinder(elemID) {
    var obj;

    if (document.all) {
        obj = document.all(elemID);
    } else if (document.getElementById) {
        obj = document.getElementById(elemID.replace(/[$]/g,'_'));
    } else if (document.layers) {
        obj = document.layers[elemID];
    }
    return obj;
}