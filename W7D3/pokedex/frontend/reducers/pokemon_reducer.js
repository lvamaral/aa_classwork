import * as Actions from '../actions/pokemon_actions';

const pokemonReducer = (state= {}, action) => {
  switch (action.type) {
    case Actions.RECEIVE_ALL_POKEMON:
      return action.pokemon;
    default:
      return state;
  }
};

export default pokemonReducer;
