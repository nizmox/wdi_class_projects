$(document).ready(function () {

  //change the default underscore template settings
  _.templateSettings = {
    interpolate: /\{\{\=(.+?)\}\}/g,
    evaluate: /\{\{(.+?)\}\}/g
  };

  //display tasks on the page
  jsTodoApp.showTasks();

  //update the task to complete
  $('#tasks').on('click', '.task .task-status', function () {
    //call function to update task to completed = true
    jsTodoApp.updateTask(jsTodoApp.getTaskID(this), true);

  });

  //update the task to incomplete
  $('#completed').on('click', '.task .task-status', function () {
    //call function to update task to completed = true
    jsTodoApp.updateTask(jsTodoApp.getTaskID(this), false);
  });


  $('#container').on('click', '.task-delete', function () {
    //call the function to delete the task
    jsTodoApp.deleteTask(jsTodoApp.getTaskID(this));
  });

  //submit a new task for creation
  $('form.task_creator').on('submit', function (event) {
    event.preventDefault();

    console.log('create task');

    var $input = $('#new_task');
    var description = $input.val();
    $input.val('');
    jsTodoApp.createTask(description);
    jsTodoApp.showTasks();
    console.log(jsTodoApp.tasks);
  });
});

var jsTodoApp = {
  tasks: [],
  nextID: 0,

  //get the task ID from the relevant div based on the button clicked
  getTaskID: function (button) {
    //find the task div containing this task
    var $task = $(button).closest('.task');
    //find the task ID from the div
    var taskID = $task.attr('data-taskID');
    //return the taskID
    return taskID;
  },

  createTask: function (description) {
    $.ajax({
      url: '/tasks',
      type: 'POST',
      dataType: 'json',
      data: {task: {'description': description, 'complete': false}}
    }).done(function(task) {
      console.log("task created",task);
    });
  },

  showTasks: function () {
    // remove all tasks
    $('.task').remove();

    // fetch the html for our template from the index page
    var task_format = $('#task_template').html();
    var task_html = _.template(task_format);

    $.ajax({
      url: '/tasks',
      type: 'GET',
      dataType: 'json'
    }).done(function(tasks){
      console.log("My tasks", tasks);

      _.each(tasks, function (task) {
        // reformat dates using moment.js
        task.created_at = moment(task.created_at).calendar();
        task.updated_at = moment(task.updated_at).calendar();
        var html = task_html(task);
        if (task.complete) {
          $(html).appendTo('#completed');
        } else {
          $(html).appendTo('#tasks');
        }
      });
    });
  },

  updateTask: function (taskID, complete) {
    console.log("task update submitted");
    // submit a patch requeset to the server with completed
    $.ajax({
      url: '/tasks/' + taskID,
      type: 'PATCH',
      dataType: 'json',
      data: {'complete': complete} //'id': taskID, 
    }).done(function(task) {
      var task_format = $('#task_template').html();
      var task_html = _.template(task_format);
      // find the div on the page with the matching taskID
      var $task = $('div[data-taskid="' + taskID + '"]');
      $task.fadeOut(function(){
        $task.remove();
        var $html = task_html(task);
        if (task.complete) {
          $('#completed').prepend($html);
        } else {
          $('#tasks').prepend($html);
        }
      });
    });
  },

  deleteTask: function(taskID) {
    $.ajax({
      url: '/tasks/' + taskID,
      type: 'DELETE',
      dataType: 'json'
    }).done(function(task) {
      var $task = $('div[data-taskid="' + taskID + '"]');
      $task.fadeOut();
    });
  }
};