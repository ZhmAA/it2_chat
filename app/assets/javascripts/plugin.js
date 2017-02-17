$.ajax({
   url: 'https://athletic-events.com/races/638/timeline',
   data: {
     format: 'html'
   },
   error: function() {
     $('#container').html('<p>An error has occurred</p>');
   },
   success: function(data) {
     var result = $(data).find('div#results'); 
     $('#container').html(result);
   },
   type: 'GET'
});