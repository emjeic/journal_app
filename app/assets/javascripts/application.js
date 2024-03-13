// app/assets/javascripts/application.js
$(document).on('change', '.task-checkbox', function() {
  var taskId = $(this).val();
  var completed = $(this).prop('checked');
  $.ajax({
    url: '/tasks/' + taskId,
    type: 'PATCH',
    data: { task: { completed: completed } },
    success: function(response) {
      // Handle success, if needed
      console.log('Task status updated successfully.');
    },
    error: function(xhr, status, error) {
      // Handle error, if needed
      console.error('Error updating task status:', error);
    }
  });
});

  