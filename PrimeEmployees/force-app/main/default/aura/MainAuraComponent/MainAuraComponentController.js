({
    myAction : function(component, event, helper) {
		helper.dataLoad(component, event);
	},
	init : function(component, event, helper) {
		helper.init(component, event);
	},
    nextList : function(component, event, helper) {
        helper.nextList(component, event);
    },
    prevList : function(component, event, helper) {
        helper.prevList(component, event);
    },
    createRecords : function(component, event, helper) {
        console.log('attempted to create');
        helper.createRecords(component, event);
    },
    deleteRecords : function(component, event, helper) {
        console.log('attempted to destroy');
        helper.deleteRecords(component, event);
    },
})