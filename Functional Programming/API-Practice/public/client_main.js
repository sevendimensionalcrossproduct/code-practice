/*Main client-side script*/
/*http://localhost:3001/client_main.js*/

import * as crud from './crudB.js';
window.crud = crud;

//FETCH USER
window.fetchUsers = function(){
  fetch('http://localhost:3001/users')
    .then(response => response.json())
    .then (data => document.getElementById('output').innerText = JSON.stringify(data, null, 2))
}

//CREATE NEW USER
window.createUser= function(){
  const newUsername = prompt('Enter username: ');
  const newUser = { userId: -1, userName: newUsername };
  
  crud.createFetch(newUser)
    .then(fetchUsers);
}

//DISPLAY userName
window.getUsername = function() {
  const userId = prompt('Enter user ID: ');

  crud.findId(userId, (user) => {
    alert(`Username for user ID ${userId}: ${user.userName}`)
  })
}

//UPDATE userName
window.updateUsername = function() {
  const userId = prompt('Enter user ID to update: ');

  crud.findId(userId, () =>{
    const updatedUser = prompt('new username');

    crud.updateFetch(userId, updatedUser)
      .then(response => {
        if(!response.ok){
          throw new Error(`bad ${response.status}`);
        }
        return response.json();
      })
      
      .then(updatedUser => {
        alert(`Username updated successfully: ${updatedUser.userName}`);
      })
      .then(fetchUsers);
  })
}

window.deleteUsername = function() {
  const userId = prompt('Enter user ID to delete: ');

  crud.findId(userId, (user) =>{
    crud.deleteFetch(parseInt(userId))
      .then(response => {
        if (!response.ok){
          throw new Error(`bad response ${response.status}`)
        }
        return response.json();
      })
      
      .catch(error =>{
        console.error('error:', error);
      })
      
      .then(fetchUsers)

      alert(`username ${user.userName} was successfully deleted`);
  })
}

//WIPE JSON STORAGE
window.wipe = function(){
  crud.deleteFetch()
    .then(alert('userbase wiped successfully'))
    .then(fetchUsers);
}

//Hide JSON div
window.hideUsers = function() {
  document.getElementById('output').innerText = ''
}
