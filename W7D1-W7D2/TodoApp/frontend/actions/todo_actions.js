import { requestTodos, postTodo } from '../util/todo_api_util';
import { receiveErrors } from './error_actions';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = (todos) => {
  return {
    type: "RECEIVE_TODOS",
    todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: "RECEIVE_TODO",
    todo
  };
};

export const removeTodo = (todo) => {
  return {
    type: "REMOVE_TODO",
    todo
  };
};

export const fetchTodos = () => (dispatch) => {
  requestTodos().then(todos => dispatch(receiveTodos(todos)));
};

export const createTodo = (todo) => (dispatch) => {
  return postTodo(todo).then(_todo => dispatch(receiveTodo(_todo)),
    err => dispatch(receiveErrors(err.responseJSON)));
};
