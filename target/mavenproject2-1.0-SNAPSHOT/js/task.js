/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    
    setMindate('task-edit-deadline');
    setMindate('task-date-add');
    setdate('task-date-add');
    
    $('#mytask-refresh').click(function(){
        $("#mytask").load( "task.jsp #mytask-table", function() {
            $("button[id|='task_edit']").click(function() {
                var id=$(this).closest('tr').find('td').eq(0).text();
               // alert('edit' + id.toString());
//               alert($(this).closest('tr').find('td').eq(1).text());
//               alert($(this).closest('tr').find('td').eq(2).text());
//               alert($(this).closest('tr').find('td').eq(3).text());
               document.getElementById("task-edit-name").value=$(this).closest('tr').find('td').eq(1).text();
               document.getElementById("task-edit-tag").value=$(this).closest('tr').find('td').eq(2).text();
               document.getElementById("task-edit-deadline").value=$(this).closest('tr').find('td').eq(3).text();
               document.getElementById("task-edit-id").value=id;
               $("#editmytask").modal();
            });
            $("button[id|='task_done']").click(function() {
                if (confirm('Hoàn thành Task ?')) {
                   document.getElementById("task-done-id").value=$(this).closest('tr').find('td').eq(0).text();
//                alert(document.getElementById("task-done-id").value);
                    document.getElementById("taskdone-form").submit(); 
                }
                
            });
            $("button[id|='task_del']").click(function() {
                if (confirm('Xóa Task ?')) {
                    var id=$(this).closest('tr').find('td').eq(0).text();
                    document.getElementById("task-del-id").value=id;
    //                alert('del' + id.toString());
    //                alert(document.getElementById("task-del-id").value);
                    document.getElementById("taskdel-form").submit();
                }
            });
        });
    });
    $('#btn-add-task').click(function(){
       
    });
    $('#mytaskdone-refresh').click(function(){
        $("#mytaskdone").load( "task.jsp #mytaskdone-table", function() {
            $("button[id|='taskdone_del']").click(function() {
                if (confirm('Xóa Task ?')) {
                    var id=$(this).closest('tr').find('td').eq(0).text();
                    document.getElementById("task-del-id").value=id;
    //                alert('del' + id.toString());
    //                alert(document.getElementById("task-del-id").value);
                    document.getElementById("taskdel-form").submit();
                }
            });
        });
    });
    clickme('mytask-refresh');
    clickme('mytaskdone-refresh');
});
function clickme(name){
    document.getElementById(name).click();
}
function setMindate(name)
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
     if(dd<10){
            dd='0'+dd;
        } 
        if(mm<10){
            mm='0'+mm;
        } 
    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById(name).setAttribute("min", today);
}
function setdate(name)
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
     if(dd<10){
            dd='0'+dd;
        } 
        if(mm<10){
            mm='0'+mm;
        } 
    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById(name).value=today;
}

















