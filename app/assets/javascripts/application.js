// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require jquery-ui
//= require activestorage
//= require turbolinks
//= require popper
//= require tether
//= require bootstrap-sprockets
//= require_tree .
//= require moment 
//= require fullcalendar
//= require fullcalendar/locale-all


// $('#calendar').fullCalendar({
    
// });

function eventCalendar() {
  return $('#event_calendar').fullCalendar({ 
    events: '/events.json'});
};
function clearCalendar() {
  $('#event_calendar').fullCalendar('delete'); // In case delete doesn't work.
  $('#event_calendar').html('');
};
$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar)

// var intialize_calendar;
// initialize_calendar = function(){
// $('.calendar').each(function(){ 
//     var calendar = $(this);
//     calendar.fullcalendar({
//       header: {
//         left: 'prev,next today',
//         center: 'title',
//         right: 'month,agendaWeek,agendaDay'
//       },
//       selectable: true,
//       selectHelper: true,
//       editable: true,
//       eventLimit: true
//     });
//   })
// };
// $(document).on('turbolinks:load', initialize_calendar);

// ,
//     events: {
//         url: '/events.json',
//         error: function() 
//         {
//             alert("error");
//          },
//             success: function()
//          {
//             console.log("successfully loaded");
//          }
//        }