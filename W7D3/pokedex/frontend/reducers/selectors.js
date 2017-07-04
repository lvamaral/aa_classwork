import _ from 'lodash';

export const selectAllPokemon = state => {
  return _.values(state.pokemon);
};
