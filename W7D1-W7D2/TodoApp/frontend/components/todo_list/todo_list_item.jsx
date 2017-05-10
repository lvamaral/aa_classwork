import React from 'react';
import TodoDetailView from './todo_detail_view';

class Item extends React.Component {
  constructor(props) {
    super();
    this.updateTodo = this.updateTodo.bind(this);
    this.toggleHidden = this.toggleHidden.bind(this);

    this.state = { hidden: false };
  }

  updateTodo(e) {
    e.preventDefault();
    if (this.props.item.done === true) {
      this.props.item.done = false;
    } else if (this.props.item.done === false) {
      this.props.item.done = true;
    }
    this.props.receiveTodo(this.props.item);
  }

  toggleHidden(e) {
    e.preventDefault();
    const toggleBool = this.state.hidden ? false : true;
    this.setState({ hidden: toggleBool });
  }

  render() {
    let view = null;
    if (this.state.hidden) {
      view = <TodoDetailView item={this.props.item} removeTodo={this.props.removeTodo} />;
    }
    return (
      <div className="list-item">
        <h3 onClick={this.toggleHidden}>
          {this.props.item.title}
        </h3>
        {view}<br></br>
        <button onClick={this.updateTodo}>
          {this.props.item.done ? "Undo" : "Done"}
        </button>

      </div>
    );
  }
}


export default Item;
