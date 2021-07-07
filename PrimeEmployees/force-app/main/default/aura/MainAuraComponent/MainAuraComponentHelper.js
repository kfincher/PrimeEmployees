({
    init : function(component, event) {
		component.set("v.Columns", [
            {label:"Name", fieldName:"Name", type: 'text'},
            {label:"ID", fieldName:"Secondary_ID__c", type:"text"},
            {label:"Special?", fieldName:"Is_Special__c", type:"boolean"},
        ]); 
        this.dataLoad(component, event);
	},
	dataLoad : function(component, event) {
		var action = component.get("c.returnAuraList");
            console.log(component.get("v.selectedValue"));
        action.setParams({
            search : component.get("v.SearchValue"),
            special : component.get("v.selectedValue")
        });
        action.setCallback(this,function(data){
            if(data.getState()==="SUCCESS"){
                var rows = data.getReturnValue();
                
            	component.set("v.Size",rows.length);
            
                var listSize = component.get("v.DisplaySize");
                var rowCols = new Array(Math.floor(rows.length/listSize)+1);
                for(var i = 0;i<rowCols.length;i++){
                    rowCols[i]= new Array();
                    for(var j = 0; j<listSize;j++){
                        if((i*listSize)+j<rows.length)
                        	rowCols[i].push(rows[(i*listSize)+j]); 
                    }
                }
                component.set("v.listIndex",0);
                component.set("v.rowCols",rowCols);
                this.setRow(component);
    		
    			if(rows.length>listSize){
                    component.set("v.nextOn",false);
                }
 				
 				var divCard = document.getElementById("ResultsDisplay");
                if(component.get("v.Size")==0){
                    divCard.innerHTML = 'No results found...' 
                }else{
                    this.updateDiv(component);
                }
            } 
            
        });
        
        $A.enqueueAction(action);
	},
    setRow : function(component){
        var index = component.get("v.listIndex");
        var rowCols = component.get("v.rowCols");
        component.set( "v.EmployeeBatch", rowCols[index] );
    },
    nextList : function(component, event){
        this.listChange(component, 1);
    },
    prevList : function(component, event){
        this.listChange(component, -1);
    },
    deleteRecords : function(component, event){
        var action = component.get("c.destroyEmployeeAura");
        action.setCallback(this,function(data){
            if(data.state==="SUCCESS"){
                
            }
        })
        $A.enqueueAction(action);
    },
    createRecords : function(component, event){
        var action = component.get("c.createEmployeeAura");
        action.setCallback(this,function(data){
            if(data.state==="SUCCESS"){
                
            }
        })
        $A.enqueueAction(action);
    },
    listChange : function(component, intVar){
        var index = component.get("v.listIndex");
        var rowCols = component.get("v.rowCols");
        index += intVar;
        
        component.set( "v.EmployeeBatch", rowCols[index] );
        component.set("v.listIndex", index);
        
        if(index>=rowCols.length-1)
            component.set("v.nextOn",true);
        else
            component.set("v.nextOn",false);
        
        if(index<=0)
            component.set("v.prevOn",true);
        else
            component.set("v.prevOn",false);
        
        
        
        this.updateDiv(component);
    },
        updateDiv : function(component){
            var divCard = document.getElementById("ResultsDisplay");
            
            divCard.innerHTML = 'Displaying results ' + 
                (component.get("v.listIndex")*component.get("v.DisplaySize") + 1) + ' - '+
                (Math.min((component.get("v.listIndex")+1)*component.get("v.DisplaySize"),component.get("v.Size")) ) + ' of '+
                component.get("v.Size");
        }
})