/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function deletert(id){
        if (confirm('Bạn có chắc muốn xóa?')){
            location.assign('DeleteRoutine?rid='+id);
        }
    }
function fillformEditRt(id,des){
    document.getElementById("routine-edit-frm").value = des;
    document.getElementById("routine-edit-id").value = id;
}
function deleteactivity(id){
        if (confirm('Bạn có chắc muốn xóa?')){
            location.assign('DeleteActivity?acid='+id);
        }
    }
function fillformEditActivity(idrou,act,timebegin,timeend,idatv){
    document.getElementById("activity-edit-idatv").value = idatv;
    document.getElementById("activity-atv-edit").value = act;
    document.getElementById("activity_timebegin_edit").value = timebegin;
    document.getElementById("activity_timeend-edit").value = timeend;
}