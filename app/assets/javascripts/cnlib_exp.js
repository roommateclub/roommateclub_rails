// ====== Component Network Library ======
// 
// It's an experiment project for build an uniform component
// interface for simplifying operaction of different api. It
// is based on jQuery.
// 
// Author: Bert Huang
//
// =======================================

var extractData = function(jqObj, attrMapping){
  if(!jqObj.length){
    console.log("jqObj doesn't container anything!!");
    return {};
  }

  var r = {};
  for(key in attrMapping){
    r[key] = jqObj.data(attrMapping[key]);
  }
  return r;
};

var verifiyArguments = function(data, nameList){
  for(var i=0; i<nameList.length; ++i){
    if(!(nameList[i] in data))
      return false;
  }
  return true;
};

var DataTrigger = function(component, methodName, jqObj, attrMapping){
  if(component[methodName]){
    var data = extractData(jqObj, attrMapping);
    component[methodName](data);
  }else{
    console.log("Method not found: " + methodName);
  }
};
