/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("button[id|='view-info']").click(function() {
//        var id=$(this).closest('tr').find('td').eq(0).text();
//        alert(id);
        document.getElementById("user-id").value=$(this).closest('tr').find('td').eq(0).text();
        document.getElementById("user-detail").submit();
    });
    $("button[id|='del-user']").click(function() {
        if (confirm('Xóa user ?')) {
//            var id=$(this).closest('tr').find('td').eq(0).text();
//            alert(id);
            document.getElementById("user-id-del").value=$(this).closest('tr').find('td').eq(0).text();
            document.getElementById("delete-user").submit();
        }
    });
});