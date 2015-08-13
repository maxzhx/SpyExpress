 function checkEvent(name, allCheckId) {  
                var allCk = document.getElementById(allCheckId);  
                if (allCk.checked == true) checkAll(name);  
                else checkAllNo(name);  
  
            }  
  
            //ȫѡ  
            function checkAll(name) { 
            	var el = document.getElementsByTagName('input');
                var len = el.length;
                for(var i=0; i<len; i++)
                {
                    if((el[i].type=="checkbox") && (el[i].name==name))
                    {
                        el[i].checked = true;
                        el[i].dummy.className = "NFCheck NFh";
                    }
                }  
            }  
  
            //ȫ��ѡ  
            function checkAllNo(name) {  
            	
            	var el = document.getElementsByTagName('input');
                var len = el.length;
                for(var i=0; i<len; i++)
                {
                    if((el[i].type=="checkbox") && (el[i].name==name))
                    {
                        el[i].checked = false;
                        el[i].dummy.className = "NFCheck";
                    }
                }  
            }  
  
            //��ѡ  
            function reserveCheck(name) {  
            	var el = document.getElementsByTagName('input');
                var len = el.length;
                for(var i=0; i<len; i++)
                {
                    if((el[i].type=="checkbox") && (el[i].name==name))
                    {
                    	 if (el[i].checked) {el[i].checked = false;el[i].dummy.className = "NFCheck";}
                         else {el[i].checked = true;el[i].dummy.className = "NFCheck NFh";}
                    }
                }  
            }  