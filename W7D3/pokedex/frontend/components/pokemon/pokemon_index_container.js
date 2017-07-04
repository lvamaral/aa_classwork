import { connect } from 'react-redux';
import * as Actions from '../../actions/pokemon_actions';
import { selectAllPokemon } from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(Actions.requestAllPokemon())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps)(PokemonIndex);
