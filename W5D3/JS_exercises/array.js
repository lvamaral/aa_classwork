
function uniq (array) {
  const uniques = [];

  for(let i = 0; i < array.length; i++) {
    if(uniques.includes(array[i])) {
      continue;
    }
    uniques.push(array[i]);
  }
  return uniques;
}

function twoSum (array) {
  const zeroes = [];

  for (let i = 0; i < array.length; i++) {
    for (let j = i+1; j < array.length; j++) {
      if (array[i] + array[j] === 0) {
        zeroes.push([i,j]);
      }
    }
  }
  return zeroes;
}

function myTranspose (array) {

  const transposed = Array(array.length).fill().map(() => Array(array.length));
  for (let i = 0; i < array.length; i++) {
    for (let j = 0; j < array.length; j++) {
      transposed[i][j] = array[j][i];
    }
  }
  return transposed;
}
