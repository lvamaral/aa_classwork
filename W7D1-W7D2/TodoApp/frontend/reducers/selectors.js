export const allTodos = ({ todos }) => {
  return Object.keys(todos).map(id => todos[id]);
};

export const stepsByTodoId = ({state, todoId}) => {
};
