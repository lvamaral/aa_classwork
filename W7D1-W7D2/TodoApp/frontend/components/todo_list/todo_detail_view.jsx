import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props) {
    super();
    this.deleteTodo = this.deleteTodo.bind(this);
  }

  deleteTodo(e) {
    e.preventDefault();
    this.props.removeTodo(this.props.item);
  }

  render() {
    return (
      <div>
        <span>
          {this.props.item.body}
        </span>
        <button onClick={this.deleteTodo}>Delete Todo</button>
      </div>
    );
  }
}

export default TodoDetailView;
