/* CRUD functions module */


//Fetch methods
export function createFetch(){
  fetch('http://localhost:3001/users', {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({ userId: parseInt(userId), userName: updatedUser })
  })
}

export function readFetch(){
  fetch('http::/localhost:3001/users',{
    method: 'GET',
    headers: {'Content-Type': 'application/json'}
  })
}

export function updateFetch(){
  fetch('http::/localhost:3001/users',{
    method: 'PATCH',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({ userId: parseInt(userId), userName: updatedUser })
  })
}

export function deleteFetch(){
  fetch('http::/localhost:3001/users',{
    method: 'DELETE',
    headers: {'Content-Type': 'application/json'}
  })
}

export function findId(userId, crudAction){
  readFetch()
    .then(response => {
      if (!response.ok){
        throw new Error ('bad response');
      }
      return response.json();
    })
    .then(data => {
      const users = Array.isArray(data) ? data : [data];
      const user = users.find(u => u.userId === parseInt(userId));

      if(user){
        crudAction()
      } else {
        alert(`User with ID ${userId} not found.`);
      }
    })
    .catch(error => {
      console.error('bad retrieving user', error);
      alert('bad retrieving user');
    });
}
