
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
    HTMLid: "malory",
    image: "img/malory.png"
};
acctList.lana = {
    HTMLid: "lana",
    image: "img/lana.png"
};
acctList.figgs =  {
    // collapsed: true,
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
    HTMLclass: "add-person",
    text: {
        "data-toggle": "modal",
        "data-target": "#addPerson"
    },
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
acctList.plus9 = {
    collapsed: true,
    parent: acctList.plus1,
    image: "img/plus-logo.png"
};
acctList.plus10 = {
    collapsed: true,
    parent: acctList.plus1,
    image: "img/plus-logo.png"
};
acctList.plus11 = {
    collapsed: true,
    parent: acctList.plus2,
    image: "img/plus-logo.png"
};
acctList.plus12 = {
    collapsed: true,
    parent: acctList.plus2,
    image: "img/plus-logo.png"
};
acctList.plus13 = {
    collapsed: true,
    parent: acctList.plus3,
    image: "img/plus-logo.png"
};
acctList.plus14 = {
    collapsed: true,
    parent: acctList.plus3,
    image: "img/plus-logo.png"
};
acctList.plus15 = {
    collapsed: true,
    parent: acctList.plus4,
    image: "img/plus-logo.png"
};
acctList.plus16 = {
    collapsed: true,
    parent: acctList.plus4,
    image: "img/plus-logo.png"
};
acctList.plus17 = {
    collapsed: true,
    parent: acctList.plus5,
    image: "img/plus-logo.png"
};
acctList.plus18 = {
    collapsed: true,
    parent: acctList.plus5,
    image: "img/plus-logo.png"
};
acctList.plus19 = {
    collapsed: true,
    parent: acctList.plus6,
    image: "img/plus-logo.png"
};
acctList.plus20 = {
    collapsed: true,
    parent: acctList.plus6,
    image: "img/plus-logo.png"
};
acctList.plus21 = {
    collapsed: true,
    parent: acctList.plus7,
    image: "img/plus-logo.png"
};
acctList.plus22 = {
    collapsed: true,
    parent: acctList.plus7,
    image: "img/plus-logo.png"
};
acctList.plus23 = {
    collapsed: true,
    parent: acctList.plus8,
    image: "img/plus-logo.png"
};
acctList.plus24 = {
    collapsed: true,
    parent: acctList.plus8,
    image: "img/plus-logo.png"
};
acctList.plus25 = {
    collapsed: true,
    parent: acctList.plus9,
    image: "img/plus-logo.png"
};
acctList.plus26 = {
    collapsed: true,
    parent: acctList.plus9,
    image: "img/plus-logo.png"
};
acctList.plus27 = {
    collapsed: true,
    parent: acctList.plus10,
    image: "img/plus-logo.png"
};
acctList.plus28 = {
    collapsed: true,
    parent: acctList.plus10,
    image: "img/plus-logo.png"
};
acctList.plus29 = {
    collapsed: true,
    parent: acctList.plus11,
    image: "img/plus-logo.png"
};
acctList.plus30 = {
    collapsed: true,
    parent: acctList.plus11,
    image: "img/plus-logo.png"
};
acctList.plus31 = {
    collapsed: true,
    parent: acctList.plus12,
    image: "img/plus-logo.png"
};
acctList.plus32 = {
    collapsed: true,
    parent: acctList.plus12,
    image: "img/plus-logo.png"
};
acctList.plus33 = {
    collapsed: true,
    parent: acctList.plus13,
    image: "img/plus-logo.png"
};
acctList.plus34 = {
    collapsed: true,
    parent: acctList.plus13,
    image: "img/plus-logo.png"
};
acctList.plus35 = {
    collapsed: true,
    parent: acctList.plus14,
    image: "img/plus-logo.png"
};
acctList.plus36 = {
    collapsed: true,
    parent: acctList.plus14,
    image: "img/plus-logo.png"
};
acctList.plus37 = {
    collapsed: true,
    parent: acctList.plus15,
    image: "img/plus-logo.png"
};
acctList.plus38 = {
    collapsed: true,
    parent: acctList.plus15,
    image: "img/plus-logo.png"
};
acctList.plus39 = {
    collapsed: true,
    parent: acctList.plus16,
    image: "img/plus-logo.png"
};
acctList.plus40 = {
    collapsed: true,
    parent: acctList.plus16,
    image: "img/plus-logo.png"
};
var chart_config = [config,
    acctList.malory,
    // acctList.lana, acctList.sterling,
    // acctList.figgs, acctList.pam, acctList.woodhouse, acctList.cheryl,
    // acctList.plus1,acctList.plus2,acctList.plus3,acctList.plus4,acctList.plus5,acctList.plus6,acctList.plus7,acctList.plus8,
    // acctList.plus9,acctList.plus10,acctList.plus11,acctList.plus12,acctList.plus13,acctList.plus14,acctList.plus15,
    // acctList.plus16,acctList.plus17,acctList.plus18,acctList.plus19,acctList.plus20,acctList.plus21,acctList.plus22,
    // acctList.plus23,acctList.plus24,acctList.plus25,acctList.plus26,acctList.plus27,acctList.plus28,acctList.plus29,
    // acctList.plus30,acctList.plus31,acctList.plus32,acctList.plus33,acctList.plus34,acctList.plus35,acctList.plus36,
    // acctList.plus37,acctList.plus38,acctList.plus39,acctList.plus40
];

console.log(chart_config);