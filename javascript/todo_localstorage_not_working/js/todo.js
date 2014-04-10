$(document).ready(function () {

  //setup event handler onf
  $('#tasks').on('click', '.task button', function () {
    var $task = $(this).closest('.task');

    var taskID = $task.attr('data-taskID');
    var task = jsTodoApp.tasks[taskID];
    task.completedAt = (new Date()).toString();

    console.log('you completed this task', task);

    $task.fadeOut(function () {
      jsTodoApp.showTasks();
    });
  });

  $('#completed').on('click', '.task button', function () {
    var $task = $(this).closest('.task');

    var taskID = $task.attr('data-taskID');
    var task = jsTodoApp.tasks[taskID];
    delete task.completedAt;

    console.log('you uncompleted this task', task);

    $task.fadeOut(function () {
      jsTodoApp.showTasks();
    });
  });

  $('form.task_creator').on('submit', function (event) {
    event.preventDefault();
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
  createTask: function (description) {
    var task = {
      'description': description,
      createdAt: (new Date()).toString(),
      id: this.nextID++
    };

    this.tasks.push(task);
    return task;
  },

  showTasks: function () {
    //remove all the task divs
    $('.task').remove();

    //fetch the task html code from index.html
    var task_format = $('#task_template').html();
    //generate the template function using underscore.js
    var task_html = _.template(task_format);

    // Display each of the incomplete tasks.
    _.each(jsTodoApp.tasks, function (task) {
      //use the template function to generate the html code for the 'task' object
      var html = task_html(task);
      //if the task has a completed at add it to completed, otherwise add it to tasks
      if (task.completedAt) {
        $(html).appendTo('#completed');
      } else {
        $(html).appendTo('#tasks');
      }
    });
  },

  saveAll: function () {
    if (supportsLocalStorage()) { 
      //clear local storage
      localStorage["tasks"] = [];
      //to store task JSON files
      tasks = [];
      //loop through each task and save it to local storage
      _.each(jsTodoApp.tasks, function(task) {
        var taskJSON = JSON.stringify(task);
        console.log(taskJSON);
        tasks.push(taskJSON);
      });
      //add the array to local storage
      localStorage["tasks"] = tasks;
      console.log(tasks);
      //saving successful
      return true;
    } else {
      //saving failed
      return false;
    }
  }
};


function supportsLocalStorage() {
  try {
    return 'localStorage' in window && window['localStorage'] !== null;
  } catch (e) {
    return false;
  }
}