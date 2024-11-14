<<<<<<< HEAD
﻿  function previewImage(event) {
    const file = event.target.files[0];
    const preview = document.getElementById('image-preview');
    
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        preview.style.backgroundImage = `url('${e.target.result}')`;
        preview.style.backgroundSize = 'cover';
        preview.style.backgroundPosition = 'center';
        preview.innerHTML = ''; 
      };
      reader.readAsDataURL(file);
    }
  }
=======
﻿document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();

    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;

    fetch('/Account/Login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ username: username, password: password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.href = "/Home/Index"; // Redirect on success
        } else {
            document.getElementById("loginMessage").innerText = data.message; // Show error message
        }
    })
    .catch(error => console.error('Error:', error));
});
>>>>>>> a852af922b337383ee5e913b60275423930202cc
