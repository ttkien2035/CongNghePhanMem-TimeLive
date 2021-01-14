/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function FillEditTagModal(tag,color,id){
        document.getElementById("tag-des-edit").value = tag;
        document.getElementById("tag-color-edit").value = color;
        document.getElementById("tag-id-edit").value =id;
    }
    
function FillEditTodoModal(id,des,prio,tag,date){
        document.getElementById("id-todo-edit").value =id;
        document.getElementById("todo-des-edit").value = des;
        document.getElementById("todo-prio-edit").value = prio;
        document.getElementById("todo-tag-edit").value =tag;
        document.getElementById("todo-date-edit").value =date;
}