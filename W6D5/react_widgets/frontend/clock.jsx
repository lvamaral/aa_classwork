import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    const current = new Date();
    const bestTime = current.getTime() + 15.5 * 60 * 60 * 1000;
    this.state = {time: new Date(bestTime)};
    this.tick = this.tick.bind(this);
  }

  tick() {
    let current = new Date();
    let bestTime = current.getTime() + 15.5 * 60 * 60 * 1000;
    this.setState({time: new Date(bestTime)});
  }

  render() {
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();

    let month = `${this.state.time.getMonth()}`;
    let day = `${this.state.time.getDay()}`;
    let year = "1955";

    hours = hours < 10 ? `0${hours}` : `${hours}`;
    minutes = minutes < 10 ? `0${minutes}` : `${minutes}`;
    seconds = seconds < 10 ? `0${seconds}` : `${seconds}`;

    return (
      <div className="clock">
        <h1>Best Korea Clock</h1>
        <div className="inner-div">
          <h2>Best Pyongyang Local Time</h2>
          <h2>{hours}:{minutes}:{seconds}</h2>
        </div>
        <div className="inner-div">
          <h2>Best Supreme Korea Date</h2>
          <h2>{year}-{month}-{day}</h2>
        </div>
      </div>
    );


  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    this.intervalId.clearInterval();
  }
}


export default Clock;
