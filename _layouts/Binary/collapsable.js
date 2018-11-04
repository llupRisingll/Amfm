var config = {
    container: "#collapsable-example",
    node: { collapsable: true },
    animation: {
        nodeSpeed: 100,
        connectorsSpeed: 100
    }
};

var acctList = function () {};

acctList.malory = {
    HTMLid: "malory",
    image: "img/person_icon.png"
};
acctList.lana = {
    parent: acctList.malory,
    collapsed: true,
    HTMLid: "lana",
    image: "img/person_icon.png"
};
acctList.figgs =  {
    // collapsed: true,
    image: "img/person_icon.png"
};

acctList.plus = {
    image: "img/plus-logo.png",
	HTMLclass: "add-person",
	text: {
		"data-toggle": "modal",
		"data-target": "#addPerson"
	},
};

