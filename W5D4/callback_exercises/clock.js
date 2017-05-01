class Clock {
  constructor() {
    this.startTime = new Date;
    this.hours = this.startTime.getHours();
    this.minutes = this.startTime.getMinutes();
    this.seconds = this.startTime.getSeconds();
    this.printTime();
    setInterval(this._tick.bind(this), 1000);

  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

//   _tick() {
//     if (this.seconds < 59) {
//       this.seconds += 1;
//     } else if (this.seconds === 60) {
//       this.seconds = 0;
//       this.minutes += 1;
//     } else if (this.minutes === 60) {
//       this.minutes = 0;
//       this.hours += 1;
//     } else if (this.hours === 24) {
//       this.hours = 0;
//     }
//     this.printTime();
//   }
// }

  _tick() {
    let newSeconds = (this.seconds + 1) % 60;
    this.seconds += 1;

    if (newSeconds === 0) {
      this.seconds = 0;
      this.minutes += 1;
    }
    let newMinutes = (this.minutes) % 60;
    if (newMinutes === 0 && this.seconds === 0) {
      this.minutes = 0;
      this.hours += 1;
    }
    let newHours = (this.hours) % 24;
    if (newHours === 0) {
      this.hours = 0;
    }
    this.printTime();
  }
}

const clock = new Clock();
