import React from 'react';

class PokemonIndexItem extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    return (
      <li id={this.props.pokemon.id}>
        <span>
          {this.props.pokemon.id}
        </span>
        <img src={this.props.pokemon.image_url}></img>
        <span>
          {this.props.pokemon.name}
        </span>
      </li>
    );
  }
}

export default PokemonIndexItem;
