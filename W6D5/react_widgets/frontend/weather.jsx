import React from 'react';

class Weather extends React.Component {
  constructor(){
    super();
    this.state = {
      weather: null
    };
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.getWeather);
  }


  getWeather(location) {
    // let lat = location.coords.latitude;
    // let long = location.coords.longitude;

    let lat = "39.0392";
    let long = "125.7625";

    let url = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=f816d7f39052e3a98b21952097a43076`;
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = () => {
      if (xmlhttp.readyState === XMLHttpRequest.DONE) {
        if (xmlhttp.status === 200 ) {
          const data = JSON.parse(xmlhttp.responseText);
          this.setState({weather: data});
        } else {
          alert("error");
        }
      }
    };

    xmlhttp.open('GET', url, true);
    xmlhttp.send();
  }

  render() {
    if (this.state.weather) {
      let weather = this.state.weather;
      let temp = weather.main.temp - 273.15;
      let desc = weather.weather[0].description;
      return (
        <div className="weather">
          <h1>Best Korea Weather</h1>
          <div className="inner-div">
            <h2>Pyongyang</h2>
            <h2>best {desc}</h2>
            <h2>{Math.floor(temp)} Best degrees</h2>
          </div>
        </div>
      );
    } else {
      return (
        <div>Weather loading</div>
      );
    }
  }
}

export default Weather;
