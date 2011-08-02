$(function(){
    var client = new Faye.Client('http://10.10.5.96:9292/faye');
    client.subscribe("/incomings", function(data) {
      var a = (data.caller_number);
      var b = new String(data.caller_name);
      var c = new String($('#agentExten').text());
      var d = (data.exten_id);
      var e = (data.caller_id)
      var f = "<a href= 'http://10.10.5.104:8080/wakanow/index.php?module=Contacts&action=EditView&return_module=Contacts&return_action=index'>create contact</a>"
      var j = "<a href=" + 'http://10.10.5.104:8080/wakanow/index.php?module=Contacts&action=DetailView&record=' + e + ">" + b + "</a>"
      
      
      //var h = $("<div>").html(b).css({"font-size":"200%"});
      //var l = h.text();
      
      //console.log(l);

      
      
      if (d == c) { //this is used to check pick up the right message from the queues for the extensions 
         if (e == undefined) { //used to create a new contact where one does not exist
            $("<div>").html("Incoming call from: " + "<br>" + a + "<br>" + f).dialog({ 
              position: ['right','top'],
              draggable: false,
              modal: true,
            });   
         }
         else           
           $("<div>").html("Incoming call from: " + "<br><br>" + j + "<br>" + a).dialog({ 
             position: ['right','top'],
            draggable: false,
            modal: true,
          });   
      }
  
});   
   $('#dial').click(function(){
       sendValue($('#call').val());  
   });
   function sendValue(str){
       
       var c = new String($('#agentExten').text());
       $.post("http://10.10.5.163:3000/externcall/new/?a=" + str + "&b=" + c); } });//ajax POST request to initiate a call
