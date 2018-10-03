
// Array approach
var config = {
    container: "#collapsable-example",
    animateOnInit: true,
    node: {
        collapsable: true
    },
    animation: {
        nodeAnimation: "easeOutBounce",
        nodeSpeed: 700,
        connectorsAnimation: "bounce",
        connectorsSpeed: 700
    }
};

var acctList = function () {};

acctList.malory = {
    image: "img/malory.png"
};
acctList.lana = {
    collapsed: true,
    parent: acctList.malory,
    image: "img/lana.png"
};
acctList.figgs =  {
    collapsed: true,
    parent: acctList.lana,
    image: "img/figgs.png"
};
acctList.sterling ={
    collapsed: true,
    parent: acctList.malory,
    image: "img/sterling.png"
};
acctList.woodhouse = {
    collapsed: true,
    parent: acctList.sterling,
    image: "img/woodhouse.png"
};
acctList.pseudo = {
    collapsed: true,
    parent: acctList.malory,
    pseudo: true
};
acctList.cheryl ={
    collapsed: true,
    parent: acctList.sterling,
    image: "img/cheryl.png"
};
acctList.pam = {
    collapsed: true,
    parent: acctList.lana,
    image: "img/pam.png"
};
acctList.plus1 = {
    collapsed: true,
    parent: acctList.figgs,
    image: "img/plus-logo.png"
};
acctList.plus2 = {
    collapsed: true,
    parent: acctList.figgs,
    image: "img/plus-logo.png"
};
acctList.plus3 = {
    collapsed: true,
    parent: acctList.pam,
    image: "img/plus-logo.png"
};
acctList.plus4 = {
    collapsed: true,
    parent: acctList.pam,
    image: "img/plus-logo.png"
};
acctList.plus5 = {
    collapsed: true,
    parent: acctList.woodhouse,
    image: "img/plus-logo.png"
};
acctList.plus6 = {
    collapsed: true,
    parent: acctList.woodhouse,
    image: "img/plus-logo.png"
};
acctList.plus7 = {
    collapsed: true,
    parent: acctList.cheryl,
    image: "img/plus-logo.png"
};
acctList.plus8 = {
    collapsed: true,
    parent: acctList.cheryl,
    image: "img/plus-logo.png"
};
var chart_config = [config,
    acctList.malory,
    acctList.lana, acctList.sterling,
    acctList.figgs, acctList.pam, acctList.woodhouse, acctList.cheryl,
    acctList.plus1,acctList.plus2,acctList.plus3,acctList.plus4,acctList.plus5,acctList.plus6,acctList.plus7,acctList.plus8
];


console.log(chart_config);