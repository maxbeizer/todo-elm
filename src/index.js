import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

var isArrayOfStrings = function(array) {
  return Array.isArray(array) && array.every(function(element) {
    return typeof element === 'string';
  });
};

var getTodos = function() {
  var todos = JSON.parse(localStorage.todos || '[]') || [];
  return isArrayOfStrings(todos) ? todos : [];
};

var app = Main.fullscreen({
  todos: getTodos()
});

app.ports.saveTodos.subscribe(function(todos) {
  localStorage.todos = JSON.stringify(todos);
});

registerServiceWorker();
