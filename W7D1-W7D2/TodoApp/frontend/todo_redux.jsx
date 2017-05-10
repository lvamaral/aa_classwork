import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { allTodos } from './reducers/selectors';
import { receiveTodos, receiveTodo, fetchTodos } from './actions/todo_actions';
import Root from './components/root';


const store = configureStore();

window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.fetchTodos = fetchTodos;

const all = allTodos(store.getState());
window.all = all;

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
});
