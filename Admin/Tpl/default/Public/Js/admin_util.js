/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function detail(id){
    location.href = URL+"/detail/id/"+id;
}

//删除全部
function deleteAll(id){
    var keyValue;
    if (id) {
        keyValue = id;
    }else {
        keyValue = getSelectCheckboxValues();
    }
    if (!keyValue) {
        alert('请选择删除项！');
        return false;
    }
    if (window.confirm('确实要永久删除选择项吗？')) {
        ThinkAjax.send(URL+"/deleteAll/","keyValue="+keyValue+'&ajax=1',doDelete);
    }
}

function delList(id){
    var keyValue;
    if (id) {
        keyValue = id;
    }else {
        keyValue = getSelectCheckboxValues();
    }
    if (!keyValue) {
        alert('请选择删除项！');
        return false;
    }
    if (window.confirm('确实要永久删除选择项吗？')) {
        $.ajax({
            type:"POST",
            url: URL+"/deleteAll",
            data:({
                keyValue:keyValue
            }),

            success: function(data) {
                if(data){
                        var aas=new Array();
                        aas=keyValue.split(",");                                                
                        for(var i=0;i<aas.length;i++){ 
                            $('#vid_'+aas[i]).remove(); 
                        }            
                }
            }
        });
    }
}

//大类下的子分类列表
function under(id){
    location.href = URL+"/underlist/id/"+id;
}

//添加大类下面的小类
function addSmallClass(id){
    if (id){
        location.href  = URL+"/addSmall/id/"+id;
    }else{
        alert('参数传递失败！')
    }
}
//添加大类下面的小类
function editSmallClass(id){
    if (id){
        location.href  = URL+"/editSmall/id/"+id;
    }else{
        alert('参数传递失败！')
    }
}



