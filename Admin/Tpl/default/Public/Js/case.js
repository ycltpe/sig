/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//********************************************************
//级联动 下拉列表显示,城市,商圈,区域等                     *
//********************************************************

$(function(){
    getBigClass();
    $("#bigcateid").change(function(){
        getSmallClass();        
    });

    function getBigClass()
    {
        var a=$("#old_bigcateid").val();
        $.getJSON(URL+"/getBigClass", function(data) {
            $.each(data, function(i, item) {
                if(a==item['id']){
                    $("#bigcateid").append("<option value='"+item['id']+"' selected='selected'>"+item['catename']+"</option>");
                }else{
                    $("<option></option>").val(item['id']).text(item['catename']).appendTo($("#bigcateid"));
                }
            });
            getSmallClass();
        });
        $("<option></option>").val('').text('请选择...').appendTo($("#bigcateid"));
    }

    function getSmallClass()
    {
        var a=$("#old_smallcateid").val();
        $("#smallcateid").empty();
        $.getJSON(URL+"/getSmallClass",  {
            cate_id:$("#bigcateid").val()
        }, function(data) {
            $.each(data, function(i, item) {
                if(a==item['id']){
                    $("#smallcateid").append("<option value='"+item['id']+"' selected='selected'>"+item['catename']+"</option>");
                }else{
                    $("<option></option>").val(item['id']).text(item['catename']).appendTo($("#smallcateid"));
                }
            });
        });
        $("<option></option>").val('').text('请选择...').appendTo($("#smallcateid"));
    }


});

