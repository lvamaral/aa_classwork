import merge from 'lodash/merge';
import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};


const todosReducer = (state= initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.map((el) => {
        newState[el.id] = el;
      });
      return newState;
    case RECEIVE_TODO:
      let nextState = merge({}, state);
      const todo = {
        id: action.todo.id,
        title: action.todo.title,
        body: action.todo.body,
        done: action.todo.done
      };
      nextState[action.todo.id] = todo;
      return nextState;
    case REMOVE_TODO:
      let updatedState = merge({}, state);
      delete updatedState[action.todo.id];
      return updatedState;
    default:
      return state;
  }
};

export default todosReducer;
