export const requestTodos = () => {
  return $.ajax({
  url: "api/todos",
  method: 'GET'
  });
};

export const postTodo = (todo) => {
  return $.ajax({
    url: "api/todos",
    method: 'POST',
    data: {todo}
  });
};
