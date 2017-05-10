import merge from 'lodash/merge';
import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from '../actions/step_actions';

const stepsReducer = (state= {}, action) => {
  switch(action.type) {
    case RECEIVE_STEPS:
      const newState = {};
      action.steps.map((el) => {
        newState[el.id] = el;
      });
      return newState;
    case RECEIVE_STEP:
      let nextState = merge({}, state);
      const step = {
        id: action.step.id,
        title: action.step.title,
        body: action.step.todo_id,
        done: action.step.done
      };
      nextState[action.step.id] = step;
      return nextState;
    case REMOVE_STEP:
      let updatedState = merge({}, state);
      delete updatedState[action.step.id];
      return updatedState;
    default:
      return state;
  }
};

export default stepsReducer;
