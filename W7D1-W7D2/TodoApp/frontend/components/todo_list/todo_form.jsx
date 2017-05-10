import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super();
    this.state = {  title: "", body: "", done: false };
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
    this.submit = this.submit.bind(this);
  }

  handleTitleChange(e) {
    this.setState({title: e.target.value });
  }

  handleBodyChange(e) {
    this.setState({body: e.target.value });
  }

  submit(e) {
    e.preventDefault();
    this.props.createTodo(this.state).then(
      () => this.setState({title: "", body: ""})
    );
  }

  render() {
    let errors = this.props.errors.map((error, i) => {
      return (
        <li key={i}>{i + 1}: {error}</li>
      );
    });
    return (
      <div>
        <form onSubmit={this.submit}>
          { errors }<br />
          Create Todo!<br />
          <input onChange={this.handleTitleChange}
              type="text" value={this.state.title}
              placeholder="title" /><br /><br />
          <textarea onChange={this.handleBodyChange}
              placeholder="body" value={this.state.body}></textarea><br /><br />
          <input type="submit" value="Create todo" />
        </form>
      </div>
    );
  }
}

export default TodoForm;
