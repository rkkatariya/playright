/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
        $('#userName').blur(function(event) {
                var name = $('#userName').val();
                $.get('JqueryServlet', {
                        userName : name
                }, function(responseText) {
                        $('#ajaxResponse').text(responseText);
                });
        });
});