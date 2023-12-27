/* CRUD functions module */
/*http://localhost:3001/crudB.js*/


//Fetch methods
export function createFetch(updatedUser){
  return fetch('http://localhost:3001/users', {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify(updatedUser)
  });
}

export function readFetch(){
  return fetch('http://localhost:3001/users',{
    method: 'GET',
    headers: {'Content-Type': 'application/json'}
  })
}

export function updateFetch(userId, updatedUser){
  return fetch(`http://localhost:3001/users/${userId}`,{
    method: 'PATCH',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({ userId: parseInt(userId), userName: updatedUser })
  })
}

export function deleteFetch(input){
  const url = input ? `http://localhost:3001/users/${input}` : 'http://localhost:3001/users';
  return fetch(url, {
    method: 'DELETE',
    headers: {'Content-Type': 'application/json'}
  })
}

export async function findId(userId, crudAction){
  return readFetch()
    .then(response => {
      if (!response.ok){
        throw new Error ('bad response');
      }
      return response.json();
    })
    .then(data => {
      const users = data;
      const user = users.find(u => u.userId === parseInt(userId));

      if(user){
        crudAction(user)
      } else {
        alert(`User with ID ${userId} not found.`);
      }
    })
    .catch(error => {
      console.error('bad retrieving user', error);
      alert('bad retrieving user');
    });
}

export function specifyId(message, action){
  const userId = prompt(message);

  if (userId !== null){
    action()
  } else {
    alert('No ID provided');
  }
}
