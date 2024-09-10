/*
    Funciones para mostrar ToolTips Rápidos sobre objetos
*/
var TTR_objTgtId;

document.write('<div style="position:absolute;z-index:9999;visibility:hidden;" id="TTRPrevDiv">');
document.write('<div style="width:100px;height:100px;background-color:#334499">');
document.write('&nbsp;</div></div>');

function TTR_ShowPreview(targetId) {
    TTR_objTgtId=targetId;
    document.onmousemove=TTR_SeguirMouse
}
function TTR_HidePreview() {
    ObjectFinder("TTRPrevDiv").style.visibility='hidden';
    document.onmousemove=null;
}

function TTR_SeguirMouse(e){
    var xcoord=-5;
    var ycoord=18;
    if (typeof e != "undefined"){
        xcoord+=e.pageX
        ycoord+=e.pageY
    } else if (typeof window.event !="undefined"){
        xcoord+=TTR_truebody().scrollLeft+event.clientX;
        ycoord+=TTR_truebody().scrollTop+event.clientY;
    }
    
    ObjectFinder("TTRPrevDiv").style.visibility='visible';
    ObjectFinder("TTRPrevDiv").innerHTML=TTR_getDivContent();
    ObjectFinder("TTRPrevDiv").style.left=xcoord+"px";
    ObjectFinder("TTRPrevDiv").style.top=ycoord+"px";
}

function TTR_getDivObject(){
    return ObjectFinder(TTR_objTgtId);
}

function TTR_getDivContent(){
    return '<div class="TTRPreviewDiv">' + 
           TTR_getDivObject().innerHTML +
           '</div>';
}

function TTR_truebody(){
    return (!window.opera && document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function TTR_ActivarDivs(obj,delay){
    setTimeout("TTR_ActivarDivs(ObjectFinder("+obj+"))", delay);
}

function TTR_ActivarDiv(obj){
    obj.style.visibility = 'visible';
}