import React from 'react';
import Item from './todo_list_item';
import TodoForm from './todo_form';
import uniqueId from '../../util/unique_id';

class TodoList extends React.Component {
  constructor(props) {
    super();
  }

  componentDidMount() {
    this.props.fetchTodos();
  }


  render() {
  const TodoListItems = this.props.todos.map((item, idx) => (
      <Item key={idx} item={item} removeTodo={this.props.removeTodo}
          receiveTodo = {this.props.receiveTodo} />
  ));
  return (
    <div className="list">
        <h1>My Todo List 💖</h1>
        <h2>By: PreTtyPriNc3ssXo95</h2>
        <ul className="list-items">
          {TodoListItems}
        </ul>
        <TodoForm createTodo={this.props.createTodo}
            errors={this.props.errors}/>
    </div>
  );
  }
}

export default TodoList;
