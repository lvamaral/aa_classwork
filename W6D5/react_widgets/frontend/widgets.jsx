import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Weather from './weather';
import AutoComplete from './autocomplete';

const bestNames = [
  "Kim Jong-un",
  "Supreme Leader Kim Jong-un",
  "Best Supreme Leader Kim Jong-un",
  "Big Daddy KJ-U",
  "Supreme God of Best Korea"
];

class Root extends React.Component {
  render() {
    return(
      <div>
        <Clock />
        <Weather />
        <AutoComplete names={bestNames} />
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root />, document.getElementById('main'));
});
