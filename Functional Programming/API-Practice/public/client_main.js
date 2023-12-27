/*Main client-side script*/
/*http://localhost:3001/client_main.js*/

import * as crud from './crud.js';
window.crud = crud;

const fetchUsers = () => fetch('http://localhost:3001/users')
  .then(response => response.json())
  .then(data => document.getElementById('output').innerText = JSON.stringify(data, null, 2));

const promptAndCreateUser = () => {
  const newUsername = prompt('Enter username: ');
  const newUser = { userId: -1, userName: newUsername };
  
  crud.createFetch(newUser)
    .then(fetchUsers);
};

const promptAndGetUsername = () => {
  const userId = prompt('Enter user ID: ');

  crud.findId(userId, user => alert(`Username for user ID ${userId}: ${user.userName}`));
};

const promptAndUpdateUsername = () => {
  const userId = prompt('Enter user ID to update: ');

  crud.findId(userId, () => {
    const updatedUser = prompt('New username');

    crud.updateFetch(userId, updatedUser)
      .then(response => response.ok ? response.json() : Promise.reject(`Bad ${response.status}`))
      .then(updatedUser => {
        alert(`Username updated successfully: ${updatedUser.userName}`);
      })
      .then(fetchUsers)
      .catch(error => console.error('Error:', error));
  });
};

const promptAndDeleteUsername = () => {
  const userId = prompt('Enter user ID to delete: ');

  crud.findId(userId, user => {
    crud.deleteFetch(parseInt(userId))
      .then(response => response.ok ? response.json() : Promise.reject(`Bad response ${response.status}`))
      .catch(error => console.error('Error:', error))
      .then(fetchUsers);

    alert(`Username ${user.userName} was successfully deleted`);
  });
};

const wipeUsers = () => {
  crud.deleteFetch()
    .then(() => alert('Userbase wiped successfully'))
    .then(fetchUsers);
};

const hideUsers = () => {
  document.getElementById('output').innerText = '';
};

// Attach functions to the window object
window.fetchUsers = fetchUsers;
window.createUser = promptAndCreateUser;
window.getUsername = promptAndGetUsername;
window.updateUsername = promptAndUpdateUsername;
window.deleteUsername = promptAndDeleteUsername;
window.wipe = wipeUsers;
window.hideUsers = hideUsers;
