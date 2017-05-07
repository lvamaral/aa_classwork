import React from 'react';

class AutoComplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ""
    };
  }

  matches() {
    const matches = [];

    if(this.state.inputVal.length === 0) {
      return this.props.names;
    }

    this.props.names.forEach((name) => {
      let sub = name.slice(0, this.state.inputVal.length);
      if(sub.toLowerCase() === this.state.inputVal.toLowerCase()) {
        matches.push(name);
      }
    });

    if(matches.length === 0) {
      matches.push("NO MATCHES");
    }
    return matches;
  }

  render() {
    return (
      <div>
        <h1>Best Korea Search</h1>
        <input type="text"></input>
        <ul>
          <li>

          </li>
        </ul>
      </div>
    );
  }
}

export default AutoComplete;
