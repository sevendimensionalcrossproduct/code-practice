let userJSON = 'http://localhost:3001/users';

//FETCH USERS
function fetchUsers(){
  fetch('http://localhost:3001/users')
    .then(response=> response.json())
    .then(data => displayOutput(data));
}

//CREATE NEW USER
function createUser(){
  const newUsername = prompt('Enter username: ');
  const newUser = { userId: -1, userName: newUsername }; //userId calculated by API

  fetch('http://localhost:3001/users', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(newUser),
  })
  .then(fetchUsers());
} 

//DISPLAY USERNAME
function getUsername() {
  const userId = prompt('Enter user ID to find: ');
  
  fetch (userJSON, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
    },
  })

  .then(response => {
    if (!response.ok){
      throw new Error ('bad response');
    }
      return response.json();
    })

  .then(data => {
    const users = Array.isArray(data) ? data : [data];
    const user = users.find(u => u.userId === parseInt(userId));  

    if (user) {
      alert(`Username for user ID ${userId}: ${user.userName}`);
    } else {
      alert(`User with ID ${userId} not found.`);
    }
  })

  .catch(error => {
    console.error('bad retrieving user', error);
    alert(' bad retrieving user');
  });
}

//UPDATE USERNAME
function updateUsername() {
  const userId = prompt('Enter user ID to find: ');
  
  fetch (userJSON, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
    },
  })

  .then(response => {
    if (!response.ok){
      throw new Error ('bad response');
    }
      return response.json();
    })

  .then(data => {
    const users = Array.isArray(data) ? data : [data];
    const user = users.find(u => u.userId === parseInt(userId));  

    if (user) {
      const updatedUser = prompt('new username');

      fetch(`http://localhost:3001/users/${userId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ userId: parseInt(userId), userName: updatedUser }),
      })

      .then(response => {
        if (!response.ok) {
          throw new Error(`bad ${response.status}`);
        }
        return response.json();
      })

      .then(updatedUser => {
        alert(`Username updated successfully: ${updatedUser.userName}`);
      })
        
    } else {
      alert(`User with ID ${userId} not found.`);
    }
  })
  
  .then(fetchUsers)

  .catch(error => {
    console.error('bad retrieving user', error);
    alert(' bad retrieving user');
  });
}

//DELETE USER
function deleteUsername() {
  const userId = parseInt(prompt('id'));
  
fetch(`http://localhost:3001/users/${userId}`, {
  method: 'DELETE',
  headers: {
    'Content-Type': 'application/json',
  },
})
.then(response => {
  if (!response.ok) {
    throw new Error(`HTTP error! Status: ${response.status}`);
  }
  return response.json();
})
.then(fetchUsers())
.catch(error => {
  console.error('Error:', error);
});
}

//WIPE JSON STORAGE
function wipe(){
  fetch('http://localhost:3001/users', {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json',
    },
  })
    fetchUsers();
}

//Misc
function displayOutput(data) {
  document.getElementById('output').innerText = JSON.stringify(data, null, 2);
}

function hideUsers() {
  document.getElementById('output').innerText = ''
}

